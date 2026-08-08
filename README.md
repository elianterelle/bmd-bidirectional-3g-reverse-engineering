This repository contains reverse engineered pinouts, constraint files and example vivado projects to use the Blackmagic Design Micro Converter Bidirectional 3G as a general purpose FPGA development board with SDI / HDMI connectivity.

## PCB Photos

<div align="center">

![Top side of the PCB](doc/img/compressed/bmd-3g-bidi-board-top.jpg)
    <br>
    <i>Top side of the PCB</i>
    <br><br><br>
</div>

<div align="center">

![Bottom side of the PCB](doc/img/compressed/bmd-3g-bidi-board-bottom.jpg)
    <br>
    <i>Bottom side of the PCB</i>
    <br><br><br>
</div>

## FPGA

The converter uses a Xilinx Artix 7 XC7A25T in the CSG325 package.

### JTAG

The FPGA can be reconfigured using Vivado via the JTAG interface. Fortunately, this is exposed on pads on the bottom of the pcb:

<div align="center">

![JTAG Pinout](doc/img/compressed/bmd-3g-bidi-jtag.jpg)
    <br>
    <i>JTAG Pinout</i>
    <br><br><br>
</div>

### Flash

The flash attached to the FPGA is a Macronix MX25L3233F it can be selected in the Vivado Hardware Manager (`xc7a25t`->`Add Configuration Memory Device`) and works out of the box.

### IO Banks

| Bank | Voltage |
| ---- | ------- |
| 14   | 3.3V    |
| 15   | 1.8V    |
| 34   | 1.2V    |


### Clock

The Board has a single LVDS 148.425824MHz clock, connected to the MGTREFCLK1 Pins. This can be used as a reference clock for the GTP Transceivers, but also for the FPGA Logic.

## LEDs

The two LEDs SDI_LOCK and HDMI_LOCK are connected to the FPGA and switched at their low side, so driving the FPGA pins low turns on the LED, driving it HIGH turns it off.

| LED       | FPGA Package Pin | FPGA Bank | FPGA Pin Name         |
| --------- | ---------------- | --------- | --------------------- |
| SDI_LOCK  | U9               | 14        | IO_L10P_T1_D14_14     |
| HDMI_LOCK | N18              | 14        | IO_L24P_T3_A01_D17_14 |

## Testpoints

There are three Testpoints right next to the FPGA:

| Testpoint | FPGA Package Pin | FPGA Bank | FPGA Pin Name      |
| --------- | ---------------- | --------- | ------------------ |
| TP3       | R1               | 34        | IO_L13N_T2_MRCC_34 |
| TP4       | U1               | 34        | IO_L15N_T2_DQS_34  |
| TP5       | P1               | 34        | IO_L9N_T1_DQS_34   |

## SDI Driver (Output)

The SDI Driver, a Texas Instruments LMH0307, is connected to the following pins of the FPGA:

| LMH0307 Pin | FPGA Package Pin | FPGA Bank | FPGA Pin Name      |
| ----------- | ---------------- | --------- | ------------------ |
| RSTI        | R15              | 14        | IO_L12N_T1_MRCC_14 |
| ENABLE      | R17              | 14        | IO_L14N_T2_SRCC_14 |
| SDA         | T15              | 14        | IO_L13N_T2_MRCC_14 |
| SCL         | T14              | 14        | IO_L13P_T2_MRCC_14 |
| FAULT       | P14              | 14        | IO_L12P_T1_MRCC_14 |
| SDI_P       | H2               | 216       | MGTPTXP0_216       |
| SDI_N       | H1               | 216       | MGTPTXN0_216       |

## SDI Equalizer (Input)

The SDI Equalizer, a Texas Instruments LMH0324, is connected to the following pins of the FPGA:

