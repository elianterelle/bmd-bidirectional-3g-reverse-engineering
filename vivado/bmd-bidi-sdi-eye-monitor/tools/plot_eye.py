#!/usr/bin/env python3
"""Plot a 2D statistical eye from the ila_eye capture in src/rtl/rx.v.

Input is the CSV written by the Vivado Hardware Manager:

    write_hw_ila_data -csv_file eye.csv [upload_hw_ila_data $ila]

Each captured sample is one eye point (the ILA is qualified on es_point_valid),
carrying the raw ES_HORZ_OFFSET / ES_VERT_OFFSET codes plus the error and
sample counters read back over DRP. This script decodes the offset encodings
from UG482 Table 4-20, turns the counters into a BER per point, and renders the
raster as a heatmap.

    ./plot_eye.py eye.csv -o eye.png

The prescale must match ES_PRESCALE_VAL in rx.v (default 4) or the BER scale
will be wrong by a constant factor. The eye shape is unaffected.
"""

import argparse
import csv
import math
import sys
from pathlib import Path

import numpy as np

# Substrings identifying each probe. Vivado prefixes the hierarchical path and
# appends the bit range, e.g. "rx_inst/es_point_index[15:0]".
PROBES = {
    "index": "es_point_index",
    "err": "es_error_count",
    "smp": "es_sample_count",
    "horz": "es_horz_offset",
    "vert": "es_vert_offset",
}


# --------------------------------------------------------------------------
# CSV parsing
# --------------------------------------------------------------------------
def find_header(rows):
    """Return (header_index, column_map). Vivado puts metadata above the header."""
    for i, row in enumerate(rows):
        cols = {}
        for j, name in enumerate(row):
            for key, needle in PROBES.items():
                if needle in name:
                    cols[key] = j
        if len(cols) == len(PROBES):
            return i, cols
    raise SystemExit(
        "could not find a header row containing all of: "
        + ", ".join(PROBES.values())
        + "\nIs this a Vivado ILA CSV export from the ila_eye core?"
    )


def find_radices(rows, ncols):
    """Locate the per-column radix line.

    Vivado writes it directly *below* the header, and folds the label into the
    first column, e.g.

        Radix - UNSIGNED,UNSIGNED,HEX,HEX,...

    so field 0 is both the label and column 0's radix. Radices are per column:
    es_point_index typically comes out UNSIGNED while the rest are HEX, which
    is why this cannot be a single global setting.
    """
    for i, row in enumerate(rows):
        if row and row[0].strip().lower().startswith("radix") and len(row) == ncols:
            fields = [f.strip().upper() for f in row]
            fields[0] = fields[0].split("-", 1)[-1].strip()
            return i, fields
    return None, None


def make_parser(radix):
    """Value parser for one column, given its declared radix."""
    if radix is None:
        # Vivado's default for multi-bit probes is hex. Bare digits are still
        # valid hex, so this is the safe assumption when unlabelled.
        return lambda s: int(s.strip(), 16)
    r = radix
    if "HEX" in r:
        return lambda s: int(s.strip(), 16)
    if "BIN" in r:
        return lambda s: int(s.strip(), 2)
    if "OCT" in r:
        return lambda s: int(s.strip(), 8)
    # UNSIGNED / SIGNED / DEC
    return lambda s: int(s.strip())


def load_points(path, radix_override=None):
    with open(path, newline="") as fh:
        rows = [r for r in csv.reader(fh) if r]

    hdr_i, cols = find_header(rows)
    ncols = len(rows[hdr_i])
    radix_i, radices = find_radices(rows, ncols)

    if radix_override:
        parsers = {k: make_parser(radix_override.upper()) for k in cols}
        radix_note = f"forced {radix_override}"
    elif radices:
        parsers = {k: make_parser(radices[j]) for k, j in cols.items()}
        radix_note = "per-column, from Radix line"
    else:
        parsers = {k: make_parser(None) for k in cols}
        radix_note = "assumed hex"

    skip = {hdr_i} | ({radix_i} if radix_i is not None else set())
    pts = []
    for i, row in enumerate(rows):
        if i in skip or i < hdr_i or len(row) < ncols:
            continue
        try:
            pts.append({k: parsers[k](row[j]) for k, j in cols.items()})
        except ValueError:
            # Blank or annotation lines.
            continue

    if not pts:
        raise SystemExit("no data rows parsed")
    return pts, radix_note


