# bmd-bidi-hd-sdi-out

Outputs SMPTE Bars or a pathological test pattern (changeable in `src/rtl/top.v` starting at line 135) at 1080p30 on the SDI Output.

CRC calculation isn't implemented yet, so this implementation is technically not smpte compliant.

It also blinks both LEDs, just like `bmd-bidi-blink`.

This demo uses the `gtx_tx_reset_controller` from [https://github.com/hamsternz/FPGA_DisplayPort](https://github.com/hamsternz/FPGA_DisplayPort) written by Mike Field.