| LMH0324 Pin | FPGA Package Pin | FPGA Bank | FPGA Pin Name      |
| ----------- | ---------------- | --------- | ------------------ |
| CD_N        | NC               | NC        | NC                 |
| SS_N_ADDR0  | A12              | 15        | IO_L7N_T1_AD10N_15 |
| MISO_ADDR1  | A15              | 15        | IO_L10N_T1_AD4N_15 |
| MOSI_SDA    | A14              | 15        | IO_L8N_T1_AD3N_15  |
| SCK_SCL     | A13              | 15        | IO_L8P_T1_AD3P_15  |
| OUT0_P      | G3               | 216       | MGTPRXN3_216       |
| OUT0_N      | G4               | 216       | MGTPRXP3_216       |

with the following configuration Pins:

| LMH0324 Pin | Connected To  |
| ----------- | ------------- |
| IN_OUT_SEL  | NC            |
| OUT_CTRL    | NC            |
| VOD_DE      | 1K to VDD (H) |
| MODE_SEL    | NC (SPI)      |

## HDMI Retimer (Input)

The HDMI Input uses a Texas Instruments TMDS171 retimer.

Note: The differential pairs between the HDMI Connector and the retimer are both lane swapped and polarity swapped (if we assume i traced them correctly). Due to the SWAP_POL Pin being pulled low, lane swapping is already active. Polarity swapping has to be enabled via I2C (or maybe the data can be inverted in the fpga).

When lane and polarity swapping are enabled in the TMDS171, the signals are internally routed to the correct outputs, so the following pin mapping to the FPGA is correct.

| TMDS171 Pin | FPGA Package Pin | FPGA Bank | FPGA Pin Name           |
| ----------- | ---------------- | --------- | ----------------------- |
| OUT_D0_P    | E4               | 216       | MGTPRXP0_216            |
| OUT_D0_N    | E3               | 216       | MGTPRXN0_216            |
| OUT_D1_P    | C4               | 216       | MGTPRXP2_216            |
| OUT_D1_N    | C3               | 216       | MGTPRXN2_216            |
| OUT_D2_P    | A4               | 216       | MGTPRXP1_216            |
| OUT_D2_N    | A3               | 216       | MGTPRXN1_216            |
| OUT_CLK_P   | D6               | 216       | MGTREFCLK0P_216         |
| OUT_CLK_N   | D5               | 216       | MGTREFCLK0N_216         |
| SDA_SNK     | U15              | 14        | IO_L17P_T2_A14_D30_14   |
| SCL_SNK     | N14              | 14        | IO_L8N_T1_D12_14        |
| OE          | M15              | 14        | IO_L6N_T0_D08_VREF_14   |
| SDA_CTL     | K17              | 14        | IO_L4P_T0_D04_14        |
| SCL_CTL     | K18              | 14        | IO_L3N_T0_DQS_EMCCLK_14 |
| HPD_SNK     | R13              | 14        | IO_L19P_T3_A10_D26_14   |


| TMDS171 Pin | Connected To           |
| ----------- | ---------------------- |
| IN_CLK_N    | HDMI IN D2_P           |
| IN_CLK_P    | HDMI IN D2_N           |
| IN_D0_N     | HDMI IN D1_P           |
| IN_D0_P     | HDMI IN D1_N           |
| IN_D1_N     | HDMI IN D0_P           |
| IN_D1_P     | HDMI IN D0_N           |
| IN_D2_N     | HDMI IN CLK_P          |
| IN_D2_P     | HDMI IN CLK_N          |
| HPD_SRC     | HDMI IN HPD            |
| SPDIF_IN    | 10K -> GND             |
| ARC_OUT     | NC                     |
| SIG_EN      | NC (Unpop. Res -> GND) |
| PRE_SEL     | NC                     |
| I2C_EN/PIN  | 10K -> VCC             |
| EQ_SEL/A0   | 10K -> GND             |
| A1          | GND                    |
| TX_TERM_CTL | 10K -> VCC             |
| SWAP/POL    | 10K -> GND             |

