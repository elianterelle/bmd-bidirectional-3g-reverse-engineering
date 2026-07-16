This repository contains reverse engineered pinouts, constraint files and example vivado projects to use the Blackmagic Design Micro Converter Bidirectional 3G as a general purpose FPGA Development board with SDI / HDMI connectivity.

## PCB Photos

<div align="center">

![Top side of the PCB](doc/img/bmd-3g-bidi-board-top.png)
    <br>
    <i>Top side of the PCB</i>
    <br><br><br>
</div>

<div align="center">

![Bottom side of the PCB](doc/img/bmd-3g-bidi-board-bottom.png)
    <br>
    <i>Bottom side of the PCB</i>
    <br><br><br>
</div>

## FPGA

The converter uses a Xilinx Artix 7 XC7A25T in the CSG325 package.

### JTAG

The FPGA can be reconfigured using Vivado via the JTAG interface. Fortunately, this is exposed on pads on the bottom of the pcb:

<div align="center">

![JTAG Pinout](doc/img/bmd-3g-bidi-jtag.png)
    <br>
    <i>JTAG Pinout</i>
    <br><br><br>
</div>

### Flash

### IO Banks

| Bank | Voltage |
| ---- | ------- |
| 14   | 3.3V    |
| 15   | ?       |
| 34   | ?       |


### Clock

The Board has a single LVDS 148.425824MHz clock, connected to the MGTREFCLK1 Pins. This can be used as a reference clock for the GTP Transceivers, but also for the FPGA Logic.

## LEDs

The two LEDs SDI_LOCK and HDMI_LOCK are connected to the FPGA and switched at their low side, so driving the FPGA pins low turns on the LED, driving it HIGH turns it off.

| LED       | FPGA Package Pin | FPGA Pin Name |
| --------- | ---------------- | ------------- |
| SDI_LOCK  |                  |               |
| HDMI_LOCK |                  |               |

## SDI Driver (Output)

The SDI Driver, a Texas Instruments LMH0307, is connected to the following pins of the FPGA:

| LMH0307 Pin | FPGA Package Pin | FPGA Pin Name |
| ----------- | ---------------- | ------------- |
| RSTI        |                  |               |
| ENABLE      |                  |               |
| SDA         |                  |               |
| SCL         |                  |               |
| FAULT       | ?                | ?             |
| SDI_P       |                  |               |
| SDI_N       |                  |               |

## SDI Equalizer (Input)

The SDI Equalizer, a Texas Instruments LMH0324, is connected to the following pins of the FPGA:

| LMH0324 Pin | FPGA Package Pin | FPGA Pin Name |
| ----------- | ---------------- | ------------- |
| CD_N        | ?                | ?             |
| SS_N        | ?                | ?             |
| MISO        | ?                | ?             |
| MOSI        | ?                | ?             |
| SCK         | ?                | ?             |
| SDA         | ?                | ?             |
| SCL         | ?                | ?             |
| OUT0_P      | ?                | ?             |
| OUT0_N      | ?                | ?             |

with the following configuration Pins:

| LMH0324 Pin | Connected To |
| ----------- | ------------ |
| IN_OUT_SEL  | ?            |
| OUT_CTRL    | ?            |
| VOD_DE      | ?            |
| MODE_SEL    | ?            |
| ADDR0       | ?            |
| ADDR1       | ?            |

## HDMI Retimer (Input)

The HDMI Input uses a Texas Instruments TMDS171 retimer.

| TMDS171 Pin | FPGA Package Pin | FPGA Pin Name |
| ----------- | ---------------- | ------------- |
| OUT_D0_P    | ?                | ?             |
| OUT_D0_N    | ?                | ?             |
| OUT_D1_P    | ?                | ?             |
| OUT_D1_N    | ?                | ?             |
| OUT_D2_P    | ?                | ?             |
| OUT_D2_N    | ?                | ?             |
| OUT_CLK_P   | ?                | ?             |
| OUT_CLK_N   | ?                | ?             |
| SDA_SNK     | ?                | ?             |
| SCL_SNK     | ?                | ?             |
| HPD_SNK     | ?                | ?             |
| SPDIF_IN    | ?                | ?             |
| ARC_OUT     | ?                | ?             |
| OE          | ?                | ?             |
| SIG_EN      | ?                | ?             |
| PRE_SEL     | ?                | ?             |
| SDA_CTL     | ?                | ?             |
| SCL_CTL     | ?                | ?             |
| I2C_EN/PIN  | ?                | ?             |
| EQ_SEL/A0   | ?                | ?             |
| A1          | ?                | ?             |
| TX_TERM_CTL | ?                | ?             |
| SWAP/POL    | ?                | ?             |

## HDMI Driver (Output)

The HDMI Output uses a Texas Instruments TDP158 retimer / driver.

| TDP158 Pin   | FPGA Package Pin | FPGA Pin Name |
| ------------ | ---------------- | ------------- |
| IN_D0_P      | ?                | ?             |
| IN_D0_N      | ?                | ?             |
| IN_D1_P      | ?                | ?             |
| IN_D1_N      | ?                | ?             |
| IN_D2_P      | ?                | ?             |
| IN_D2_N      | ?                | ?             |
| IN_CLK_P     | ?                | ?             |
| IN_CLK_N     | ?                | ?             |
| HPD_SRC      | ?                | ?             |
| SDA_SRC      | ?                | ?             |
| SCL_SRC      | ?                | ?             |
| OE           | ?                | ?             |
| I2C_EN       | ?                | ?             |
| SDA_CTL/PRE  | ?                | ?             |
| SCL_CTL/SWAP | ?                | ?             |
| A0/EQ1       | ?                | ?             |
| A1/EQ2       | ?                | ?             |
| SLEW         | ?                | ?             |
| TERM         | ?                | ?             |

## Microcontroller

The STM32F072VBH6 is connected to the USB-C Port and to the FPGA in a currently unknown way. There are pads labeled `rx` and `tx` next to it. It might be possible to use these to flash the stm32 via usart, but i haven't tested this yet.

# Reverse Engineering Techniques

## Pin Mapping

The Vivado Project in `vivado/bmd-bidi-pin-mapping` can be used to map out which pins of the fpga connect to pins of other chips / leds / ...

It configures all pins as inputs and connects them to an ILA core. A 10k resistor connected to gnd or the bank voltage can then be touched to a pin to pull up / down the signal. This can then be seen in the ILA Debugger.

# Example Vivado Projects

There are a few example Vivado Projects located in `/vivado/`. Every project directory includes a `README.md` with a brief description.

| Project              | Description                                                |
| -------------------- | ---------------------------------------------------------- |
| bmd-bidi-pin-mapping | See above                                                  |
| bmd-bidi-blink       | Blinks both LEDs using a simple counter at different rates |
| bmd-bidi-hd-sdi-out  | Outputs a changing solid color over HD-SDI (1080p30)       |