def first_sweep(pts):
    """Trim the capture to a single raster.

    The buffer is a power of two and the raster is not, so a capture always
    runs into the following sweep. es_point_index restarts at 1 each sweep,
    which makes the boundary unambiguous.
    """
    start = next((i for i, p in enumerate(pts) if p["index"] == 1), None)
    if start is None:
        # Trigger position may have cut the start off; fall back to using
        # whatever contiguous run we have.
        start = 0
    end = len(pts)
    for i in range(start + 1, len(pts)):
        if pts[i]["index"] <= pts[i - 1]["index"]:
            end = i
            break
    return pts[start:end]


# --------------------------------------------------------------------------
# UG482 offset decoding
# --------------------------------------------------------------------------
def decode_horz(code):
    """ES_HORZ_OFFSET[10:0] is two's complement; [11] duplicates the sign."""
    v = code & 0x7FF
    return v - 0x800 if v & 0x400 else v


def decode_vert(code):
    """ES_VERT_OFFSET: [6:0] magnitude, [7] sign (1 = negative)."""
    mag = code & 0x7F
    return -mag if (code >> 7) & 1 else mag


# --------------------------------------------------------------------------
# Main
# --------------------------------------------------------------------------
def main():
    ap = argparse.ArgumentParser(
        description="Plot a 2D eye scan from a Vivado ILA CSV export.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    ap.add_argument("csv", type=Path, help="CSV from write_hw_ila_data")
    ap.add_argument("-o", "--out", type=Path, default=Path("eye.png"))
    ap.add_argument("--prescale", type=int, default=4,
                    help="ES_PRESCALE_VAL from rx.v")
    ap.add_argument("--width", type=int, default=20,
                    help="RX_DATA_WIDTH, bits per sample")
    ap.add_argument("--rxout-div", type=int, default=2, choices=[1, 2, 4, 8],
                    help="RXOUT_DIV from rx.v; sets the horizontal UI scale")
    ap.add_argument("--ui-codes", type=int, default=None,
                    help="override codes per UI instead of deriving it "
                         "from --rxout-div")
    ap.add_argument("--radix", choices=["hex", "dec", "bin", "oct"],
                    help="override the CSV radix instead of auto-detecting")
    ap.add_argument("--cmap", default="viridis")
    ap.add_argument("--all-sweeps", action="store_true",
                    help="use every row instead of trimming to one raster")
    ap.add_argument("--show", action="store_true")
    args = ap.parse_args()

    # ES_HORZ_OFFSET codes per UI scale with the PMA serial clock divider D:
    # +/-32 codes = +/-0.5 UI at D=1, +/-64 at D=2, +/-128 at D=4
    # (UG482 Table 4-20). rx.v sets RXOUT_DIV=2, hence 128 codes/UI here.
    ui_codes = args.ui_codes if args.ui_codes else 64 * args.rxout_div

    pts, radix_note = load_points(args.csv, args.radix)
    total_rows = len(pts)
    if not args.all_sweeps:
        pts = first_sweep(pts)

    bits_per_sample = (2 ** (1 + args.prescale)) * args.width

    # Decode and fold onto the raster. Later duplicates (from a following
    # sweep) are ignored rather than averaged, so one capture is one eye.
    cells = {}
    for p in pts:
        h = decode_horz(p["horz"])
        v = decode_vert(p["vert"])
        if (h, v) in cells:
            continue
        total_bits = p["smp"] * bits_per_sample
        cells[(h, v)] = (p["err"], total_bits)

    hs = sorted({h for h, _ in cells})
    vs = sorted({v for _, v in cells})
    if len(hs) < 2 or len(vs) < 2:
        raise SystemExit(
            f"only {len(hs)} column(s) x {len(vs)} row(s) decoded - "
            "the radix is probably being misread (try --radix)"
        )

    h_idx = {h: i for i, h in enumerate(hs)}
    v_idx = {v: i for i, v in enumerate(vs)}

    ber = np.full((len(vs), len(hs)), np.nan)
    floor = np.inf
    for (h, v), (err, total_bits) in cells.items():
        if total_bits <= 0:
            continue
        if err > 0:
            ber[v_idx[v], h_idx[h]] = err / total_bits
        else:
            # No errors: the true BER is below 1/total_bits. Record the floor
            # so these cells plot as "at least this good" rather than dropping
            # out of a log scale.
            ber[v_idx[v], h_idx[h]] = 1.0 / total_bits
            floor = min(floor, 1.0 / total_bits)

    filled = int(np.count_nonzero(~np.isnan(ber)))
    expected = len(hs) * len(vs)

    print(f"rows parsed      : {total_rows} ({radix_note})")
    print(f"points used      : {len(pts)}")
    print(f"raster           : {len(hs)} x {len(vs)} = {expected}")
    print(f"cells filled     : {filled}"
          + ("" if filled == expected else f"  ({expected - filled} MISSING)"))
    print(f"bits per sample  : {bits_per_sample} "
          f"(prescale {args.prescale}, width {args.width})")
    if np.isfinite(floor):
        print(f"BER floor        : {floor:.2e}")
    print(f"horizontal range : {hs[0]} .. {hs[-1]} codes "
          f"({hs[0]/ui_codes:+.3f} .. {hs[-1]/ui_codes:+.3f} UI)")
    print(f"vertical range   : {vs[0]} .. {vs[-1]} codes")

    # Open-eye extent along the centre cuts, for a quick number to quote.
    if 0 in v_idx:
        row = ber[v_idx[0], :]
        open_h = [hs[i] for i in range(len(hs))
                  if np.isfinite(row[i]) and row[i] <= floor]
        if open_h:
            w = (max(open_h) - min(open_h)) / ui_codes
            print(f"eye width  @v=0  : {w:.3f} UI at the BER floor")
    if 0 in h_idx:
        col = ber[:, h_idx[0]]
        open_v = [vs[i] for i in range(len(vs))
                  if np.isfinite(col[i]) and col[i] <= floor]
        if open_v:
            print(f"eye height @h=0  : {max(open_v) - min(open_v)} codes "
                  "at the BER floor")

    import matplotlib
    if not args.show:
        matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    from matplotlib.colors import LogNorm

    finite = ber[np.isfinite(ber)]
    vmin = max(finite.min(), 1e-12)
    vmax = max(finite.max(), vmin * 10)

    fig, ax = plt.subplots(figsize=(9, 5.5), constrained_layout=True)
    x_edges = np.array(hs + [hs[-1] + (hs[-1] - hs[-2])]) - 0.5 * (hs[1] - hs[0])
    y_edges = np.array(vs + [vs[-1] + (vs[-1] - vs[-2])]) - 0.5 * (vs[1] - vs[0])

    mesh = ax.pcolormesh(
        x_edges / ui_codes, y_edges,
        np.ma.masked_invalid(ber),
        cmap=args.cmap, norm=LogNorm(vmin=vmin, vmax=vmax), shading="flat",
    )
    cbar = fig.colorbar(mesh, ax=ax)
    cbar.set_label("BER (floor-limited where no errors were counted)")

    ax.set_xlabel("horizontal offset [UI]")
    ax.set_ylabel("vertical offset [ES_VERT_OFFSET codes]")
    ax.set_title(f"3G-SDI RX statistical eye - {args.csv.name}")
    ax.axhline(0, color="white", lw=0.5, alpha=0.4)
    ax.axvline(0, color="white", lw=0.5, alpha=0.4)

    fig.savefig(args.out, dpi=150)
    print(f"wrote {args.out}")
    if args.show:
        plt.show()


if __name__ == "__main__":
    sys.exit(main())