## HDMI Driver (Output)

The HDMI Output uses a Texas Instruments TDP158 retimer / driver.

| TDP158 Pin   | FPGA Package Pin | FPGA Bank | FPGA Pin Name |
| ------------ | ---------------- | --------- | ------------- |
| IN_D0_P      | ?                | ?         | ?             |
| IN_D0_N      | ?                | ?         | ?             |
| IN_D1_P      | ?                | ?         | ?             |
| IN_D1_N      | ?                | ?         | ?             |
| IN_D2_P      | ?                | ?         | ?             |
| IN_D2_N      | ?                | ?         | ?             |
| IN_CLK_P     | ?                | ?         | ?             |
| IN_CLK_N     | ?                | ?         | ?             |
| HPD_SRC      | ?                | ?         | ?             |
| SDA_SRC      | ?                | ?         | ?             |
| SCL_SRC      | ?                | ?         | ?             |
| OE           | ?                | ?         | ?             |
| I2C_EN       | ?                | ?         | ?             |
| SDA_CTL/PRE  | ?                | ?         | ?             |
| SCL_CTL/SWAP | ?                | ?         | ?             |
| A0/EQ1       | ?                | ?         | ?             |
| A1/EQ2       | ?                | ?         | ?             |
| SLEW         | ?                | ?         | ?             |
| TERM         | ?                | ?         | ?             |

## Microcontroller

The STM32F072VBH6 is connected to the USB-C Port and to the FPGA in a currently unknown way. There are pads labeled `rx` and `tx` next to it. It might be possible to use these to flash the stm32 via usart, but i haven't tested this yet.

### Microcontroller <-> FPGA Pin Mapping

| STM32 Pin | FPGA Package Pin | FPGA Bank | FPGA Pin Name             |
| --------- | ---------------- | --------- | ------------------------- |
| PE0       | T10              |           | INIT_B_0                  |
| PE1       | P10              |           | PROGRAM_B_0               |
| PE2       | F12              |           | DONE_0                    |
| PB2       | T17              | 14        | IO_L16P_T2_CSI_B_14       |
| PE12      | L14              | 14        | IO_0_14                   |
| PB13      | V13              | 14        | IO_L21N_T3_DQS_A06_D22_14 |
| PB15      | U17              | 14        | IO_L16N_T2_A15_D31_14     |

### Microcontroller Pin Mapping

| STM32 Pin | Connected To                  |
| --------- | ----------------------------- |
| PC7       | PWR LED (-)                   |
| PA11      | USB D-                        |
| PA12      | USB D+                        |
| BOOT0     | Button next to STM32 (to VDD) |
| PA0       | Testpad TX                    |
| PA1       | Testpad RX                    |
| PA13      | Small Testpad Left (SWDIO)    |
| PA14      | Small Testpad Right (SWCLK)   |

# Reverse Engineering Techniques

## Pin Mapping

The Vivado Project in `vivado/bmd-bidi-pin-mapping` can be used to map out which pins of the fpga connect to pins of other chips / leds / ...

It configures all pins as inputs and connects them to an ILA core. A 10k resistor connected to gnd or the bank voltage can then be touched to a pin to pull up / down the signal. This can then be seen in the ILA Debugger.

# Example Vivado Projects

There are a few example Vivado Projects located in `/vivado/`. Every project directory includes a `README.md` with a brief description.

| Project              | Description                                                                                                           |
| -------------------- | --------------------------------------------------------------------------------------------------------------------- |
| bmd-bidi-pin-mapping | See above                                                                                                             |
| bmd-bidi-blink       | Blinks both LEDs using a simple counter at different rates                                                            |
| bmd-bidi-hd-sdi-out  | Outputs SMPTE Color Bars or a Pathological Pattern via HD-SDI (1080p30, not fully compliant, crc not implemented yet) |
|                      |                                                                                                                       |

