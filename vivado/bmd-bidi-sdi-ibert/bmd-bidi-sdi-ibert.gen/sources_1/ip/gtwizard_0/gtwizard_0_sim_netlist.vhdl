-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
-- Date        : Sun Aug  9 22:42:02 2026
-- Host        : fpga-dev running 64-bit Ubuntu 24.04.1 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/elian/Documents/git/elian/bmd-bidirectional-3g-reverse-engineering/vivado/bmd-bidi-sdi-ibert/bmd-bidi-sdi-ibert.gen/sources_1/ip/gtwizard_0/gtwizard_0_sim_netlist.vhdl
-- Design      : gtwizard_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a25tcsg325-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block is
  port (
    data_out : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt0_rxusrclk2_in : in STD_LOGIC
  );
end gtwizard_0_sync_block;

architecture STRUCTURE of gtwizard_0_sync_block is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => Q(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block_0 is
  port (
    data_out : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt0_rxusrclk2_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_0_sync_block_0 : entity is "gtwizard_0_sync_block";
end gtwizard_0_sync_block_0;

architecture STRUCTURE of gtwizard_0_sync_block_0 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => Q(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block_1 is
  port (
    data_out : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt0_rxusrclk2_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_0_sync_block_1 : entity is "gtwizard_0_sync_block";
end gtwizard_0_sync_block_1;

architecture STRUCTURE of gtwizard_0_sync_block_1 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => Q(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk2_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block_10 is
  port (
    \FSM_sequential_rx_state_reg[1]\ : out STD_LOGIC;
    time_out_2ms_reg : out STD_LOGIC;
    data_sync_reg6_0 : out STD_LOGIC;
    reset_time_out_reg : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    reset_time_out_reg_0 : in STD_LOGIC;
    reset_time_out_reg_1 : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_0\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_1\ : in STD_LOGIC;
    rxresetdone_s3 : in STD_LOGIC;
    gt0_pll0lock_in : in STD_LOGIC;
    sysclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_0_sync_block_10 : entity is "gtwizard_0_sync_block";
end gtwizard_0_sync_block_10;

architecture STRUCTURE of gtwizard_0_sync_block_10 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal pll0lock_sync : STD_LOGIC;
  signal reset_time_out_i_2_n_0 : STD_LOGIC;
  signal reset_time_out_i_3_n_0 : STD_LOGIC;
  signal reset_time_out_i_4_n_0 : STD_LOGIC;
  signal reset_time_out_i_5_n_0 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of reset_time_out_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of reset_time_out_i_5 : label is "soft_lutpair2";
begin
\FSM_sequential_rx_state[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3202000000000000"
    )
        port map (
      I0 => pll0lock_sync,
      I1 => Q(3),
      I2 => Q(2),
      I3 => rxresetdone_s3,
      I4 => Q(1),
      I5 => Q(0),
      O => data_sync_reg6_0
    );
\FSM_sequential_rx_state[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222000003000000"
    )
        port map (
      I0 => \FSM_sequential_rx_state_reg[0]\,
      I1 => \FSM_sequential_rx_state_reg[0]_0\,
      I2 => pll0lock_sync,
      I3 => \FSM_sequential_rx_state_reg[0]_1\,
      I4 => Q(0),
      I5 => Q(1),
      O => time_out_2ms_reg
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_pll0lock_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync5,
      Q => pll0lock_sync,
      R => '0'
    );
reset_time_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => reset_time_out_reg,
      I1 => reset_time_out_i_2_n_0,
      I2 => Q(1),
      I3 => reset_time_out_i_3_n_0,
      I4 => reset_time_out_i_4_n_0,
      I5 => reset_time_out_reg_0,
      O => \FSM_sequential_rx_state_reg[1]\
    );
reset_time_out_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => Q(1),
      I1 => \FSM_sequential_rx_state_reg[0]_1\,
      I2 => pll0lock_sync,
      I3 => Q(3),
      I4 => Q(2),
      O => reset_time_out_i_2_n_0
    );
reset_time_out_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0B08"
    )
        port map (
      I0 => rxresetdone_s3,
      I1 => Q(2),
      I2 => Q(3),
      I3 => pll0lock_sync,
      O => reset_time_out_i_3_n_0
    );
reset_time_out_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00333333FF00FC88"
    )
        port map (
      I0 => reset_time_out_reg_1,
      I1 => Q(2),
      I2 => reset_time_out_i_5_n_0,
      I3 => Q(0),
      I4 => Q(1),
      I5 => Q(3),
      O => reset_time_out_i_4_n_0
    );
reset_time_out_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_sequential_rx_state_reg[0]_1\,
      I1 => pll0lock_sync,
      O => reset_time_out_i_5_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block_11 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    gt0_rxusrclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_0_sync_block_11 : entity is "gtwizard_0_sync_block";
end gtwizard_0_sync_block_11;

architecture STRUCTURE of gtwizard_0_sync_block_11 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block_12 is
  port (
    data_out : out STD_LOGIC;
    gt0_rx_fsm_reset_done_out : in STD_LOGIC;
    gt0_rxusrclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_0_sync_block_12 : entity is "gtwizard_0_sync_block";
end gtwizard_0_sync_block_12;

architecture STRUCTURE of gtwizard_0_sync_block_12 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => gt0_rx_fsm_reset_done_out,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block_13 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    sysclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_0_sync_block_13 : entity is "gtwizard_0_sync_block";
end gtwizard_0_sync_block_13;

architecture STRUCTURE of gtwizard_0_sync_block_13 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block_2 is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \rxrate_sss_reg[0]\ : out STD_LOGIC;
    data_sync_reg6_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \FSM_sequential_state_reg[2]\ : in STD_LOGIC;
    old_rxrate : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_state_reg[1]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \FSM_sequential_state_reg[1]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxrate_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt0_drpclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_0_sync_block_2 : entity is "gtwizard_0_sync_block";
end gtwizard_0_sync_block_2;

architecture STRUCTURE of gtwizard_0_sync_block_2 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal \^rxrate_sss_reg[0]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_1\ : label is "soft_lutpair29";
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
begin
  data_out <= \^data_out\;
  \rxrate_sss_reg[0]\ <= \^rxrate_sss_reg[0]\;
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C3C8F0C8"
    )
        port map (
      I0 => \^rxrate_sss_reg[0]\,
      I1 => Q(0),
      I2 => Q(1),
      I3 => Q(2),
      I4 => \FSM_sequential_state_reg[2]\,
      O => D(0)
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA2AAA2"
    )
        port map (
      I0 => Q(2),
      I1 => \FSM_sequential_state_reg[2]\,
      I2 => Q(1),
      I3 => Q(0),
      I4 => \^rxrate_sss_reg[0]\,
      O => D(1)
    );
\FSM_sequential_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \FSM_sequential_state_reg[1]\(0),
      I1 => \^data_out\,
      I2 => \FSM_sequential_state_reg[1]\(1),
      I3 => \FSM_sequential_state_reg[1]_0\(0),
      I4 => \FSM_sequential_state_reg[1]_0\(1),
      I5 => \FSM_sequential_state_reg[1]\(2),
      O => \^rxrate_sss_reg[0]\
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => gt0_rxrate_in(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
\rxrate_o[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCAAAACAAA"
    )
        port map (
      I0 => \^data_out\,
      I1 => old_rxrate(0),
      I2 => \^rxrate_sss_reg[0]\,
      I3 => Q(0),
      I4 => Q(1),
      I5 => Q(2),
      O => data_sync_reg6_0(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block_3 is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out : out STD_LOGIC;
    old_rxrate : in STD_LOGIC_VECTOR ( 0 to 0 );
    \rxrate_o_reg[1]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxrate_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt0_drpclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_0_sync_block_3 : entity is "gtwizard_0_sync_block";
end gtwizard_0_sync_block_3;

architecture STRUCTURE of gtwizard_0_sync_block_3 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => gt0_rxrate_in(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
\rxrate_o[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCAAAACAAA"
    )
        port map (
      I0 => \^data_out\,
      I1 => old_rxrate(0),
      I2 => \rxrate_o_reg[1]\,
      I3 => Q(0),
      I4 => Q(1),
      I5 => Q(2),
      O => D(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block_4 is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out : out STD_LOGIC;
    old_rxrate : in STD_LOGIC_VECTOR ( 0 to 0 );
    \rxrate_o_reg[2]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxrate_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt0_drpclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_0_sync_block_4 : entity is "gtwizard_0_sync_block";
end gtwizard_0_sync_block_4;

architecture STRUCTURE of gtwizard_0_sync_block_4 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => gt0_rxrate_in(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
\rxrate_o[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCAAAACAAA"
    )
        port map (
      I0 => \^data_out\,
      I1 => old_rxrate(0),
      I2 => \rxrate_o_reg[2]\,
      I3 => Q(0),
      I4 => Q(1),
      I5 => Q(2),
      O => D(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block_5 is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_state_reg[0]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    data_in : in STD_LOGIC;
    gt0_drpclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_0_sync_block_5 : entity is "gtwizard_0_sync_block";
end gtwizard_0_sync_block_5;

architecture STRUCTURE of gtwizard_0_sync_block_5 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal rxpmaresetdone_ss : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
begin
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22C022EE"
    )
        port map (
      I0 => \FSM_sequential_state_reg[0]\,
      I1 => Q(0),
      I2 => rxpmaresetdone_ss,
      I3 => Q(2),
      I4 => Q(1),
      O => D(0)
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync5,
      Q => rxpmaresetdone_ss,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block_6 is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_out : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxpmaresetdone_sss : in STD_LOGIC;
    \FSM_onehot_state_reg[3]\ : in STD_LOGIC;
    data_in : in STD_LOGIC;
    gt0_drpclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_0_sync_block_6 : entity is "gtwizard_0_sync_block";
end gtwizard_0_sync_block_6;

architecture STRUCTURE of gtwizard_0_sync_block_6 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \FSM_onehot_state[3]_i_1\ : label is "soft_lutpair17";
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
begin
  data_out <= \^data_out\;
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => Q(0),
      I1 => rxpmaresetdone_sss,
      I2 => \^data_out\,
      O => D(0)
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F888F8F8"
    )
        port map (
      I0 => \FSM_onehot_state_reg[3]\,
      I1 => Q(1),
      I2 => Q(0),
      I3 => \^data_out\,
      I4 => rxpmaresetdone_sss,
      O => D(1)
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block_7 is
  port (
    data_out : out STD_LOGIC;
    gt0_rxresetdone_out : in STD_LOGIC;
    sysclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_0_sync_block_7 : entity is "gtwizard_0_sync_block";
end gtwizard_0_sync_block_7;

architecture STRUCTURE of gtwizard_0_sync_block_7 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rxresetdone_out,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block_8 is
  port (
    \FSM_sequential_rx_state_reg[0]\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    mmcm_lock_reclocked_reg : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rx_fsm_reset_done_int_reg : in STD_LOGIC;
    gt0_rx_fsm_reset_done_out : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[1]\ : in STD_LOGIC;
    rx_fsm_reset_done_int_reg_0 : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_0\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_1\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_2\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_3\ : in STD_LOGIC;
    mmcm_lock_reclocked : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_4\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[3]\ : in STD_LOGIC;
    time_out_wait_bypass_s3 : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_5\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_6\ : in STD_LOGIC;
    dont_reset_on_data_error_in : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_7\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_8\ : in STD_LOGIC;
    \FSM_sequential_rx_state[3]_i_3_0\ : in STD_LOGIC;
    gt0_data_valid_in : in STD_LOGIC;
    sysclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_0_sync_block_8 : entity is "gtwizard_0_sync_block";
end gtwizard_0_sync_block_8;

architecture STRUCTURE of gtwizard_0_sync_block_8 is
  signal \FSM_sequential_rx_state[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_11_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_8_n_0\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal data_valid_sync : STD_LOGIC;
  signal \^mmcm_lock_reclocked_reg\ : STD_LOGIC;
  signal rx_fsm_reset_done_int_i_3_n_0 : STD_LOGIC;
  signal rx_fsm_reset_done_int_i_4_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[0]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[1]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[3]_i_10\ : label is "soft_lutpair1";
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute SOFT_HLUTNM of rx_fsm_reset_done_int_i_4 : label is "soft_lutpair0";
begin
  mmcm_lock_reclocked_reg <= \^mmcm_lock_reclocked_reg\;
\FSM_sequential_rx_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEFEFEF"
    )
        port map (
      I0 => \FSM_sequential_rx_state_reg[0]_8\,
      I1 => \FSM_sequential_rx_state[0]_i_3_n_0\,
      I2 => Q(0),
      I3 => Q(1),
      I4 => Q(3),
      O => D(0)
    );
\FSM_sequential_rx_state[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => Q(3),
      I1 => \FSM_sequential_rx_state_reg[0]_6\,
      I2 => \FSM_sequential_rx_state_reg[0]_7\,
      I3 => dont_reset_on_data_error_in,
      I4 => data_valid_sync,
      O => \FSM_sequential_rx_state[0]_i_3_n_0\
    );
\FSM_sequential_rx_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF42024000"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(3),
      I3 => \FSM_sequential_rx_state[1]_i_2_n_0\,
      I4 => Q(2),
      I5 => \FSM_sequential_rx_state_reg[1]\,
      O => D(1)
    );
\FSM_sequential_rx_state[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => \FSM_sequential_rx_state_reg[0]_7\,
      I1 => dont_reset_on_data_error_in,
      I2 => data_valid_sync,
      O => \FSM_sequential_rx_state[1]_i_2_n_0\
    );
\FSM_sequential_rx_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \^mmcm_lock_reclocked_reg\,
      I1 => \FSM_sequential_rx_state_reg[0]_0\,
      I2 => \FSM_sequential_rx_state_reg[0]_1\,
      I3 => \FSM_sequential_rx_state_reg[0]_2\,
      I4 => \FSM_sequential_rx_state_reg[0]_3\,
      I5 => \FSM_sequential_rx_state[3]_i_8_n_0\,
      O => E(0)
    );
\FSM_sequential_rx_state[3]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => data_valid_sync,
      I1 => dont_reset_on_data_error_in,
      I2 => \FSM_sequential_rx_state_reg[0]_7\,
      I3 => \FSM_sequential_rx_state_reg[0]_6\,
      O => \FSM_sequential_rx_state[3]_i_10_n_0\
    );
\FSM_sequential_rx_state[3]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000008F888888"
    )
        port map (
      I0 => Q(3),
      I1 => data_valid_sync,
      I2 => Q(0),
      I3 => Q(2),
      I4 => \FSM_sequential_rx_state[3]_i_3_0\,
      I5 => Q(1),
      O => \FSM_sequential_rx_state[3]_i_11_n_0\
    );
\FSM_sequential_rx_state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAAAEAEFAAAA"
    )
        port map (
      I0 => \FSM_sequential_rx_state_reg[3]\,
      I1 => \FSM_sequential_rx_state[3]_i_10_n_0\,
      I2 => Q(0),
      I3 => time_out_wait_bypass_s3,
      I4 => Q(3),
      I5 => Q(1),
      O => D(2)
    );
\FSM_sequential_rx_state[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAEAFFAAAAEA"
    )
        port map (
      I0 => \FSM_sequential_rx_state[3]_i_11_n_0\,
      I1 => mmcm_lock_reclocked,
      I2 => Q(2),
      I3 => Q(3),
      I4 => \FSM_sequential_rx_state_reg[0]_4\,
      I5 => data_valid_sync,
      O => \^mmcm_lock_reclocked_reg\
    );
\FSM_sequential_rx_state[3]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAABAA"
    )
        port map (
      I0 => \FSM_sequential_rx_state[0]_i_3_n_0\,
      I1 => Q(1),
      I2 => Q(2),
      I3 => \FSM_sequential_rx_state_reg[0]_5\,
      I4 => Q(0),
      O => \FSM_sequential_rx_state[3]_i_8_n_0\
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_data_valid_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync5,
      Q => data_valid_sync,
      R => '0'
    );
rx_fsm_reset_done_int_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0400FFFF04000000"
    )
        port map (
      I0 => Q(0),
      I1 => data_valid_sync,
      I2 => Q(2),
      I3 => rx_fsm_reset_done_int_reg,
      I4 => rx_fsm_reset_done_int_i_3_n_0,
      I5 => gt0_rx_fsm_reset_done_out,
      O => \FSM_sequential_rx_state_reg[0]\
    );
rx_fsm_reset_done_int_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00CFAA0000000000"
    )
        port map (
      I0 => rx_fsm_reset_done_int_i_4_n_0,
      I1 => rx_fsm_reset_done_int_reg,
      I2 => data_valid_sync,
      I3 => Q(0),
      I4 => Q(1),
      I5 => rx_fsm_reset_done_int_reg_0,
      O => rx_fsm_reset_done_int_i_3_n_0
    );
rx_fsm_reset_done_int_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF10"
    )
        port map (
      I0 => \FSM_sequential_rx_state_reg[0]_6\,
      I1 => dont_reset_on_data_error_in,
      I2 => \FSM_sequential_rx_state_reg[0]_7\,
      I3 => data_valid_sync,
      O => rx_fsm_reset_done_int_i_4_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_sync_block_9 is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out : out STD_LOGIC;
    sysclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_0_sync_block_9 : entity is "gtwizard_0_sync_block";
end gtwizard_0_sync_block_9;

architecture STRUCTURE of gtwizard_0_sync_block_9 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_sync_reg1 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "NO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg2 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg3 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg4 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg5 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute BOX_TYPE of data_sync_reg6 : label is "PRIMITIVE";
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "NO";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => '1',
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
\mmcm_lock_count[7]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^data_out\,
      O => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_RX_STARTUP_FSM is
  port (
    AR : out STD_LOGIC_VECTOR ( 0 to 0 );
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt0_rx_fsm_reset_done_out : out STD_LOGIC;
    gt0_rxuserrdy_i : out STD_LOGIC;
    sysclk_in : in STD_LOGIC;
    gt0_rxusrclk_in : in STD_LOGIC;
    soft_reset_rx_in : in STD_LOGIC;
    gt0_pll0refclklost_in : in STD_LOGIC;
    gt0_rxresetdone_out : in STD_LOGIC;
    gt0_data_valid_in : in STD_LOGIC;
    gt0_pll0lock_in : in STD_LOGIC;
    reset_time_out_reg_0 : in STD_LOGIC;
    dont_reset_on_data_error_in : in STD_LOGIC
  );
end gtwizard_0_RX_STARTUP_FSM;

architecture STRUCTURE of gtwizard_0_RX_STARTUP_FSM is
  signal \^ar\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \FSM_sequential_rx_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_12_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_13_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_14_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_15_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_16_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_17_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_9_n_0\ : STD_LOGIC;
  signal PLL0_RESET_i_1_n_0 : STD_LOGIC;
  signal PLL0_RESET_i_2_n_0 : STD_LOGIC;
  signal RXUSERRDY_i_1_n_0 : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal check_tlock_max_i_1_n_0 : STD_LOGIC;
  signal check_tlock_max_reg_n_0 : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal \^gt0_rx_fsm_reset_done_out\ : STD_LOGIC;
  signal \^gt0_rxuserrdy_i\ : STD_LOGIC;
  signal gtrxreset_i_i_1_n_0 : STD_LOGIC;
  signal init_wait_count : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \init_wait_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \init_wait_count[6]_i_3_n_0\ : STD_LOGIC;
  signal \init_wait_count[6]_i_4_n_0\ : STD_LOGIC;
  signal \init_wait_count[7]_i_1_n_0\ : STD_LOGIC;
  signal init_wait_count_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal init_wait_done_i_1_n_0 : STD_LOGIC;
  signal init_wait_done_reg_n_0 : STD_LOGIC;
  signal \mmcm_lock_count[2]_i_1_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[3]_i_1_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[4]_i_1_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[5]_i_1_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[6]_i_1_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[7]_i_2_n_0\ : STD_LOGIC;
  signal \mmcm_lock_count[7]_i_3_n_0\ : STD_LOGIC;
  signal mmcm_lock_count_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal mmcm_lock_i : STD_LOGIC;
  signal mmcm_lock_reclocked : STD_LOGIC;
  signal mmcm_lock_reclocked_i_1_n_0 : STD_LOGIC;
  signal mmcm_lock_reclocked_i_2_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 6 downto 1 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal pll_reset_asserted_i_1_n_0 : STD_LOGIC;
  signal pll_reset_asserted_reg_n_0 : STD_LOGIC;
  signal reset_time_out_reg_n_0 : STD_LOGIC;
  signal run_phase_alignment_int_i_1_n_0 : STD_LOGIC;
  signal run_phase_alignment_int_reg_n_0 : STD_LOGIC;
  signal run_phase_alignment_int_s2 : STD_LOGIC;
  signal run_phase_alignment_int_s3 : STD_LOGIC;
  signal rx_fsm_reset_done_int_i_2_n_0 : STD_LOGIC;
  signal rx_fsm_reset_done_int_i_5_n_0 : STD_LOGIC;
  signal rx_fsm_reset_done_int_s2 : STD_LOGIC;
  signal rx_fsm_reset_done_int_s3 : STD_LOGIC;
  signal rx_state : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \rx_state__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rxresetdone_s2 : STD_LOGIC;
  signal rxresetdone_s3 : STD_LOGIC;
  signal sel : STD_LOGIC;
  signal sync_data_valid_n_0 : STD_LOGIC;
  signal sync_data_valid_n_4 : STD_LOGIC;
  signal sync_data_valid_n_5 : STD_LOGIC;
  signal sync_mmcm_lock_reclocked_n_0 : STD_LOGIC;
  signal sync_pll0lock_n_0 : STD_LOGIC;
  signal sync_pll0lock_n_1 : STD_LOGIC;
  signal sync_pll0lock_n_2 : STD_LOGIC;
  signal time_out_100us_i_1_n_0 : STD_LOGIC;
  signal time_out_100us_i_2_n_0 : STD_LOGIC;
  signal time_out_100us_i_3_n_0 : STD_LOGIC;
  signal time_out_100us_i_4_n_0 : STD_LOGIC;
  signal time_out_100us_reg_n_0 : STD_LOGIC;
  signal time_out_1us_i_1_n_0 : STD_LOGIC;
  signal time_out_1us_i_2_n_0 : STD_LOGIC;
  signal time_out_1us_i_3_n_0 : STD_LOGIC;
  signal time_out_1us_i_4_n_0 : STD_LOGIC;
  signal time_out_1us_reg_n_0 : STD_LOGIC;
  signal time_out_2ms_i_1_n_0 : STD_LOGIC;
  signal time_out_2ms_i_2_n_0 : STD_LOGIC;
  signal time_out_2ms_i_3_n_0 : STD_LOGIC;
  signal time_out_2ms_reg_n_0 : STD_LOGIC;
  signal time_out_counter : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \time_out_counter[0]_i_3_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_4_n_0\ : STD_LOGIC;
  signal \time_out_counter[0]_i_5_n_0\ : STD_LOGIC;
  signal time_out_counter_reg : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal \time_out_counter_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal time_out_wait_bypass_i_1_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_i_2_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_i_3_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_i_4_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_reg_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_s2 : STD_LOGIC;
  signal time_out_wait_bypass_s3 : STD_LOGIC;
  signal time_tlock_max : STD_LOGIC;
  signal time_tlock_max_i_1_n_0 : STD_LOGIC;
  signal time_tlock_max_i_2_n_0 : STD_LOGIC;
  signal time_tlock_max_i_3_n_0 : STD_LOGIC;
  signal time_tlock_max_i_4_n_0 : STD_LOGIC;
  signal time_tlock_max_i_5_n_0 : STD_LOGIC;
  signal \wait_bypass_count[0]_i_2_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_4_n_0\ : STD_LOGIC;
  signal wait_bypass_count_reg : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \wait_bypass_count_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_7_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_8_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_9_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_2_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_5_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_5_n_0\ : STD_LOGIC;
  signal wait_time_cnt_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \wait_time_cnt_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_wait_bypass_count_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_wait_time_cnt_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[3]_i_12\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[3]_i_13\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[3]_i_17\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[3]_i_9\ : label is "soft_lutpair6";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[0]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[1]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[2]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[3]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute SOFT_HLUTNM of PLL0_RESET_i_2 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of RXUSERRDY_i_1 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of check_tlock_max_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of gtrxreset_i_i_1 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \init_wait_count[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \init_wait_count[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \init_wait_count[3]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \init_wait_count[4]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \init_wait_count[6]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \init_wait_count[7]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \mmcm_lock_count[1]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \mmcm_lock_count[2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \mmcm_lock_count[3]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \mmcm_lock_count[4]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \mmcm_lock_count[6]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \mmcm_lock_count[7]_i_3\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of rx_fsm_reset_done_int_i_2 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of rx_fsm_reset_done_int_i_5 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of time_out_1us_i_3 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of time_out_2ms_i_3 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \time_out_counter[0]_i_3\ : label is "soft_lutpair5";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \time_out_counter_reg[0]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \time_out_counter_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \time_out_counter_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \time_out_counter_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \time_out_counter_reg[8]_i_1\ : label is 35;
  attribute SOFT_HLUTNM of time_tlock_max_i_2 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of time_tlock_max_i_3 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of time_tlock_max_i_5 : label is "soft_lutpair12";
  attribute ADDER_THRESHOLD of \wait_bypass_count_reg[0]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_bypass_count_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_bypass_count_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_bypass_count_reg[8]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_time_cnt_reg[0]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_time_cnt_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_time_cnt_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_time_cnt_reg[8]_i_1\ : label is 35;
begin
  AR(0) <= \^ar\(0);
  SR(0) <= \^sr\(0);
  gt0_rx_fsm_reset_done_out <= \^gt0_rx_fsm_reset_done_out\;
  gt0_rxuserrdy_i <= \^gt0_rxuserrdy_i\;
\FSM_sequential_rx_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222AAAA00300000"
    )
        port map (
      I0 => time_out_2ms_reg_n_0,
      I1 => reset_time_out_reg_n_0,
      I2 => time_tlock_max,
      I3 => rx_state(3),
      I4 => rx_state(2),
      I5 => rx_state(1),
      O => \FSM_sequential_rx_state[0]_i_2_n_0\
    );
\FSM_sequential_rx_state[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AABF000F0000"
    )
        port map (
      I0 => reset_time_out_reg_n_0,
      I1 => time_tlock_max,
      I2 => rx_state(2),
      I3 => rx_state(3),
      I4 => rx_state(1),
      I5 => rx_state(0),
      O => \FSM_sequential_rx_state[1]_i_3_n_0\
    );
\FSM_sequential_rx_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"010C0C0C01000C0C"
    )
        port map (
      I0 => time_out_2ms_reg_n_0,
      I1 => rx_state(2),
      I2 => rx_state(3),
      I3 => rx_state(1),
      I4 => rx_state(0),
      I5 => \FSM_sequential_rx_state[2]_i_2_n_0\,
      O => \rx_state__0\(2)
    );
\FSM_sequential_rx_state[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset_time_out_reg_n_0,
      I1 => time_tlock_max,
      O => \FSM_sequential_rx_state[2]_i_2_n_0\
    );
\FSM_sequential_rx_state[3]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset_time_out_reg_n_0,
      I1 => time_out_2ms_reg_n_0,
      O => \FSM_sequential_rx_state[3]_i_12_n_0\
    );
\FSM_sequential_rx_state[3]_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => rx_state(0),
      I1 => rx_state(1),
      O => \FSM_sequential_rx_state[3]_i_13_n_0\
    );
\FSM_sequential_rx_state[3]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => wait_time_cnt_reg(12),
      I1 => wait_time_cnt_reg(13),
      I2 => wait_time_cnt_reg(10),
      I3 => wait_time_cnt_reg(11),
      I4 => wait_time_cnt_reg(15),
      I5 => wait_time_cnt_reg(14),
      O => \FSM_sequential_rx_state[3]_i_14_n_0\
    );
\FSM_sequential_rx_state[3]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => wait_time_cnt_reg(0),
      I1 => wait_time_cnt_reg(1),
      I2 => rx_state(1),
      I3 => rx_state(0),
      I4 => wait_time_cnt_reg(3),
      I5 => wait_time_cnt_reg(2),
      O => \FSM_sequential_rx_state[3]_i_15_n_0\
    );
\FSM_sequential_rx_state[3]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => wait_time_cnt_reg(6),
      I1 => wait_time_cnt_reg(7),
      I2 => wait_time_cnt_reg(4),
      I3 => wait_time_cnt_reg(5),
      I4 => wait_time_cnt_reg(9),
      I5 => wait_time_cnt_reg(8),
      O => \FSM_sequential_rx_state[3]_i_16_n_0\
    );
\FSM_sequential_rx_state[3]_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rx_state(2),
      I1 => rx_state(3),
      O => \FSM_sequential_rx_state[3]_i_17_n_0\
    );
\FSM_sequential_rx_state[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => rx_state(1),
      I1 => rx_state(0),
      I2 => rx_state(2),
      I3 => rx_state(3),
      I4 => time_tlock_max,
      I5 => reset_time_out_reg_n_0,
      O => \FSM_sequential_rx_state[3]_i_4_n_0\
    );
\FSM_sequential_rx_state[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F1001100110011"
    )
        port map (
      I0 => \FSM_sequential_rx_state[3]_i_12_n_0\,
      I1 => \FSM_sequential_rx_state[3]_i_13_n_0\,
      I2 => \FSM_sequential_rx_state[3]_i_14_n_0\,
      I3 => rx_state(3),
      I4 => \FSM_sequential_rx_state[3]_i_15_n_0\,
      I5 => \FSM_sequential_rx_state[3]_i_16_n_0\,
      O => \FSM_sequential_rx_state[3]_i_6_n_0\
    );
\FSM_sequential_rx_state[3]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80800080"
    )
        port map (
      I0 => rx_state(0),
      I1 => rx_state(1),
      I2 => rx_state(2),
      I3 => time_out_2ms_reg_n_0,
      I4 => reset_time_out_reg_n_0,
      O => \FSM_sequential_rx_state[3]_i_9_n_0\
    );
\FSM_sequential_rx_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => sync_data_valid_n_4,
      D => \rx_state__0\(0),
      Q => rx_state(0),
      R => soft_reset_rx_in
    );
\FSM_sequential_rx_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => sync_data_valid_n_4,
      D => \rx_state__0\(1),
      Q => rx_state(1),
      R => soft_reset_rx_in
    );
\FSM_sequential_rx_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => sync_data_valid_n_4,
      D => \rx_state__0\(2),
      Q => rx_state(2),
      R => soft_reset_rx_in
    );
\FSM_sequential_rx_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => sync_data_valid_n_4,
      D => \rx_state__0\(3),
      Q => rx_state(3),
      R => soft_reset_rx_in
    );
PLL0_RESET_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF100000001"
    )
        port map (
      I0 => gt0_pll0refclklost_in,
      I1 => pll_reset_asserted_reg_n_0,
      I2 => rx_state(3),
      I3 => rx_state(2),
      I4 => PLL0_RESET_i_2_n_0,
      I5 => \^ar\(0),
      O => PLL0_RESET_i_1_n_0
    );
PLL0_RESET_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => rx_state(1),
      I1 => rx_state(0),
      O => PLL0_RESET_i_2_n_0
    );
PLL0_RESET_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => PLL0_RESET_i_1_n_0,
      Q => \^ar\(0),
      R => soft_reset_rx_in
    );
RXUSERRDY_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB4000"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(0),
      I2 => rx_state(2),
      I3 => rx_state(1),
      I4 => \^gt0_rxuserrdy_i\,
      O => RXUSERRDY_i_1_n_0
    );
RXUSERRDY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => RXUSERRDY_i_1_n_0,
      Q => \^gt0_rxuserrdy_i\,
      R => soft_reset_rx_in
    );
check_tlock_max_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0008"
    )
        port map (
      I0 => rx_state(2),
      I1 => rx_state(0),
      I2 => rx_state(1),
      I3 => rx_state(3),
      I4 => check_tlock_max_reg_n_0,
      O => check_tlock_max_i_1_n_0
    );
check_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => check_tlock_max_i_1_n_0,
      Q => check_tlock_max_reg_n_0,
      R => soft_reset_rx_in
    );
gtrxreset_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF0100"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(1),
      I2 => rx_state(2),
      I3 => rx_state(0),
      I4 => \^sr\(0),
      O => gtrxreset_i_i_1_n_0
    );
gtrxreset_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gtrxreset_i_i_1_n_0,
      Q => \^sr\(0),
      R => soft_reset_rx_in
    );
\init_wait_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => init_wait_count_reg(0),
      O => \init_wait_count[0]_i_1_n_0\
    );
\init_wait_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => init_wait_count_reg(0),
      I1 => init_wait_count_reg(1),
      O => p_0_in(1)
    );
\init_wait_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => init_wait_count_reg(1),
      I1 => init_wait_count_reg(0),
      I2 => init_wait_count_reg(2),
      O => p_0_in(2)
    );
\init_wait_count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => init_wait_count_reg(2),
      I1 => init_wait_count_reg(0),
      I2 => init_wait_count_reg(1),
      I3 => init_wait_count_reg(3),
      O => p_0_in(3)
    );
\init_wait_count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => init_wait_count_reg(2),
      I1 => init_wait_count_reg(3),
      I2 => init_wait_count_reg(0),
      I3 => init_wait_count_reg(1),
      I4 => init_wait_count_reg(4),
      O => p_0_in(4)
    );
\init_wait_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => init_wait_count_reg(3),
      I1 => init_wait_count_reg(2),
      I2 => init_wait_count_reg(4),
      I3 => init_wait_count_reg(0),
      I4 => init_wait_count_reg(1),
      I5 => init_wait_count_reg(5),
      O => p_0_in(5)
    );
\init_wait_count[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => init_wait_count_reg(6),
      I1 => init_wait_count_reg(7),
      I2 => init_wait_count_reg(0),
      I3 => \init_wait_count[6]_i_3_n_0\,
      I4 => init_wait_count_reg(1),
      O => init_wait_count(0)
    );
\init_wait_count[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => init_wait_count_reg(4),
      I1 => init_wait_count_reg(2),
      I2 => init_wait_count_reg(3),
      I3 => init_wait_count_reg(5),
      I4 => \init_wait_count[6]_i_4_n_0\,
      I5 => init_wait_count_reg(6),
      O => p_0_in(6)
    );
\init_wait_count[6]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => init_wait_count_reg(4),
      I1 => init_wait_count_reg(2),
      I2 => init_wait_count_reg(3),
      I3 => init_wait_count_reg(5),
      O => \init_wait_count[6]_i_3_n_0\
    );
\init_wait_count[6]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => init_wait_count_reg(0),
      I1 => init_wait_count_reg(1),
      O => \init_wait_count[6]_i_4_n_0\
    );
\init_wait_count[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CC6CCCCC"
    )
        port map (
      I0 => init_wait_count_reg(6),
      I1 => init_wait_count_reg(7),
      I2 => init_wait_count_reg(0),
      I3 => \init_wait_count[6]_i_3_n_0\,
      I4 => init_wait_count_reg(1),
      O => \init_wait_count[7]_i_1_n_0\
    );
\init_wait_count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => init_wait_count(0),
      CLR => soft_reset_rx_in,
      D => \init_wait_count[0]_i_1_n_0\,
      Q => init_wait_count_reg(0)
    );
\init_wait_count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => init_wait_count(0),
      CLR => soft_reset_rx_in,
      D => p_0_in(1),
      Q => init_wait_count_reg(1)
    );
\init_wait_count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => init_wait_count(0),
      CLR => soft_reset_rx_in,
      D => p_0_in(2),
      Q => init_wait_count_reg(2)
    );
\init_wait_count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => init_wait_count(0),
      CLR => soft_reset_rx_in,
      D => p_0_in(3),
      Q => init_wait_count_reg(3)
    );
\init_wait_count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => init_wait_count(0),
      CLR => soft_reset_rx_in,
      D => p_0_in(4),
      Q => init_wait_count_reg(4)
    );
\init_wait_count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => init_wait_count(0),
      CLR => soft_reset_rx_in,
      D => p_0_in(5),
      Q => init_wait_count_reg(5)
    );
\init_wait_count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => init_wait_count(0),
      CLR => soft_reset_rx_in,
      D => p_0_in(6),
      Q => init_wait_count_reg(6)
    );
\init_wait_count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      CLR => soft_reset_rx_in,
      D => \init_wait_count[7]_i_1_n_0\,
      Q => init_wait_count_reg(7)
    );
init_wait_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000001"
    )
        port map (
      I0 => \init_wait_count[6]_i_3_n_0\,
      I1 => init_wait_count_reg(1),
      I2 => init_wait_count_reg(0),
      I3 => init_wait_count_reg(7),
      I4 => init_wait_count_reg(6),
      I5 => init_wait_done_reg_n_0,
      O => init_wait_done_i_1_n_0
    );
init_wait_done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      CLR => soft_reset_rx_in,
      D => init_wait_done_i_1_n_0,
      Q => init_wait_done_reg_n_0
    );
\mmcm_lock_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => mmcm_lock_count_reg(0),
      O => \p_0_in__0\(0)
    );
\mmcm_lock_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mmcm_lock_count_reg(0),
      I1 => mmcm_lock_count_reg(1),
      O => \p_0_in__0\(1)
    );
\mmcm_lock_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => mmcm_lock_count_reg(1),
      I1 => mmcm_lock_count_reg(0),
      I2 => mmcm_lock_count_reg(2),
      O => \mmcm_lock_count[2]_i_1_n_0\
    );
\mmcm_lock_count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => mmcm_lock_count_reg(2),
      I1 => mmcm_lock_count_reg(0),
      I2 => mmcm_lock_count_reg(1),
      I3 => mmcm_lock_count_reg(3),
      O => \mmcm_lock_count[3]_i_1_n_0\
    );
\mmcm_lock_count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => mmcm_lock_count_reg(3),
      I1 => mmcm_lock_count_reg(1),
      I2 => mmcm_lock_count_reg(0),
      I3 => mmcm_lock_count_reg(2),
      I4 => mmcm_lock_count_reg(4),
      O => \mmcm_lock_count[4]_i_1_n_0\
    );
\mmcm_lock_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => mmcm_lock_count_reg(4),
      I1 => mmcm_lock_count_reg(2),
      I2 => mmcm_lock_count_reg(0),
      I3 => mmcm_lock_count_reg(1),
      I4 => mmcm_lock_count_reg(3),
      I5 => mmcm_lock_count_reg(5),
      O => \mmcm_lock_count[5]_i_1_n_0\
    );
\mmcm_lock_count[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => mmcm_lock_reclocked_i_2_n_0,
      I1 => mmcm_lock_count_reg(6),
      O => \mmcm_lock_count[6]_i_1_n_0\
    );
\mmcm_lock_count[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => mmcm_lock_reclocked_i_2_n_0,
      I1 => mmcm_lock_count_reg(6),
      I2 => mmcm_lock_count_reg(7),
      O => \mmcm_lock_count[7]_i_2_n_0\
    );
\mmcm_lock_count[7]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => mmcm_lock_count_reg(6),
      I1 => mmcm_lock_reclocked_i_2_n_0,
      I2 => mmcm_lock_count_reg(7),
      O => \mmcm_lock_count[7]_i_3_n_0\
    );
\mmcm_lock_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \p_0_in__0\(0),
      Q => mmcm_lock_count_reg(0),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \p_0_in__0\(1),
      Q => mmcm_lock_count_reg(1),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \mmcm_lock_count[2]_i_1_n_0\,
      Q => mmcm_lock_count_reg(2),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \mmcm_lock_count[3]_i_1_n_0\,
      Q => mmcm_lock_count_reg(3),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \mmcm_lock_count[4]_i_1_n_0\,
      Q => mmcm_lock_count_reg(4),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \mmcm_lock_count[5]_i_1_n_0\,
      Q => mmcm_lock_count_reg(5),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \mmcm_lock_count[6]_i_1_n_0\,
      Q => mmcm_lock_count_reg(6),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \mmcm_lock_count[7]_i_3_n_0\,
      Q => mmcm_lock_count_reg(7),
      R => sync_mmcm_lock_reclocked_n_0
    );
mmcm_lock_reclocked_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAEA0000"
    )
        port map (
      I0 => mmcm_lock_reclocked,
      I1 => mmcm_lock_count_reg(7),
      I2 => mmcm_lock_count_reg(6),
      I3 => mmcm_lock_reclocked_i_2_n_0,
      I4 => mmcm_lock_i,
      O => mmcm_lock_reclocked_i_1_n_0
    );
mmcm_lock_reclocked_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => mmcm_lock_count_reg(4),
      I1 => mmcm_lock_count_reg(2),
      I2 => mmcm_lock_count_reg(0),
      I3 => mmcm_lock_count_reg(1),
      I4 => mmcm_lock_count_reg(3),
      I5 => mmcm_lock_count_reg(5),
      O => mmcm_lock_reclocked_i_2_n_0
    );
mmcm_lock_reclocked_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => mmcm_lock_reclocked_i_1_n_0,
      Q => mmcm_lock_reclocked,
      R => '0'
    );
pll_reset_asserted_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FD00FD01FF00FF00"
    )
        port map (
      I0 => rx_state(1),
      I1 => rx_state(2),
      I2 => rx_state(3),
      I3 => pll_reset_asserted_reg_n_0,
      I4 => gt0_pll0refclklost_in,
      I5 => rx_state(0),
      O => pll_reset_asserted_i_1_n_0
    );
pll_reset_asserted_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => pll_reset_asserted_i_1_n_0,
      Q => pll_reset_asserted_reg_n_0,
      R => soft_reset_rx_in
    );
reset_time_out_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => sync_pll0lock_n_0,
      Q => reset_time_out_reg_n_0,
      S => soft_reset_rx_in
    );
run_phase_alignment_int_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0010"
    )
        port map (
      I0 => rx_state(2),
      I1 => rx_state(1),
      I2 => rx_state(3),
      I3 => rx_state(0),
      I4 => run_phase_alignment_int_reg_n_0,
      O => run_phase_alignment_int_i_1_n_0
    );
run_phase_alignment_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => run_phase_alignment_int_i_1_n_0,
      Q => run_phase_alignment_int_reg_n_0,
      R => soft_reset_rx_in
    );
run_phase_alignment_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => run_phase_alignment_int_s2,
      Q => run_phase_alignment_int_s3,
      R => '0'
    );
rx_fsm_reset_done_int_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => time_out_1us_reg_n_0,
      I1 => reset_time_out_reg_n_0,
      O => rx_fsm_reset_done_int_i_2_n_0
    );
rx_fsm_reset_done_int_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(2),
      O => rx_fsm_reset_done_int_i_5_n_0
    );
rx_fsm_reset_done_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => sync_data_valid_n_0,
      Q => \^gt0_rx_fsm_reset_done_out\,
      R => soft_reset_rx_in
    );
rx_fsm_reset_done_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => rx_fsm_reset_done_int_s2,
      Q => rx_fsm_reset_done_int_s3,
      R => '0'
    );
rxresetdone_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => rxresetdone_s2,
      Q => rxresetdone_s3,
      R => '0'
    );
sync_RXRESETDONE: entity work.gtwizard_0_sync_block_7
     port map (
      data_out => rxresetdone_s2,
      gt0_rxresetdone_out => gt0_rxresetdone_out,
      sysclk_in => sysclk_in
    );
sync_data_valid: entity work.gtwizard_0_sync_block_8
     port map (
      D(2) => \rx_state__0\(3),
      D(1 downto 0) => \rx_state__0\(1 downto 0),
      E(0) => sync_data_valid_n_4,
      \FSM_sequential_rx_state[3]_i_3_0\ => reset_time_out_reg_0,
      \FSM_sequential_rx_state_reg[0]\ => sync_data_valid_n_0,
      \FSM_sequential_rx_state_reg[0]_0\ => \FSM_sequential_rx_state[3]_i_4_n_0\,
      \FSM_sequential_rx_state_reg[0]_1\ => sync_pll0lock_n_2,
      \FSM_sequential_rx_state_reg[0]_2\ => \FSM_sequential_rx_state[3]_i_6_n_0\,
      \FSM_sequential_rx_state_reg[0]_3\ => sync_pll0lock_n_1,
      \FSM_sequential_rx_state_reg[0]_4\ => PLL0_RESET_i_2_n_0,
      \FSM_sequential_rx_state_reg[0]_5\ => init_wait_done_reg_n_0,
      \FSM_sequential_rx_state_reg[0]_6\ => reset_time_out_reg_n_0,
      \FSM_sequential_rx_state_reg[0]_7\ => time_out_100us_reg_n_0,
      \FSM_sequential_rx_state_reg[0]_8\ => \FSM_sequential_rx_state[0]_i_2_n_0\,
      \FSM_sequential_rx_state_reg[1]\ => \FSM_sequential_rx_state[1]_i_3_n_0\,
      \FSM_sequential_rx_state_reg[3]\ => \FSM_sequential_rx_state[3]_i_9_n_0\,
      Q(3 downto 0) => rx_state(3 downto 0),
      dont_reset_on_data_error_in => dont_reset_on_data_error_in,
      gt0_data_valid_in => gt0_data_valid_in,
      gt0_rx_fsm_reset_done_out => \^gt0_rx_fsm_reset_done_out\,
      mmcm_lock_reclocked => mmcm_lock_reclocked,
      mmcm_lock_reclocked_reg => sync_data_valid_n_5,
      rx_fsm_reset_done_int_reg => rx_fsm_reset_done_int_i_2_n_0,
      rx_fsm_reset_done_int_reg_0 => rx_fsm_reset_done_int_i_5_n_0,
      sysclk_in => sysclk_in,
      time_out_wait_bypass_s3 => time_out_wait_bypass_s3
    );
sync_mmcm_lock_reclocked: entity work.gtwizard_0_sync_block_9
     port map (
      SR(0) => sync_mmcm_lock_reclocked_n_0,
      data_out => mmcm_lock_i,
      sysclk_in => sysclk_in
    );
sync_pll0lock: entity work.gtwizard_0_sync_block_10
     port map (
      \FSM_sequential_rx_state_reg[0]\ => time_out_2ms_reg_n_0,
      \FSM_sequential_rx_state_reg[0]_0\ => \FSM_sequential_rx_state[3]_i_17_n_0\,
      \FSM_sequential_rx_state_reg[0]_1\ => pll_reset_asserted_reg_n_0,
      \FSM_sequential_rx_state_reg[1]\ => sync_pll0lock_n_0,
      Q(3 downto 0) => rx_state(3 downto 0),
      data_sync_reg6_0 => sync_pll0lock_n_2,
      gt0_pll0lock_in => gt0_pll0lock_in,
      reset_time_out_reg => sync_data_valid_n_5,
      reset_time_out_reg_0 => reset_time_out_reg_n_0,
      reset_time_out_reg_1 => reset_time_out_reg_0,
      rxresetdone_s3 => rxresetdone_s3,
      sysclk_in => sysclk_in,
      time_out_2ms_reg => sync_pll0lock_n_1
    );
sync_run_phase_alignment_int: entity work.gtwizard_0_sync_block_11
     port map (
      data_in => run_phase_alignment_int_reg_n_0,
      data_out => run_phase_alignment_int_s2,
      gt0_rxusrclk_in => gt0_rxusrclk_in
    );
sync_rx_fsm_reset_done_int: entity work.gtwizard_0_sync_block_12
     port map (
      data_out => rx_fsm_reset_done_int_s2,
      gt0_rx_fsm_reset_done_out => \^gt0_rx_fsm_reset_done_out\,
      gt0_rxusrclk_in => gt0_rxusrclk_in
    );
sync_time_out_wait_bypass: entity work.gtwizard_0_sync_block_13
     port map (
      data_in => time_out_wait_bypass_reg_n_0,
      data_out => time_out_wait_bypass_s2,
      sysclk_in => sysclk_in
    );
time_out_100us_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0010"
    )
        port map (
      I0 => time_out_100us_i_2_n_0,
      I1 => time_out_100us_i_3_n_0,
      I2 => time_out_100us_i_4_n_0,
      I3 => time_tlock_max_i_2_n_0,
      I4 => time_out_100us_reg_n_0,
      O => time_out_100us_i_1_n_0
    );
time_out_100us_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF7"
    )
        port map (
      I0 => time_out_counter_reg(9),
      I1 => time_out_counter_reg(8),
      I2 => time_out_counter_reg(2),
      I3 => time_out_counter_reg(3),
      I4 => time_out_counter_reg(1),
      I5 => time_out_counter_reg(0),
      O => time_out_100us_i_2_n_0
    );
time_out_100us_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => time_out_counter_reg(7),
      I1 => time_out_counter_reg(6),
      I2 => time_out_counter_reg(5),
      O => time_out_100us_i_3_n_0
    );
time_out_100us_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => time_out_counter_reg(4),
      I1 => time_out_counter_reg(10),
      I2 => time_out_counter_reg(13),
      I3 => time_out_counter_reg(12),
      I4 => time_out_counter_reg(11),
      O => time_out_100us_i_4_n_0
    );
time_out_100us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => time_out_100us_i_1_n_0,
      Q => time_out_100us_reg_n_0,
      R => reset_time_out_reg_n_0
    );
time_out_1us_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0002"
    )
        port map (
      I0 => time_out_1us_i_2_n_0,
      I1 => time_out_1us_i_3_n_0,
      I2 => time_out_1us_i_4_n_0,
      I3 => time_tlock_max_i_2_n_0,
      I4 => time_out_1us_reg_n_0,
      O => time_out_1us_i_1_n_0
    );
time_out_1us_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(9),
      I2 => time_out_counter_reg(2),
      I3 => time_out_counter_reg(7),
      I4 => time_out_counter_reg(12),
      I5 => time_out_counter_reg(11),
      O => time_out_1us_i_2_n_0
    );
time_out_1us_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => time_out_counter_reg(3),
      I1 => time_out_counter_reg(1),
      I2 => time_out_counter_reg(0),
      O => time_out_1us_i_3_n_0
    );
time_out_1us_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFFFFFF"
    )
        port map (
      I0 => time_out_counter_reg(4),
      I1 => time_out_counter_reg(10),
      I2 => time_out_counter_reg(13),
      I3 => time_out_counter_reg(6),
      I4 => time_out_counter_reg(5),
      O => time_out_1us_i_4_n_0
    );
time_out_1us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => time_out_1us_i_1_n_0,
      Q => time_out_1us_reg_n_0,
      R => reset_time_out_reg_n_0
    );
time_out_2ms_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000004"
    )
        port map (
      I0 => time_out_2ms_i_2_n_0,
      I1 => time_out_2ms_i_3_n_0,
      I2 => time_out_counter_reg(14),
      I3 => time_out_counter_reg(16),
      I4 => time_out_counter_reg(17),
      I5 => time_out_2ms_reg_n_0,
      O => time_out_2ms_i_1_n_0
    );
time_out_2ms_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFBF"
    )
        port map (
      I0 => time_out_100us_i_2_n_0,
      I1 => time_out_counter_reg(5),
      I2 => time_out_counter_reg(6),
      I3 => time_out_counter_reg(13),
      I4 => time_out_counter_reg(10),
      I5 => time_out_counter_reg(4),
      O => time_out_2ms_i_2_n_0
    );
time_out_2ms_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => time_out_counter_reg(7),
      I1 => time_out_counter_reg(12),
      I2 => time_out_counter_reg(11),
      I3 => time_out_counter_reg(18),
      I4 => time_out_counter_reg(15),
      O => time_out_2ms_i_3_n_0
    );
time_out_2ms_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => time_out_2ms_i_1_n_0,
      Q => time_out_2ms_reg_n_0,
      R => reset_time_out_reg_n_0
    );
\time_out_counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEFFF"
    )
        port map (
      I0 => time_out_2ms_i_2_n_0,
      I1 => \time_out_counter[0]_i_3_n_0\,
      I2 => time_out_counter_reg(12),
      I3 => time_out_counter_reg(7),
      I4 => time_out_counter_reg(11),
      I5 => \time_out_counter[0]_i_4_n_0\,
      O => time_out_counter(0)
    );
\time_out_counter[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => time_out_counter_reg(17),
      I1 => time_out_counter_reg(16),
      I2 => time_out_counter_reg(14),
      O => \time_out_counter[0]_i_3_n_0\
    );
\time_out_counter[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => time_out_counter_reg(15),
      I1 => time_out_counter_reg(18),
      O => \time_out_counter[0]_i_4_n_0\
    );
\time_out_counter[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => time_out_counter_reg(0),
      O => \time_out_counter[0]_i_5_n_0\
    );
\time_out_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[0]_i_2_n_7\,
      Q => time_out_counter_reg(0),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \time_out_counter_reg[0]_i_2_n_0\,
      CO(2) => \time_out_counter_reg[0]_i_2_n_1\,
      CO(1) => \time_out_counter_reg[0]_i_2_n_2\,
      CO(0) => \time_out_counter_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \time_out_counter_reg[0]_i_2_n_4\,
      O(2) => \time_out_counter_reg[0]_i_2_n_5\,
      O(1) => \time_out_counter_reg[0]_i_2_n_6\,
      O(0) => \time_out_counter_reg[0]_i_2_n_7\,
      S(3 downto 1) => time_out_counter_reg(3 downto 1),
      S(0) => \time_out_counter[0]_i_5_n_0\
    );
\time_out_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[8]_i_1_n_5\,
      Q => time_out_counter_reg(10),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[8]_i_1_n_4\,
      Q => time_out_counter_reg(11),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[12]_i_1_n_7\,
      Q => time_out_counter_reg(12),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[8]_i_1_n_0\,
      CO(3) => \time_out_counter_reg[12]_i_1_n_0\,
      CO(2) => \time_out_counter_reg[12]_i_1_n_1\,
      CO(1) => \time_out_counter_reg[12]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[12]_i_1_n_4\,
      O(2) => \time_out_counter_reg[12]_i_1_n_5\,
      O(1) => \time_out_counter_reg[12]_i_1_n_6\,
      O(0) => \time_out_counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => time_out_counter_reg(15 downto 12)
    );
\time_out_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[12]_i_1_n_6\,
      Q => time_out_counter_reg(13),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[12]_i_1_n_5\,
      Q => time_out_counter_reg(14),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[12]_i_1_n_4\,
      Q => time_out_counter_reg(15),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[16]_i_1_n_7\,
      Q => time_out_counter_reg(16),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[12]_i_1_n_0\,
      CO(3 downto 2) => \NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \time_out_counter_reg[16]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED\(3),
      O(2) => \time_out_counter_reg[16]_i_1_n_5\,
      O(1) => \time_out_counter_reg[16]_i_1_n_6\,
      O(0) => \time_out_counter_reg[16]_i_1_n_7\,
      S(3) => '0',
      S(2 downto 0) => time_out_counter_reg(18 downto 16)
    );
\time_out_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[16]_i_1_n_6\,
      Q => time_out_counter_reg(17),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[16]_i_1_n_5\,
      Q => time_out_counter_reg(18),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[0]_i_2_n_6\,
      Q => time_out_counter_reg(1),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[0]_i_2_n_5\,
      Q => time_out_counter_reg(2),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[0]_i_2_n_4\,
      Q => time_out_counter_reg(3),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[4]_i_1_n_7\,
      Q => time_out_counter_reg(4),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[0]_i_2_n_0\,
      CO(3) => \time_out_counter_reg[4]_i_1_n_0\,
      CO(2) => \time_out_counter_reg[4]_i_1_n_1\,
      CO(1) => \time_out_counter_reg[4]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[4]_i_1_n_4\,
      O(2) => \time_out_counter_reg[4]_i_1_n_5\,
      O(1) => \time_out_counter_reg[4]_i_1_n_6\,
      O(0) => \time_out_counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => time_out_counter_reg(7 downto 4)
    );
\time_out_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[4]_i_1_n_6\,
      Q => time_out_counter_reg(5),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[4]_i_1_n_5\,
      Q => time_out_counter_reg(6),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[4]_i_1_n_4\,
      Q => time_out_counter_reg(7),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[8]_i_1_n_7\,
      Q => time_out_counter_reg(8),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[4]_i_1_n_0\,
      CO(3) => \time_out_counter_reg[8]_i_1_n_0\,
      CO(2) => \time_out_counter_reg[8]_i_1_n_1\,
      CO(1) => \time_out_counter_reg[8]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[8]_i_1_n_4\,
      O(2) => \time_out_counter_reg[8]_i_1_n_5\,
      O(1) => \time_out_counter_reg[8]_i_1_n_6\,
      O(0) => \time_out_counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => time_out_counter_reg(11 downto 8)
    );
\time_out_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => time_out_counter(0),
      D => \time_out_counter_reg[8]_i_1_n_6\,
      Q => time_out_counter_reg(9),
      R => reset_time_out_reg_n_0
    );
time_out_wait_bypass_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AB00"
    )
        port map (
      I0 => time_out_wait_bypass_reg_n_0,
      I1 => rx_fsm_reset_done_int_s3,
      I2 => time_out_wait_bypass_i_2_n_0,
      I3 => run_phase_alignment_int_s3,
      O => time_out_wait_bypass_i_1_n_0
    );
time_out_wait_bypass_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBFFFFFF"
    )
        port map (
      I0 => time_out_wait_bypass_i_3_n_0,
      I1 => wait_bypass_count_reg(1),
      I2 => wait_bypass_count_reg(11),
      I3 => wait_bypass_count_reg(0),
      I4 => time_out_wait_bypass_i_4_n_0,
      O => time_out_wait_bypass_i_2_n_0
    );
time_out_wait_bypass_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => wait_bypass_count_reg(9),
      I1 => wait_bypass_count_reg(4),
      I2 => wait_bypass_count_reg(12),
      I3 => wait_bypass_count_reg(2),
      O => time_out_wait_bypass_i_3_n_0
    );
time_out_wait_bypass_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => wait_bypass_count_reg(5),
      I1 => wait_bypass_count_reg(7),
      I2 => wait_bypass_count_reg(3),
      I3 => wait_bypass_count_reg(6),
      I4 => wait_bypass_count_reg(10),
      I5 => wait_bypass_count_reg(8),
      O => time_out_wait_bypass_i_4_n_0
    );
time_out_wait_bypass_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => time_out_wait_bypass_i_1_n_0,
      Q => time_out_wait_bypass_reg_n_0,
      R => '0'
    );
time_out_wait_bypass_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => time_out_wait_bypass_s2,
      Q => time_out_wait_bypass_s3,
      R => '0'
    );
time_tlock_max_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC8C8C888"
    )
        port map (
      I0 => time_tlock_max_i_2_n_0,
      I1 => check_tlock_max_reg_n_0,
      I2 => time_out_counter_reg(13),
      I3 => time_tlock_max_i_3_n_0,
      I4 => time_tlock_max_i_4_n_0,
      I5 => time_tlock_max,
      O => time_tlock_max_i_1_n_0
    );
time_tlock_max_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => time_out_counter_reg(18),
      I1 => time_out_counter_reg(15),
      I2 => time_out_counter_reg(14),
      I3 => time_out_counter_reg(16),
      I4 => time_out_counter_reg(17),
      O => time_tlock_max_i_2_n_0
    );
time_tlock_max_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => time_out_counter_reg(11),
      I1 => time_out_counter_reg(12),
      O => time_tlock_max_i_3_n_0
    );
time_tlock_max_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080800080008000"
    )
        port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(9),
      I2 => time_out_counter_reg(10),
      I3 => time_out_100us_i_3_n_0,
      I4 => time_tlock_max_i_5_n_0,
      I5 => time_out_counter_reg(4),
      O => time_tlock_max_i_4_n_0
    );
time_tlock_max_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => time_out_counter_reg(0),
      I1 => time_out_counter_reg(1),
      I2 => time_out_counter_reg(3),
      I3 => time_out_counter_reg(2),
      O => time_tlock_max_i_5_n_0
    );
time_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => time_tlock_max_i_1_n_0,
      Q => time_tlock_max,
      R => reset_time_out_reg_n_0
    );
\wait_bypass_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_phase_alignment_int_s3,
      O => clear
    );
\wait_bypass_count[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => time_out_wait_bypass_i_2_n_0,
      I1 => rx_fsm_reset_done_int_s3,
      O => \wait_bypass_count[0]_i_2_n_0\
    );
\wait_bypass_count[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_bypass_count_reg(0),
      O => \wait_bypass_count[0]_i_4_n_0\
    );
\wait_bypass_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_7\,
      Q => wait_bypass_count_reg(0),
      R => clear
    );
\wait_bypass_count_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wait_bypass_count_reg[0]_i_3_n_0\,
      CO(2) => \wait_bypass_count_reg[0]_i_3_n_1\,
      CO(1) => \wait_bypass_count_reg[0]_i_3_n_2\,
      CO(0) => \wait_bypass_count_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \wait_bypass_count_reg[0]_i_3_n_4\,
      O(2) => \wait_bypass_count_reg[0]_i_3_n_5\,
      O(1) => \wait_bypass_count_reg[0]_i_3_n_6\,
      O(0) => \wait_bypass_count_reg[0]_i_3_n_7\,
      S(3 downto 1) => wait_bypass_count_reg(3 downto 1),
      S(0) => \wait_bypass_count[0]_i_4_n_0\
    );
\wait_bypass_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_5\,
      Q => wait_bypass_count_reg(10),
      R => clear
    );
\wait_bypass_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_4\,
      Q => wait_bypass_count_reg(11),
      R => clear
    );
\wait_bypass_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[12]_i_1_n_7\,
      Q => wait_bypass_count_reg(12),
      R => clear
    );
\wait_bypass_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[8]_i_1_n_0\,
      CO(3 downto 0) => \NLW_wait_bypass_count_reg[12]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_wait_bypass_count_reg[12]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \wait_bypass_count_reg[12]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => wait_bypass_count_reg(12)
    );
\wait_bypass_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_6\,
      Q => wait_bypass_count_reg(1),
      R => clear
    );
\wait_bypass_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_5\,
      Q => wait_bypass_count_reg(2),
      R => clear
    );
\wait_bypass_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_4\,
      Q => wait_bypass_count_reg(3),
      R => clear
    );
\wait_bypass_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_7\,
      Q => wait_bypass_count_reg(4),
      R => clear
    );
\wait_bypass_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[0]_i_3_n_0\,
      CO(3) => \wait_bypass_count_reg[4]_i_1_n_0\,
      CO(2) => \wait_bypass_count_reg[4]_i_1_n_1\,
      CO(1) => \wait_bypass_count_reg[4]_i_1_n_2\,
      CO(0) => \wait_bypass_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[4]_i_1_n_4\,
      O(2) => \wait_bypass_count_reg[4]_i_1_n_5\,
      O(1) => \wait_bypass_count_reg[4]_i_1_n_6\,
      O(0) => \wait_bypass_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(7 downto 4)
    );
\wait_bypass_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_6\,
      Q => wait_bypass_count_reg(5),
      R => clear
    );
\wait_bypass_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_5\,
      Q => wait_bypass_count_reg(6),
      R => clear
    );
\wait_bypass_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_4\,
      Q => wait_bypass_count_reg(7),
      R => clear
    );
\wait_bypass_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_7\,
      Q => wait_bypass_count_reg(8),
      R => clear
    );
\wait_bypass_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[4]_i_1_n_0\,
      CO(3) => \wait_bypass_count_reg[8]_i_1_n_0\,
      CO(2) => \wait_bypass_count_reg[8]_i_1_n_1\,
      CO(1) => \wait_bypass_count_reg[8]_i_1_n_2\,
      CO(0) => \wait_bypass_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[8]_i_1_n_4\,
      O(2) => \wait_bypass_count_reg[8]_i_1_n_5\,
      O(1) => \wait_bypass_count_reg[8]_i_1_n_6\,
      O(0) => \wait_bypass_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(11 downto 8)
    );
\wait_bypass_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_rxusrclk_in,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_6\,
      Q => wait_bypass_count_reg(9),
      R => clear
    );
\wait_time_cnt[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => rx_state(0),
      I1 => rx_state(1),
      I2 => rx_state(3),
      O => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(2),
      I1 => wait_time_cnt_reg(3),
      I2 => wait_time_cnt_reg(0),
      I3 => wait_time_cnt_reg(1),
      I4 => \wait_time_cnt[0]_i_4_n_0\,
      I5 => \wait_time_cnt[0]_i_5_n_0\,
      O => sel
    );
\wait_time_cnt[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(14),
      I1 => wait_time_cnt_reg(15),
      I2 => wait_time_cnt_reg(12),
      I3 => wait_time_cnt_reg(13),
      I4 => wait_time_cnt_reg(11),
      I5 => wait_time_cnt_reg(10),
      O => \wait_time_cnt[0]_i_4_n_0\
    );
\wait_time_cnt[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(8),
      I1 => wait_time_cnt_reg(9),
      I2 => wait_time_cnt_reg(6),
      I3 => wait_time_cnt_reg(7),
      I4 => wait_time_cnt_reg(5),
      I5 => wait_time_cnt_reg(4),
      O => \wait_time_cnt[0]_i_5_n_0\
    );
\wait_time_cnt[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(3),
      O => \wait_time_cnt[0]_i_6_n_0\
    );
\wait_time_cnt[0]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(2),
      O => \wait_time_cnt[0]_i_7_n_0\
    );
\wait_time_cnt[0]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(1),
      O => \wait_time_cnt[0]_i_8_n_0\
    );
\wait_time_cnt[0]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(0),
      O => \wait_time_cnt[0]_i_9_n_0\
    );
\wait_time_cnt[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(15),
      O => \wait_time_cnt[12]_i_2_n_0\
    );
\wait_time_cnt[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(14),
      O => \wait_time_cnt[12]_i_3_n_0\
    );
\wait_time_cnt[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(13),
      O => \wait_time_cnt[12]_i_4_n_0\
    );
\wait_time_cnt[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(12),
      O => \wait_time_cnt[12]_i_5_n_0\
    );
\wait_time_cnt[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(7),
      O => \wait_time_cnt[4]_i_2_n_0\
    );
\wait_time_cnt[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(6),
      O => \wait_time_cnt[4]_i_3_n_0\
    );
\wait_time_cnt[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(5),
      O => \wait_time_cnt[4]_i_4_n_0\
    );
\wait_time_cnt[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(4),
      O => \wait_time_cnt[4]_i_5_n_0\
    );
\wait_time_cnt[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(11),
      O => \wait_time_cnt[8]_i_2_n_0\
    );
\wait_time_cnt[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(10),
      O => \wait_time_cnt[8]_i_3_n_0\
    );
\wait_time_cnt[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(9),
      O => \wait_time_cnt[8]_i_4_n_0\
    );
\wait_time_cnt[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(8),
      O => \wait_time_cnt[8]_i_5_n_0\
    );
\wait_time_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_7\,
      Q => wait_time_cnt_reg(0),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wait_time_cnt_reg[0]_i_3_n_0\,
      CO(2) => \wait_time_cnt_reg[0]_i_3_n_1\,
      CO(1) => \wait_time_cnt_reg[0]_i_3_n_2\,
      CO(0) => \wait_time_cnt_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[0]_i_3_n_4\,
      O(2) => \wait_time_cnt_reg[0]_i_3_n_5\,
      O(1) => \wait_time_cnt_reg[0]_i_3_n_6\,
      O(0) => \wait_time_cnt_reg[0]_i_3_n_7\,
      S(3) => \wait_time_cnt[0]_i_6_n_0\,
      S(2) => \wait_time_cnt[0]_i_7_n_0\,
      S(1) => \wait_time_cnt[0]_i_8_n_0\,
      S(0) => \wait_time_cnt[0]_i_9_n_0\
    );
\wait_time_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_5\,
      Q => wait_time_cnt_reg(10),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_4\,
      Q => wait_time_cnt_reg(11),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_7\,
      Q => wait_time_cnt_reg(12),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[8]_i_1_n_0\,
      CO(3) => \NLW_wait_time_cnt_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \wait_time_cnt_reg[12]_i_1_n_1\,
      CO(1) => \wait_time_cnt_reg[12]_i_1_n_2\,
      CO(0) => \wait_time_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0111",
      O(3) => \wait_time_cnt_reg[12]_i_1_n_4\,
      O(2) => \wait_time_cnt_reg[12]_i_1_n_5\,
      O(1) => \wait_time_cnt_reg[12]_i_1_n_6\,
      O(0) => \wait_time_cnt_reg[12]_i_1_n_7\,
      S(3) => \wait_time_cnt[12]_i_2_n_0\,
      S(2) => \wait_time_cnt[12]_i_3_n_0\,
      S(1) => \wait_time_cnt[12]_i_4_n_0\,
      S(0) => \wait_time_cnt[12]_i_5_n_0\
    );
\wait_time_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_6\,
      Q => wait_time_cnt_reg(13),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_5\,
      Q => wait_time_cnt_reg(14),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_4\,
      Q => wait_time_cnt_reg(15),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_6\,
      Q => wait_time_cnt_reg(1),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_5\,
      Q => wait_time_cnt_reg(2),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_4\,
      Q => wait_time_cnt_reg(3),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_7\,
      Q => wait_time_cnt_reg(4),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[0]_i_3_n_0\,
      CO(3) => \wait_time_cnt_reg[4]_i_1_n_0\,
      CO(2) => \wait_time_cnt_reg[4]_i_1_n_1\,
      CO(1) => \wait_time_cnt_reg[4]_i_1_n_2\,
      CO(0) => \wait_time_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[4]_i_1_n_4\,
      O(2) => \wait_time_cnt_reg[4]_i_1_n_5\,
      O(1) => \wait_time_cnt_reg[4]_i_1_n_6\,
      O(0) => \wait_time_cnt_reg[4]_i_1_n_7\,
      S(3) => \wait_time_cnt[4]_i_2_n_0\,
      S(2) => \wait_time_cnt[4]_i_3_n_0\,
      S(1) => \wait_time_cnt[4]_i_4_n_0\,
      S(0) => \wait_time_cnt[4]_i_5_n_0\
    );
\wait_time_cnt_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_6\,
      Q => wait_time_cnt_reg(5),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_5\,
      Q => wait_time_cnt_reg(6),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_4\,
      Q => wait_time_cnt_reg(7),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_7\,
      Q => wait_time_cnt_reg(8),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[4]_i_1_n_0\,
      CO(3) => \wait_time_cnt_reg[8]_i_1_n_0\,
      CO(2) => \wait_time_cnt_reg[8]_i_1_n_1\,
      CO(1) => \wait_time_cnt_reg[8]_i_1_n_2\,
      CO(0) => \wait_time_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[8]_i_1_n_4\,
      O(2) => \wait_time_cnt_reg[8]_i_1_n_5\,
      O(1) => \wait_time_cnt_reg[8]_i_1_n_6\,
      O(0) => \wait_time_cnt_reg[8]_i_1_n_7\,
      S(3) => \wait_time_cnt[8]_i_2_n_0\,
      S(2) => \wait_time_cnt[8]_i_3_n_0\,
      S(1) => \wait_time_cnt[8]_i_4_n_0\,
      S(0) => \wait_time_cnt[8]_i_5_n_0\
    );
\wait_time_cnt_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => sysclk_in,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_6\,
      Q => wait_time_cnt_reg(9),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_gtrxreset_seq is
  port (
    gtrxreset_out : out STD_LOGIC;
    drp_op_done : out STD_LOGIC;
    DRPDI : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 14 downto 0 );
    drpwe_i : out STD_LOGIC;
    \FSM_onehot_state_reg[5]_0\ : out STD_LOGIC;
    DRP_OP_DONE_reg_0 : out STD_LOGIC;
    \FSM_onehot_state_reg[7]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt0_drpclk_in : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_onehot_state_reg[3]_0\ : in STD_LOGIC;
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drp_busy_i10 : in STD_LOGIC;
    gtpe2_i : in STD_LOGIC;
    gtpe2_i_0 : in STD_LOGIC;
    gt0_drpwe_in : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 15 downto 0 );
    data_in : in STD_LOGIC
  );
end gtwizard_0_gtrxreset_seq;

architecture STRUCTURE of gtwizard_0_gtrxreset_seq is
  signal DRP_OP_DONE_i_1_n_0 : STD_LOGIC;
  signal \FSM_onehot_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[6]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[7]_i_1_n_0\ : STD_LOGIC;
  signal \^fsm_onehot_state_reg[7]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \FSM_onehot_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[5]\ : STD_LOGIC;
  signal \^drp_op_done\ : STD_LOGIC;
  signal flag : STD_LOGIC;
  signal \flag_i_1__0_n_0\ : STD_LOGIC;
  signal flag_reg_n_0 : STD_LOGIC;
  signal gtrxreset_i : STD_LOGIC;
  signal gtrxreset_s : STD_LOGIC;
  signal gtrxreset_ss : STD_LOGIC;
  signal next_rd_data : STD_LOGIC_VECTOR ( 0 to 0 );
  signal original_rd_data : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal original_rd_data0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal p_0_in_0 : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal p_3_in : STD_LOGIC;
  signal rd_data : STD_LOGIC_VECTOR ( 11 to 11 );
  signal rxpmaresetdone_ss : STD_LOGIC;
  signal rxpmaresetdone_sss : STD_LOGIC;
  signal sync0_RXPMARESETDONE_n_0 : STD_LOGIC;
  signal sync0_RXPMARESETDONE_n_1 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of DRP_OP_DONE_i_1 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \FSM_onehot_state[0]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \FSM_onehot_state[4]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \FSM_onehot_state[5]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \FSM_onehot_state[6]_i_1\ : label is "soft_lutpair19";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[3]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[4]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[5]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[6]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[7]\ : label is "drp_rd:10000000,wait_rd_data:01000000,wr_16:00100000,wait_wr_done1:00010000,wait_pmareset:00001000,wr_20:00000100,wait_wr_done2:00000001,idle:00000010";
  attribute SOFT_HLUTNM of gtpe2_i_i_30 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \rd_data[0]_i_1__0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \rd_data[10]_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \rd_data[11]_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \rd_data[12]_i_1__0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \rd_data[13]_i_1__0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \rd_data[14]_i_1__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \rd_data[15]_i_2__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \rd_data[1]_i_1__0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \rd_data[2]_i_1__0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \rd_data[3]_i_1__0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \rd_data[4]_i_1__0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \rd_data[5]_i_1__0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \rd_data[6]_i_1__0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \rd_data[7]_i_1__0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \rd_data[8]_i_1__0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \rd_data[9]_i_1__0\ : label is "soft_lutpair24";
begin
  \FSM_onehot_state_reg[7]_0\(0) <= \^fsm_onehot_state_reg[7]_0\(0);
  drp_op_done <= \^drp_op_done\;
DRP_OP_DONE_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => \FSM_onehot_state_reg[3]_0\,
      I1 => flag,
      I2 => \^drp_op_done\,
      O => DRP_OP_DONE_i_1_n_0
    );
DRP_OP_DONE_reg: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => SR(0),
      D => DRP_OP_DONE_i_1_n_0,
      Q => \^drp_op_done\
    );
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \FSM_onehot_state_reg[3]_0\,
      I1 => flag,
      I2 => p_2_in,
      O => \FSM_onehot_state[0]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => \FSM_onehot_state_reg[3]_0\,
      I1 => flag,
      I2 => gtrxreset_ss,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      O => \FSM_onehot_state[1]_i_1_n_0\
    );
\FSM_onehot_state[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \FSM_onehot_state_reg[3]_0\,
      I1 => p_3_in,
      I2 => \FSM_onehot_state_reg_n_0_[5]\,
      O => \FSM_onehot_state[4]_i_1_n_0\
    );
\FSM_onehot_state[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in_0,
      I1 => \FSM_onehot_state_reg[3]_0\,
      O => \FSM_onehot_state[5]_i_1_n_0\
    );
\FSM_onehot_state[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \FSM_onehot_state_reg[3]_0\,
      I1 => p_0_in_0,
      I2 => \^fsm_onehot_state_reg[7]_0\(0),
      O => \FSM_onehot_state[6]_i_1_n_0\
    );
\FSM_onehot_state[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => gtrxreset_ss,
      O => \FSM_onehot_state[7]_i_1_n_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => \FSM_onehot_state[0]_i_1_n_0\,
      Q => flag
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => \FSM_onehot_state[1]_i_1_n_0\,
      PRE => AR(0),
      Q => \FSM_onehot_state_reg_n_0_[1]\
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => sync0_RXPMARESETDONE_n_1,
      Q => p_2_in
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => sync0_RXPMARESETDONE_n_0,
      Q => p_1_in
    );
\FSM_onehot_state_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => \FSM_onehot_state[4]_i_1_n_0\,
      Q => p_3_in
    );
\FSM_onehot_state_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => \FSM_onehot_state[5]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[5]\
    );
\FSM_onehot_state_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => \FSM_onehot_state[6]_i_1_n_0\,
      Q => p_0_in_0
    );
\FSM_onehot_state_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => \FSM_onehot_state[7]_i_1_n_0\,
      Q => \^fsm_onehot_state_reg[7]_0\(0)
    );
drp_busy_i2_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^drp_op_done\,
      O => DRP_OP_DONE_reg_0
    );
\flag_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEEFE"
    )
        port map (
      I0 => p_2_in,
      I1 => \FSM_onehot_state_reg_n_0_[5]\,
      I2 => flag_reg_n_0,
      I3 => flag,
      I4 => p_3_in,
      I5 => p_1_in,
      O => \flag_i_1__0_n_0\
    );
flag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => \flag_i_1__0_n_0\,
      Q => flag_reg_n_0,
      R => '0'
    );
gtpe2_i_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0EFFFFFF0EFF0E"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[5]\,
      I1 => p_2_in,
      I2 => \^drp_op_done\,
      I3 => gtpe2_i_0,
      I4 => drp_busy_i10,
      I5 => gt0_drpwe_in,
      O => drpwe_i
    );
gtpe2_i_i_30: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[5]\,
      I1 => p_2_in,
      I2 => \^drp_op_done\,
      O => \FSM_onehot_state_reg[5]_0\
    );
gtpe2_i_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF4040FF40"
    )
        port map (
      I0 => \^drp_op_done\,
      I1 => p_2_in,
      I2 => rd_data(11),
      I3 => gt0_drpdi_in(0),
      I4 => drp_busy_i10,
      I5 => gtpe2_i,
      O => DRPDI(0)
    );
gtrxreset_o_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => p_1_in,
      I1 => gtrxreset_ss,
      I2 => p_0_in_0,
      I3 => \FSM_onehot_state_reg_n_0_[5]\,
      I4 => p_3_in,
      I5 => \^fsm_onehot_state_reg[7]_0\(0),
      O => gtrxreset_i
    );
gtrxreset_o_reg: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => gtrxreset_i,
      Q => gtrxreset_out
    );
gtrxreset_s_reg: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => SR(0),
      Q => gtrxreset_s
    );
gtrxreset_ss_reg: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => gtrxreset_s,
      Q => gtrxreset_ss
    );
\original_rd_data[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => p_0_in_0,
      I1 => flag_reg_n_0,
      I2 => \FSM_onehot_state_reg[3]_0\,
      O => original_rd_data0
    );
\original_rd_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(0),
      Q => original_rd_data(0),
      R => '0'
    );
\original_rd_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(10),
      Q => original_rd_data(10),
      R => '0'
    );
\original_rd_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(11),
      Q => original_rd_data(11),
      R => '0'
    );
\original_rd_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(12),
      Q => original_rd_data(12),
      R => '0'
    );
\original_rd_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(13),
      Q => original_rd_data(13),
      R => '0'
    );
\original_rd_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(14),
      Q => original_rd_data(14),
      R => '0'
    );
\original_rd_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(15),
      Q => original_rd_data(15),
      R => '0'
    );
\original_rd_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(1),
      Q => original_rd_data(1),
      R => '0'
    );
\original_rd_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(2),
      Q => original_rd_data(2),
      R => '0'
    );
\original_rd_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(3),
      Q => original_rd_data(3),
      R => '0'
    );
\original_rd_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(4),
      Q => original_rd_data(4),
      R => '0'
    );
\original_rd_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(5),
      Q => original_rd_data(5),
      R => '0'
    );
\original_rd_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(6),
      Q => original_rd_data(6),
      R => '0'
    );
\original_rd_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(7),
      Q => original_rd_data(7),
      R => '0'
    );
\original_rd_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(8),
      Q => original_rd_data(8),
      R => '0'
    );
\original_rd_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(9),
      Q => original_rd_data(9),
      R => '0'
    );
\rd_data[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(0),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(0),
      O => p_0_in(0)
    );
\rd_data[10]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(10),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(10),
      O => p_0_in(10)
    );
\rd_data[11]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(11),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(11),
      O => p_0_in(11)
    );
\rd_data[12]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(12),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(12),
      O => p_0_in(12)
    );
\rd_data[13]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(13),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(13),
      O => p_0_in(13)
    );
\rd_data[14]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(14),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(14),
      O => p_0_in(14)
    );
\rd_data[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_state_reg[3]_0\,
      I1 => p_0_in_0,
      O => next_rd_data(0)
    );
\rd_data[15]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(15),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(15),
      O => p_0_in(15)
    );
\rd_data[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(1),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(1),
      O => p_0_in(1)
    );
\rd_data[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(2),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(2),
      O => p_0_in(2)
    );
\rd_data[3]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(3),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(3),
      O => p_0_in(3)
    );
\rd_data[4]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(4),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(4),
      O => p_0_in(4)
    );
\rd_data[5]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(5),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(5),
      O => p_0_in(5)
    );
\rd_data[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(6),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(6),
      O => p_0_in(6)
    );
\rd_data[7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(7),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(7),
      O => p_0_in(7)
    );
\rd_data[8]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(8),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(8),
      O => p_0_in(8)
    );
\rd_data[9]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(9),
      I1 => flag_reg_n_0,
      I2 => original_rd_data(9),
      O => p_0_in(9)
    );
\rd_data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(0),
      Q => Q(0)
    );
\rd_data_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(10),
      Q => Q(10)
    );
\rd_data_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(11),
      Q => rd_data(11)
    );
\rd_data_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(12),
      Q => Q(11)
    );
\rd_data_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(13),
      Q => Q(12)
    );
\rd_data_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(14),
      Q => Q(13)
    );
\rd_data_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(15),
      Q => Q(14)
    );
\rd_data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(1),
      Q => Q(1)
    );
\rd_data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(2),
      Q => Q(2)
    );
\rd_data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(3),
      Q => Q(3)
    );
\rd_data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(4),
      Q => Q(4)
    );
\rd_data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(5),
      Q => Q(5)
    );
\rd_data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(6),
      Q => Q(6)
    );
\rd_data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(7),
      Q => Q(7)
    );
\rd_data_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(8),
      Q => Q(8)
    );
\rd_data_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => p_0_in(9),
      Q => Q(9)
    );
rxpmaresetdone_sss_reg: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => rxpmaresetdone_ss,
      Q => rxpmaresetdone_sss
    );
sync0_RXPMARESETDONE: entity work.gtwizard_0_sync_block_6
     port map (
      D(1) => sync0_RXPMARESETDONE_n_0,
      D(0) => sync0_RXPMARESETDONE_n_1,
      \FSM_onehot_state_reg[3]\ => \FSM_onehot_state_reg[3]_0\,
      Q(1) => p_3_in,
      Q(0) => p_1_in,
      data_in => data_in,
      data_out => rxpmaresetdone_ss,
      gt0_drpclk_in => gt0_drpclk_in,
      rxpmaresetdone_sss => rxpmaresetdone_sss
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_rxrate_seq is
  port (
    drpen_i : out STD_LOGIC;
    drp_busy_i10 : out STD_LOGIC;
    DRPDI : out STD_LOGIC_VECTOR ( 14 downto 0 );
    DRP_OP_DONE_reg : out STD_LOGIC;
    DRPADDR : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \rd_data_reg[11]_0\ : out STD_LOGIC;
    \rxrate_o_reg[2]_0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_drpclk_in : in STD_LOGIC;
    gtpe2_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    drp_op_done : in STD_LOGIC;
    gt0_drpen_in : in STD_LOGIC;
    gtpe2_i_0 : in STD_LOGIC;
    drp_busy_i2 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 14 downto 0 );
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 14 downto 0 );
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \FSM_sequential_state_reg[0]_0\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    data_in : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end gtwizard_0_rxrate_seq;

architecture STRUCTURE of gtwizard_0_rxrate_seq is
  signal \^drp_op_done_reg\ : STD_LOGIC;
  signal \cdc_rxrate.sync_rxrate[0].sync_RXRATE_n_2\ : STD_LOGIC;
  signal \^drp_busy_i10\ : STD_LOGIC;
  signal flag_i_1_n_0 : STD_LOGIC;
  signal flag_reg_n_0 : STD_LOGIC;
  signal gtpe2_i_i_28_n_0 : STD_LOGIC;
  signal next_rd_data : STD_LOGIC_VECTOR ( 0 to 0 );
  signal next_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal old_rxrate : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \old_rxrate[0]_i_1_n_0\ : STD_LOGIC;
  signal \old_rxrate[1]_i_1_n_0\ : STD_LOGIC;
  signal \old_rxrate[2]_i_1_n_0\ : STD_LOGIC;
  signal original_rd_data0 : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[0]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[10]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[11]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[12]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[13]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[14]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[15]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[1]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[2]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[3]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[4]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[5]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[6]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[7]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[8]\ : STD_LOGIC;
  signal \original_rd_data_reg_n_0_[9]\ : STD_LOGIC;
  signal \rd_data[0]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[10]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[11]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[12]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[13]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[14]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[15]_i_2_n_0\ : STD_LOGIC;
  signal \rd_data[1]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[2]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[3]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[4]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[5]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[6]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[7]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[8]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data[9]_i_1_n_0\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[0]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[10]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[11]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[12]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[13]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[14]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[15]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[1]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[2]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[3]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[4]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[5]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[6]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[7]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[8]\ : STD_LOGIC;
  signal \rd_data_reg_n_0_[9]\ : STD_LOGIC;
  signal rxrate_i : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal rxrate_ss : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal rxrate_sss : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "drp_rd:111,wait_rd_data:110,wr_16:101,wait_wr_done1:100,wait_pmareset:011,wr_20:010,wait_wr_done2:000,idle:001";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "drp_rd:111,wait_rd_data:110,wr_16:101,wait_wr_done1:100,wait_pmareset:011,wr_20:010,wait_wr_done2:000,idle:001";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "drp_rd:111,wait_rd_data:110,wr_16:101,wait_wr_done1:100,wait_pmareset:011,wr_20:010,wait_wr_done2:000,idle:001";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of drp_busy_i1_i_1 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of gtpe2_i_i_29 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \old_rxrate[1]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \old_rxrate[2]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \rd_data[0]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \rd_data[10]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \rd_data[11]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \rd_data[12]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \rd_data[13]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \rd_data[14]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \rd_data[15]_i_2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \rd_data[1]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \rd_data[2]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \rd_data[3]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \rd_data[4]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \rd_data[5]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \rd_data[6]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \rd_data[7]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \rd_data[8]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \rd_data[9]_i_1\ : label is "soft_lutpair34";
begin
  DRP_OP_DONE_reg <= \^drp_op_done_reg\;
  drp_busy_i10 <= \^drp_busy_i10\;
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => next_state(0),
      PRE => AR(0),
      Q => state(0)
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => next_state(1),
      Q => state(1)
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => next_state(2),
      Q => state(2)
    );
\cdc_rxrate.sync_rxrate[0].sync_RXRATE\: entity work.gtwizard_0_sync_block_2
     port map (
      D(1 downto 0) => next_state(2 downto 1),
      \FSM_sequential_state_reg[1]\(2 downto 0) => rxrate_sss(2 downto 0),
      \FSM_sequential_state_reg[1]_0\(1 downto 0) => rxrate_ss(2 downto 1),
      \FSM_sequential_state_reg[2]\ => \FSM_sequential_state_reg[0]_0\,
      Q(2 downto 0) => state(2 downto 0),
      data_out => rxrate_ss(0),
      data_sync_reg6_0(0) => rxrate_i(0),
      gt0_drpclk_in => gt0_drpclk_in,
      gt0_rxrate_in(0) => gt0_rxrate_in(0),
      old_rxrate(0) => old_rxrate(0),
      \rxrate_sss_reg[0]\ => \cdc_rxrate.sync_rxrate[0].sync_RXRATE_n_2\
    );
\cdc_rxrate.sync_rxrate[1].sync_RXRATE\: entity work.gtwizard_0_sync_block_3
     port map (
      D(0) => rxrate_i(1),
      Q(2 downto 0) => state(2 downto 0),
      data_out => rxrate_ss(1),
      gt0_drpclk_in => gt0_drpclk_in,
      gt0_rxrate_in(0) => gt0_rxrate_in(1),
      old_rxrate(0) => old_rxrate(1),
      \rxrate_o_reg[1]\ => \cdc_rxrate.sync_rxrate[0].sync_RXRATE_n_2\
    );
\cdc_rxrate.sync_rxrate[2].sync_RXRATE\: entity work.gtwizard_0_sync_block_4
     port map (
      D(0) => rxrate_i(2),
      Q(2 downto 0) => state(2 downto 0),
      data_out => rxrate_ss(2),
      gt0_drpclk_in => gt0_drpclk_in,
      gt0_rxrate_in(0) => gt0_rxrate_in(2),
      old_rxrate(0) => old_rxrate(2),
      \rxrate_o_reg[2]\ => \cdc_rxrate.sync_rxrate[0].sync_RXRATE_n_2\
    );
drp_busy_i1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7AFFFFFF"
    )
        port map (
      I0 => state(2),
      I1 => drp_busy_i2,
      I2 => state(1),
      I3 => state(0),
      I4 => drp_op_done,
      O => \^drp_busy_i10\
    );
flag_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE66"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => state(0),
      I3 => flag_reg_n_0,
      O => flag_i_1_n_0
    );
flag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => flag_i_1_n_0,
      Q => flag_reg_n_0,
      R => '0'
    );
gtpe2_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAEFFAE"
    )
        port map (
      I0 => gtpe2_i_i_28_n_0,
      I1 => gtpe2_i(0),
      I2 => drp_op_done,
      I3 => gt0_drpen_in,
      I4 => \^drp_busy_i10\,
      O => drpen_i
    );
gtpe2_i_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(8),
      I2 => gt0_drpdi_in(8),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[8]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(8)
    );
gtpe2_i_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(7),
      I2 => gt0_drpdi_in(7),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[7]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(7)
    );
gtpe2_i_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(6),
      I2 => gt0_drpdi_in(6),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[6]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(6)
    );
gtpe2_i_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(5),
      I2 => gt0_drpdi_in(5),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[5]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(5)
    );
gtpe2_i_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(4),
      I2 => gt0_drpdi_in(4),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[4]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(4)
    );
gtpe2_i_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(3),
      I2 => gt0_drpdi_in(3),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[3]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(3)
    );
gtpe2_i_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(2),
      I2 => gt0_drpdi_in(2),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[2]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(2)
    );
gtpe2_i_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(1),
      I2 => gt0_drpdi_in(1),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[1]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(1)
    );
gtpe2_i_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(0),
      I2 => gt0_drpdi_in(0),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[0]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(0)
    );
gtpe2_i_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000800080"
    )
        port map (
      I0 => gt0_drpaddr_in(8),
      I1 => drp_op_done,
      I2 => state(0),
      I3 => state(1),
      I4 => drp_busy_i2,
      I5 => state(2),
      O => DRPADDR(8)
    );
gtpe2_i_i_20: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000800080"
    )
        port map (
      I0 => gt0_drpaddr_in(7),
      I1 => drp_op_done,
      I2 => state(0),
      I3 => state(1),
      I4 => drp_busy_i2,
      I5 => state(2),
      O => DRPADDR(7)
    );
gtpe2_i_i_21: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000800080"
    )
        port map (
      I0 => gt0_drpaddr_in(6),
      I1 => drp_op_done,
      I2 => state(0),
      I3 => state(1),
      I4 => drp_busy_i2,
      I5 => state(2),
      O => DRPADDR(6)
    );
gtpe2_i_i_22: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000800080"
    )
        port map (
      I0 => gt0_drpaddr_in(5),
      I1 => drp_op_done,
      I2 => state(0),
      I3 => state(1),
      I4 => drp_busy_i2,
      I5 => state(2),
      O => DRPADDR(5)
    );
gtpe2_i_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF7FFFF7F7"
    )
        port map (
      I0 => drp_op_done,
      I1 => state(0),
      I2 => state(1),
      I3 => drp_busy_i2,
      I4 => state(2),
      I5 => gt0_drpaddr_in(4),
      O => DRPADDR(4)
    );
gtpe2_i_i_24: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000800080"
    )
        port map (
      I0 => gt0_drpaddr_in(3),
      I1 => drp_op_done,
      I2 => state(0),
      I3 => state(1),
      I4 => drp_busy_i2,
      I5 => state(2),
      O => DRPADDR(3)
    );
gtpe2_i_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000800080"
    )
        port map (
      I0 => gt0_drpaddr_in(2),
      I1 => drp_op_done,
      I2 => state(0),
      I3 => state(1),
      I4 => drp_busy_i2,
      I5 => state(2),
      O => DRPADDR(2)
    );
gtpe2_i_i_26: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000800080"
    )
        port map (
      I0 => gt0_drpaddr_in(1),
      I1 => drp_op_done,
      I2 => state(0),
      I3 => state(1),
      I4 => drp_busy_i2,
      I5 => state(2),
      O => DRPADDR(1)
    );
gtpe2_i_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF7FFFF7F7"
    )
        port map (
      I0 => drp_op_done,
      I1 => state(0),
      I2 => state(1),
      I3 => drp_busy_i2,
      I4 => state(2),
      I5 => gt0_drpaddr_in(0),
      O => DRPADDR(0)
    );
gtpe2_i_i_28: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEAEAEAAEAEAAAA"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => drp_op_done,
      I2 => state(2),
      I3 => drp_busy_i2,
      I4 => state(1),
      I5 => state(0),
      O => gtpe2_i_i_28_n_0
    );
gtpe2_i_i_29: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0820"
    )
        port map (
      I0 => drp_op_done,
      I1 => state(2),
      I2 => state(1),
      I3 => state(0),
      O => \^drp_op_done_reg\
    );
gtpe2_i_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(14),
      I2 => gt0_drpdi_in(14),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[15]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(14)
    );
gtpe2_i_i_31: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => \rd_data_reg_n_0_[11]\,
      I1 => state(0),
      I2 => state(1),
      I3 => state(2),
      I4 => drp_op_done,
      O => \rd_data_reg[11]_0\
    );
gtpe2_i_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(13),
      I2 => gt0_drpdi_in(13),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[14]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(13)
    );
gtpe2_i_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(12),
      I2 => gt0_drpdi_in(12),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[13]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(12)
    );
gtpe2_i_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(11),
      I2 => gt0_drpdi_in(11),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[12]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(11)
    );
gtpe2_i_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(10),
      I2 => gt0_drpdi_in(10),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[10]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(10)
    );
gtpe2_i_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => gtpe2_i_0,
      I1 => Q(9),
      I2 => gt0_drpdi_in(9),
      I3 => \^drp_busy_i10\,
      I4 => \rd_data_reg_n_0_[9]\,
      I5 => \^drp_op_done_reg\,
      O => DRPDI(9)
    );
\old_rxrate[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxrate_sss(0),
      I1 => \cdc_rxrate.sync_rxrate[0].sync_RXRATE_n_2\,
      I2 => old_rxrate(0),
      O => \old_rxrate[0]_i_1_n_0\
    );
\old_rxrate[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxrate_sss(1),
      I1 => \cdc_rxrate.sync_rxrate[0].sync_RXRATE_n_2\,
      I2 => old_rxrate(1),
      O => \old_rxrate[1]_i_1_n_0\
    );
\old_rxrate[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxrate_sss(2),
      I1 => \cdc_rxrate.sync_rxrate[0].sync_RXRATE_n_2\,
      I2 => old_rxrate(2),
      O => \old_rxrate[2]_i_1_n_0\
    );
\old_rxrate_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => \old_rxrate[0]_i_1_n_0\,
      Q => old_rxrate(0)
    );
\old_rxrate_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => \old_rxrate[1]_i_1_n_0\,
      Q => old_rxrate(1)
    );
\old_rxrate_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => \old_rxrate[2]_i_1_n_0\,
      Q => old_rxrate(2)
    );
\original_rd_data[15]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => state(0),
      I1 => \FSM_sequential_state_reg[0]_0\,
      I2 => flag_reg_n_0,
      I3 => state(2),
      I4 => state(1),
      O => original_rd_data0
    );
\original_rd_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(0),
      Q => \original_rd_data_reg_n_0_[0]\,
      R => '0'
    );
\original_rd_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(10),
      Q => \original_rd_data_reg_n_0_[10]\,
      R => '0'
    );
\original_rd_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(11),
      Q => \original_rd_data_reg_n_0_[11]\,
      R => '0'
    );
\original_rd_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(12),
      Q => \original_rd_data_reg_n_0_[12]\,
      R => '0'
    );
\original_rd_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(13),
      Q => \original_rd_data_reg_n_0_[13]\,
      R => '0'
    );
\original_rd_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(14),
      Q => \original_rd_data_reg_n_0_[14]\,
      R => '0'
    );
\original_rd_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(15),
      Q => \original_rd_data_reg_n_0_[15]\,
      R => '0'
    );
\original_rd_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(1),
      Q => \original_rd_data_reg_n_0_[1]\,
      R => '0'
    );
\original_rd_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(2),
      Q => \original_rd_data_reg_n_0_[2]\,
      R => '0'
    );
\original_rd_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(3),
      Q => \original_rd_data_reg_n_0_[3]\,
      R => '0'
    );
\original_rd_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(4),
      Q => \original_rd_data_reg_n_0_[4]\,
      R => '0'
    );
\original_rd_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(5),
      Q => \original_rd_data_reg_n_0_[5]\,
      R => '0'
    );
\original_rd_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(6),
      Q => \original_rd_data_reg_n_0_[6]\,
      R => '0'
    );
\original_rd_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(7),
      Q => \original_rd_data_reg_n_0_[7]\,
      R => '0'
    );
\original_rd_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(8),
      Q => \original_rd_data_reg_n_0_[8]\,
      R => '0'
    );
\original_rd_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gt0_drpclk_in,
      CE => original_rd_data0,
      D => D(9),
      Q => \original_rd_data_reg_n_0_[9]\,
      R => '0'
    );
\rd_data[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(0),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[0]\,
      O => \rd_data[0]_i_1_n_0\
    );
\rd_data[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(10),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[10]\,
      O => \rd_data[10]_i_1_n_0\
    );
\rd_data[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(11),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[11]\,
      O => \rd_data[11]_i_1_n_0\
    );
\rd_data[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(12),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[12]\,
      O => \rd_data[12]_i_1_n_0\
    );
\rd_data[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(13),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[13]\,
      O => \rd_data[13]_i_1_n_0\
    );
\rd_data[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(14),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[14]\,
      O => \rd_data[14]_i_1_n_0\
    );
\rd_data[15]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => \FSM_sequential_state_reg[0]_0\,
      I3 => state(0),
      O => next_rd_data(0)
    );
\rd_data[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(15),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[15]\,
      O => \rd_data[15]_i_2_n_0\
    );
\rd_data[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(1),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[1]\,
      O => \rd_data[1]_i_1_n_0\
    );
\rd_data[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(2),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[2]\,
      O => \rd_data[2]_i_1_n_0\
    );
\rd_data[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(3),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[3]\,
      O => \rd_data[3]_i_1_n_0\
    );
\rd_data[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(4),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[4]\,
      O => \rd_data[4]_i_1_n_0\
    );
\rd_data[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(5),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[5]\,
      O => \rd_data[5]_i_1_n_0\
    );
\rd_data[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(6),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[6]\,
      O => \rd_data[6]_i_1_n_0\
    );
\rd_data[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(7),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[7]\,
      O => \rd_data[7]_i_1_n_0\
    );
\rd_data[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(8),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[8]\,
      O => \rd_data[8]_i_1_n_0\
    );
\rd_data[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => D(9),
      I1 => flag_reg_n_0,
      I2 => \original_rd_data_reg_n_0_[9]\,
      O => \rd_data[9]_i_1_n_0\
    );
\rd_data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[0]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[0]\
    );
\rd_data_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[10]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[10]\
    );
\rd_data_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[11]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[11]\
    );
\rd_data_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[12]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[12]\
    );
\rd_data_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[13]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[13]\
    );
\rd_data_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[14]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[14]\
    );
\rd_data_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[15]_i_2_n_0\,
      Q => \rd_data_reg_n_0_[15]\
    );
\rd_data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[1]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[1]\
    );
\rd_data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[2]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[2]\
    );
\rd_data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[3]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[3]\
    );
\rd_data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[4]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[4]\
    );
\rd_data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[5]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[5]\
    );
\rd_data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[6]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[6]\
    );
\rd_data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[7]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[7]\
    );
\rd_data_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[8]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[8]\
    );
\rd_data_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => next_rd_data(0),
      CLR => AR(0),
      D => \rd_data[9]_i_1_n_0\,
      Q => \rd_data_reg_n_0_[9]\
    );
\rxrate_o_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => rxrate_i(0),
      Q => \rxrate_o_reg[2]_0\(0)
    );
\rxrate_o_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => rxrate_i(1),
      Q => \rxrate_o_reg[2]_0\(1)
    );
\rxrate_o_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => rxrate_i(2),
      Q => \rxrate_o_reg[2]_0\(2)
    );
\rxrate_sss_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => rxrate_ss(0),
      Q => rxrate_sss(0)
    );
\rxrate_sss_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => rxrate_ss(1),
      Q => rxrate_sss(1)
    );
\rxrate_sss_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => rxrate_ss(2),
      Q => rxrate_sss(2)
    );
sync1_RXPMARESETDONE: entity work.gtwizard_0_sync_block_5
     port map (
      D(0) => next_state(0),
      \FSM_sequential_state_reg[0]\ => \FSM_sequential_state_reg[0]_0\,
      Q(2 downto 0) => state(2 downto 0),
      data_in => data_in,
      gt0_drpclk_in => gt0_drpclk_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_GT is
  port (
    gtpe2_i_0 : out STD_LOGIC;
    gt0_eyescandataerror_out : out STD_LOGIC;
    gt0_rxoutclk_out : out STD_LOGIC;
    gt0_rxoutclkfabric_out : out STD_LOGIC;
    gt0_rxratedone_out : out STD_LOGIC;
    gt0_rxresetdone_out : out STD_LOGIC;
    gt0_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxdata_out : out STD_LOGIC_VECTOR ( 19 downto 0 );
    gt0_drp_busy_out : out STD_LOGIC;
    gt0_drpclk_in : in STD_LOGIC;
    gt0_eyescanreset_in : in STD_LOGIC;
    gt0_eyescantrigger_in : in STD_LOGIC;
    gt0_gtprxn_in : in STD_LOGIC;
    gt0_gtprxp_in : in STD_LOGIC;
    gt0_pll0outclk_in : in STD_LOGIC;
    gt0_pll0outrefclk_in : in STD_LOGIC;
    gt0_pll1outclk_in : in STD_LOGIC;
    gt0_pll1outrefclk_in : in STD_LOGIC;
    gt0_rxbufreset_in : in STD_LOGIC;
    gt0_rxlpmhfhold_in : in STD_LOGIC;
    gt0_rxlpmlfhold_in : in STD_LOGIC;
    gt0_rxlpmreset_in : in STD_LOGIC;
    gt0_rxpcsreset_in : in STD_LOGIC;
    gt0_rxuserrdy_i : in STD_LOGIC;
    gt0_rxusrclk_in : in STD_LOGIC;
    gt0_rxusrclk2_in : in STD_LOGIC;
    gt0_txpcsreset_in : in STD_LOGIC;
    gt0_loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt0_rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_drpen_in : in STD_LOGIC;
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpwe_in : in STD_LOGIC;
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
end gtwizard_0_GT;

architecture STRUCTURE of gtwizard_0_GT is
  signal \^d\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal drp_busy_i1 : STD_LOGIC;
  signal drp_busy_i10 : STD_LOGIC;
  signal drp_busy_i2 : STD_LOGIC;
  signal drp_op_done : STD_LOGIC;
  signal drpaddr_i : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal drpdi_i : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal drpen_i : STD_LOGIC;
  signal drpwe_i : STD_LOGIC;
  signal gt0_rxpmaresetdone_i : STD_LOGIC;
  signal \^gtpe2_i_0\ : STD_LOGIC;
  signal gtrxreset_out : STD_LOGIC;
  signal gtrxreset_seq_i_n_19 : STD_LOGIC;
  signal gtrxreset_seq_i_n_20 : STD_LOGIC;
  signal gtrxreset_seq_i_n_21 : STD_LOGIC;
  signal rd_data : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rxrate_out : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal rxrate_out_i : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal rxrate_seq_i_n_17 : STD_LOGIC;
  signal rxrate_seq_i_n_27 : STD_LOGIC;
  signal NLW_gtpe2_i_GTPTXN_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_GTPTXP_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_PHYSTATUS_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_PMARSVDOUT0_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_PMARSVDOUT1_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXBYTEISALIGNED_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXBYTEREALIGN_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXCDRLOCK_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXCHANBONDSEQ_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXCHANISALIGNED_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXCHANREALIGN_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXCOMINITDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXCOMMADET_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXCOMSASDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXCOMWAKEDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXELECIDLE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXHEADERVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXOSINTDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXOSINTSTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXOSINTSTROBEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXOSINTSTROBESTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXOUTCLKPCS_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXPRBSERR_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXSYNCDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXSYNCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_RXVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXCOMFINISH_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXGEARBOXREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXOUTCLK_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXOUTCLKFABRIC_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXOUTCLKPCS_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXPHINITDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXPMARESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXSYNCDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_TXSYNCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_gtpe2_i_PCSRSVDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_gtpe2_i_RXCHARISCOMMA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_gtpe2_i_RXCHARISK_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_gtpe2_i_RXCHBONDO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_gtpe2_i_RXCLKCORCNT_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gtpe2_i_RXDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal NLW_gtpe2_i_RXDATAVALID_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gtpe2_i_RXDISPERR_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_gtpe2_i_RXHEADER_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_gtpe2_i_RXNOTINTABLE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_gtpe2_i_RXPHMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gtpe2_i_RXPHSLIPMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gtpe2_i_RXSTARTOFSEQ_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gtpe2_i_RXSTATUS_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of gtpe2_i : label is "PRIMITIVE";
begin
  D(15 downto 0) <= \^d\(15 downto 0);
  gtpe2_i_0 <= \^gtpe2_i_0\;
\cdc_rxrate_out.sync_rxrate_out[0].sync_RXRATE_OUT\: entity work.gtwizard_0_sync_block
     port map (
      Q(0) => rxrate_out(0),
      data_out => rxrate_out_i(0),
      gt0_rxusrclk2_in => gt0_rxusrclk2_in
    );
\cdc_rxrate_out.sync_rxrate_out[1].sync_RXRATE_OUT\: entity work.gtwizard_0_sync_block_0
     port map (
      Q(0) => rxrate_out(1),
      data_out => rxrate_out_i(1),
      gt0_rxusrclk2_in => gt0_rxusrclk2_in
    );
\cdc_rxrate_out.sync_rxrate_out[2].sync_RXRATE_OUT\: entity work.gtwizard_0_sync_block_1
     port map (
      Q(0) => rxrate_out(2),
      data_out => rxrate_out_i(2),
      gt0_rxusrclk2_in => gt0_rxusrclk2_in
    );
drp_busy_i1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => drp_busy_i10,
      Q => drp_busy_i1,
      R => '0'
    );
drp_busy_i2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => gtrxreset_seq_i_n_20,
      Q => drp_busy_i2,
      R => '0'
    );
gt0_drp_busy_out_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => drp_busy_i1,
      I1 => drp_busy_i2,
      O => gt0_drp_busy_out
    );
gtpe2_i: unisim.vcomponents.GTPE2_CHANNEL
    generic map(
      ACJTAG_DEBUG_MODE => '0',
      ACJTAG_MODE => '0',
      ACJTAG_RESET => '0',
      ADAPT_CFG0 => B"00000000000000000000",
      ALIGN_COMMA_DOUBLE => "FALSE",
      ALIGN_COMMA_ENABLE => B"1111111111",
      ALIGN_COMMA_WORD => 1,
      ALIGN_MCOMMA_DET => "TRUE",
      ALIGN_MCOMMA_VALUE => B"1010000011",
      ALIGN_PCOMMA_DET => "TRUE",
      ALIGN_PCOMMA_VALUE => B"0101111100",
      CBCC_DATA_SOURCE_SEL => "ENCODED",
      CFOK_CFG => B"1001001000000000000000001000000111010000000",
      CFOK_CFG2 => B"0100000",
      CFOK_CFG3 => B"0100000",
      CFOK_CFG4 => '0',
      CFOK_CFG5 => B"00",
      CFOK_CFG6 => B"0000",
      CHAN_BOND_KEEP_ALIGN => "FALSE",
      CHAN_BOND_MAX_SKEW => 1,
      CHAN_BOND_SEQ_1_1 => B"0000000000",
      CHAN_BOND_SEQ_1_2 => B"0000000000",
      CHAN_BOND_SEQ_1_3 => B"0000000000",
      CHAN_BOND_SEQ_1_4 => B"0000000000",
      CHAN_BOND_SEQ_1_ENABLE => B"1111",
      CHAN_BOND_SEQ_2_1 => B"0000000000",
      CHAN_BOND_SEQ_2_2 => B"0000000000",
      CHAN_BOND_SEQ_2_3 => B"0000000000",
      CHAN_BOND_SEQ_2_4 => B"0000000000",
      CHAN_BOND_SEQ_2_ENABLE => B"1111",
      CHAN_BOND_SEQ_2_USE => "FALSE",
      CHAN_BOND_SEQ_LEN => 1,
      CLK_COMMON_SWING => '0',
      CLK_CORRECT_USE => "FALSE",
      CLK_COR_KEEP_IDLE => "FALSE",
      CLK_COR_MAX_LAT => 9,
      CLK_COR_MIN_LAT => 7,
      CLK_COR_PRECEDENCE => "TRUE",
      CLK_COR_REPEAT_WAIT => 0,
      CLK_COR_SEQ_1_1 => B"0100000000",
      CLK_COR_SEQ_1_2 => B"0000000000",
      CLK_COR_SEQ_1_3 => B"0000000000",
      CLK_COR_SEQ_1_4 => B"0000000000",
      CLK_COR_SEQ_1_ENABLE => B"1111",
      CLK_COR_SEQ_2_1 => B"0100000000",
      CLK_COR_SEQ_2_2 => B"0000000000",
      CLK_COR_SEQ_2_3 => B"0000000000",
      CLK_COR_SEQ_2_4 => B"0000000000",
      CLK_COR_SEQ_2_ENABLE => B"1111",
      CLK_COR_SEQ_2_USE => "FALSE",
      CLK_COR_SEQ_LEN => 1,
      DEC_MCOMMA_DETECT => "FALSE",
      DEC_PCOMMA_DETECT => "FALSE",
      DEC_VALID_COMMA_ONLY => "FALSE",
      DMONITOR_CFG => X"000A00",
      ES_CLK_PHASE_SEL => '0',
      ES_CONTROL => B"000000",
      ES_ERRDET_EN => "FALSE",
      ES_EYE_SCAN_EN => "FALSE",
      ES_HORZ_OFFSET => X"010",
      ES_PMA_CFG => B"0000000000",
      ES_PRESCALE => B"00000",
      ES_QUALIFIER => X"00000000000000000000",
      ES_QUAL_MASK => X"00000000000000000000",
      ES_SDATA_MASK => X"00000000000000000000",
      ES_VERT_OFFSET => B"000000000",
      FTS_DESKEW_SEQ_ENABLE => B"1111",
      FTS_LANE_DESKEW_CFG => B"1111",
      FTS_LANE_DESKEW_EN => "FALSE",
      GEARBOX_MODE => B"000",
      IS_CLKRSVD0_INVERTED => '0',
      IS_CLKRSVD1_INVERTED => '0',
      IS_DMONITORCLK_INVERTED => '0',
      IS_DRPCLK_INVERTED => '0',
      IS_RXUSRCLK2_INVERTED => '0',
      IS_RXUSRCLK_INVERTED => '0',
      IS_SIGVALIDCLK_INVERTED => '0',
      IS_TXPHDLYTSTCLK_INVERTED => '0',
      IS_TXUSRCLK2_INVERTED => '0',
      IS_TXUSRCLK_INVERTED => '0',
      LOOPBACK_CFG => '0',
      OUTREFCLK_SEL_INV => B"11",
      PCS_PCIE_EN => "FALSE",
      PCS_RSVD_ATTR => X"000000000000",
      PD_TRANS_TIME_FROM_P2 => X"03C",
      PD_TRANS_TIME_NONE_P2 => X"19",
      PD_TRANS_TIME_TO_P2 => X"64",
      PMA_LOOPBACK_CFG => '0',
      PMA_RSV => X"00000333",
      PMA_RSV2 => X"00002040",
      PMA_RSV3 => B"00",
      PMA_RSV4 => B"0000",
      PMA_RSV5 => '0',
      PMA_RSV6 => '0',
      PMA_RSV7 => '0',
      RXBUFRESET_TIME => B"00001",
      RXBUF_ADDR_MODE => "FAST",
      RXBUF_EIDLE_HI_CNT => B"1000",
      RXBUF_EIDLE_LO_CNT => B"0000",
      RXBUF_EN => "TRUE",
      RXBUF_RESET_ON_CB_CHANGE => "TRUE",
      RXBUF_RESET_ON_COMMAALIGN => "FALSE",
      RXBUF_RESET_ON_EIDLE => "FALSE",
      RXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      RXBUF_THRESH_OVFLW => 61,
      RXBUF_THRESH_OVRD => "FALSE",
      RXBUF_THRESH_UNDFLW => 4,
      RXCDRFREQRESET_TIME => B"00001",
      RXCDRPHRESET_TIME => B"00001",
      RXCDR_CFG => X"0001107FE206021081010",
      RXCDR_FR_RESET_ON_EIDLE => '0',
      RXCDR_HOLD_DURING_EIDLE => '0',
      RXCDR_LOCK_CFG => B"001001",
      RXCDR_PH_RESET_ON_EIDLE => '0',
      RXDLY_CFG => X"001F",
      RXDLY_LCFG => X"030",
      RXDLY_TAP_CFG => X"0000",
      RXGEARBOX_EN => "FALSE",
      RXISCANRESET_TIME => B"00001",
      RXLPMRESET_TIME => B"0001111",
      RXLPM_BIAS_STARTUP_DISABLE => '1',
      RXLPM_CFG => B"0110",
      RXLPM_CFG1 => '0',
      RXLPM_CM_CFG => '0',
      RXLPM_GC_CFG => B"111100010",
      RXLPM_GC_CFG2 => B"001",
      RXLPM_HF_CFG => B"00001111110000",
      RXLPM_HF_CFG2 => B"01010",
      RXLPM_HF_CFG3 => B"0000",
      RXLPM_HOLD_DURING_EIDLE => '0',
      RXLPM_INCM_CFG => '1',
      RXLPM_IPCM_CFG => '0',
      RXLPM_LF_CFG => B"000000001111110000",
      RXLPM_LF_CFG2 => B"01010",
      RXLPM_OSINT_CFG => B"100",
      RXOOB_CFG => B"0000110",
      RXOOB_CLK_CFG => "PMA",
      RXOSCALRESET_TIME => B"00011",
      RXOSCALRESET_TIMEOUT => B"00000",
      RXOUT_DIV => 2,
      RXPCSRESET_TIME => B"00001",
      RXPHDLY_CFG => X"084020",
      RXPH_CFG => X"C00002",
      RXPH_MONITOR_SEL => B"00000",
      RXPI_CFG0 => B"000",
      RXPI_CFG1 => '1',
      RXPI_CFG2 => '1',
      RXPMARESET_TIME => B"00011",
      RXPRBS_ERR_LOOPBACK => '0',
      RXSLIDE_AUTO_WAIT => 7,
      RXSLIDE_MODE => "OFF",
      RXSYNC_MULTILANE => '0',
      RXSYNC_OVRD => '0',
      RXSYNC_SKIP_DA => '0',
      RX_BIAS_CFG => B"0000111100110011",
      RX_BUFFER_CFG => B"000000",
      RX_CLK25_DIV => 6,
      RX_CLKMUX_EN => '1',
      RX_CM_SEL => B"00",
      RX_CM_TRIM => B"0000",
      RX_DATA_WIDTH => 20,
      RX_DDI_SEL => B"000000",
      RX_DEBUG_CFG => B"00000000000000",
      RX_DEFER_RESET_BUF_EN => "TRUE",
      RX_DISPERR_SEQ_MATCH => "FALSE",
      RX_OS_CFG => B"0000010000000",
      RX_SIG_VALID_DLY => 10,
      RX_XCLK_SEL => "RXREC",
      SAS_MAX_COM => 64,
      SAS_MIN_COM => 36,
      SATA_BURST_SEQ_LEN => B"0101",
      SATA_BURST_VAL => B"100",
      SATA_EIDLE_VAL => B"100",
      SATA_MAX_BURST => 8,
      SATA_MAX_INIT => 21,
      SATA_MAX_WAKE => 7,
      SATA_MIN_BURST => 4,
      SATA_MIN_INIT => 12,
      SATA_MIN_WAKE => 4,
      SATA_PLL_CFG => "VCO_3000MHZ",
      SHOW_REALIGN_COMMA => "TRUE",
      SIM_RECEIVER_DETECT_PASS => "TRUE",
      SIM_RESET_SPEEDUP => "FALSE",
      SIM_TX_EIDLE_DRIVE_LEVEL => "X",
      SIM_VERSION => "2.0",
      TERM_RCAL_CFG => B"100001000010000",
      TERM_RCAL_OVRD => B"000",
      TRANS_TIME_RATE => X"0E",
      TST_RSV => X"00000000",
      TXBUF_EN => "TRUE",
      TXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      TXDLY_CFG => X"001F",
      TXDLY_LCFG => X"030",
      TXDLY_TAP_CFG => X"0000",
      TXGEARBOX_EN => "FALSE",
      TXOOB_CFG => '0',
      TXOUT_DIV => 2,
      TXPCSRESET_TIME => B"00001",
      TXPHDLY_CFG => X"084020",
      TXPH_CFG => X"0780",
      TXPH_MONITOR_SEL => B"00000",
      TXPI_CFG0 => B"00",
      TXPI_CFG1 => B"00",
      TXPI_CFG2 => B"00",
      TXPI_CFG3 => '0',
      TXPI_CFG4 => '0',
      TXPI_CFG5 => B"000",
      TXPI_GREY_SEL => '0',
      TXPI_INVSTROBE_SEL => '0',
      TXPI_PPMCLK_SEL => "TXUSRCLK2",
      TXPI_PPM_CFG => B"00000000",
      TXPI_SYNFREQ_PPM => B"001",
      TXPMARESET_TIME => B"00001",
      TXSYNC_MULTILANE => '0',
      TXSYNC_OVRD => '0',
      TXSYNC_SKIP_DA => '0',
      TX_CLK25_DIV => 6,
      TX_CLKMUX_EN => '1',
      TX_DATA_WIDTH => 20,
      TX_DEEMPH0 => B"000000",
      TX_DEEMPH1 => B"000000",
      TX_DRIVE_MODE => "DIRECT",
      TX_EIDLE_ASSERT_DELAY => B"110",
      TX_EIDLE_DEASSERT_DELAY => B"100",
      TX_LOOPBACK_DRIVE_HIZ => "FALSE",
      TX_MAINCURSOR_SEL => '0',
      TX_MARGIN_FULL_0 => B"1001110",
      TX_MARGIN_FULL_1 => B"1001001",
      TX_MARGIN_FULL_2 => B"1000101",
      TX_MARGIN_FULL_3 => B"1000010",
      TX_MARGIN_FULL_4 => B"1000000",
      TX_MARGIN_LOW_0 => B"1000110",
      TX_MARGIN_LOW_1 => B"1000100",
      TX_MARGIN_LOW_2 => B"1000010",
      TX_MARGIN_LOW_3 => B"1000000",
      TX_MARGIN_LOW_4 => B"1000000",
      TX_PREDRIVER_MODE => '0',
      TX_RXDETECT_CFG => X"1832",
      TX_RXDETECT_REF => B"100",
      TX_XCLK_SEL => "TXOUT",
      UCODEER_CLR => '0',
      USE_PCS_CLK_PHASE_SEL => '0'
    )
        port map (
      CFGRESET => '0',
      CLKRSVD0 => '0',
      CLKRSVD1 => '0',
      DMONFIFORESET => '0',
      DMONITORCLK => '0',
      DMONITOROUT(14 downto 0) => gt0_dmonitorout_out(14 downto 0),
      DRPADDR(8 downto 0) => drpaddr_i(8 downto 0),
      DRPCLK => gt0_drpclk_in,
      DRPDI(15 downto 0) => drpdi_i(15 downto 0),
      DRPDO(15 downto 0) => \^d\(15 downto 0),
      DRPEN => drpen_i,
      DRPRDY => \^gtpe2_i_0\,
      DRPWE => drpwe_i,
      EYESCANDATAERROR => gt0_eyescandataerror_out,
      EYESCANMODE => '0',
      EYESCANRESET => gt0_eyescanreset_in,
      EYESCANTRIGGER => gt0_eyescantrigger_in,
      GTPRXN => gt0_gtprxn_in,
      GTPRXP => gt0_gtprxp_in,
      GTPTXN => NLW_gtpe2_i_GTPTXN_UNCONNECTED,
      GTPTXP => NLW_gtpe2_i_GTPTXP_UNCONNECTED,
      GTRESETSEL => '0',
      GTRSVD(15 downto 0) => B"0000000000000000",
      GTRXRESET => gtrxreset_out,
      GTTXRESET => '1',
      LOOPBACK(2 downto 0) => gt0_loopback_in(2 downto 0),
      PCSRSVDIN(15 downto 0) => B"0000000000000000",
      PCSRSVDOUT(15 downto 0) => NLW_gtpe2_i_PCSRSVDOUT_UNCONNECTED(15 downto 0),
      PHYSTATUS => NLW_gtpe2_i_PHYSTATUS_UNCONNECTED,
      PLL0CLK => gt0_pll0outclk_in,
      PLL0REFCLK => gt0_pll0outrefclk_in,
      PLL1CLK => gt0_pll1outclk_in,
      PLL1REFCLK => gt0_pll1outrefclk_in,
      PMARSVDIN0 => '0',
      PMARSVDIN1 => '0',
      PMARSVDIN2 => '0',
      PMARSVDIN3 => '0',
      PMARSVDIN4 => '0',
      PMARSVDOUT0 => NLW_gtpe2_i_PMARSVDOUT0_UNCONNECTED,
      PMARSVDOUT1 => NLW_gtpe2_i_PMARSVDOUT1_UNCONNECTED,
      RESETOVRD => '0',
      RX8B10BEN => '0',
      RXADAPTSELTEST(13 downto 0) => B"00000000000000",
      RXBUFRESET => gt0_rxbufreset_in,
      RXBUFSTATUS(2 downto 0) => gt0_rxbufstatus_out(2 downto 0),
      RXBYTEISALIGNED => NLW_gtpe2_i_RXBYTEISALIGNED_UNCONNECTED,
      RXBYTEREALIGN => NLW_gtpe2_i_RXBYTEREALIGN_UNCONNECTED,
      RXCDRFREQRESET => '0',
      RXCDRHOLD => '0',
      RXCDRLOCK => NLW_gtpe2_i_RXCDRLOCK_UNCONNECTED,
      RXCDROVRDEN => '0',
      RXCDRRESET => '0',
      RXCDRRESETRSV => '0',
      RXCHANBONDSEQ => NLW_gtpe2_i_RXCHANBONDSEQ_UNCONNECTED,
      RXCHANISALIGNED => NLW_gtpe2_i_RXCHANISALIGNED_UNCONNECTED,
      RXCHANREALIGN => NLW_gtpe2_i_RXCHANREALIGN_UNCONNECTED,
      RXCHARISCOMMA(3 downto 0) => NLW_gtpe2_i_RXCHARISCOMMA_UNCONNECTED(3 downto 0),
      RXCHARISK(3 downto 2) => NLW_gtpe2_i_RXCHARISK_UNCONNECTED(3 downto 2),
      RXCHARISK(1) => gt0_rxdata_out(18),
      RXCHARISK(0) => gt0_rxdata_out(8),
      RXCHBONDEN => '0',
      RXCHBONDI(3 downto 0) => B"0000",
      RXCHBONDLEVEL(2 downto 0) => B"000",
      RXCHBONDMASTER => '0',
      RXCHBONDO(3 downto 0) => NLW_gtpe2_i_RXCHBONDO_UNCONNECTED(3 downto 0),
      RXCHBONDSLAVE => '0',
      RXCLKCORCNT(1 downto 0) => NLW_gtpe2_i_RXCLKCORCNT_UNCONNECTED(1 downto 0),
      RXCOMINITDET => NLW_gtpe2_i_RXCOMINITDET_UNCONNECTED,
      RXCOMMADET => NLW_gtpe2_i_RXCOMMADET_UNCONNECTED,
      RXCOMMADETEN => '0',
      RXCOMSASDET => NLW_gtpe2_i_RXCOMSASDET_UNCONNECTED,
      RXCOMWAKEDET => NLW_gtpe2_i_RXCOMWAKEDET_UNCONNECTED,
      RXDATA(31 downto 16) => NLW_gtpe2_i_RXDATA_UNCONNECTED(31 downto 16),
      RXDATA(15 downto 8) => gt0_rxdata_out(17 downto 10),
      RXDATA(7 downto 0) => gt0_rxdata_out(7 downto 0),
      RXDATAVALID(1 downto 0) => NLW_gtpe2_i_RXDATAVALID_UNCONNECTED(1 downto 0),
      RXDDIEN => '0',
      RXDFEXYDEN => '0',
      RXDISPERR(3 downto 2) => NLW_gtpe2_i_RXDISPERR_UNCONNECTED(3 downto 2),
      RXDISPERR(1) => gt0_rxdata_out(19),
      RXDISPERR(0) => gt0_rxdata_out(9),
      RXDLYBYPASS => '1',
      RXDLYEN => '0',
      RXDLYOVRDEN => '0',
      RXDLYSRESET => '0',
      RXDLYSRESETDONE => NLW_gtpe2_i_RXDLYSRESETDONE_UNCONNECTED,
      RXELECIDLE => NLW_gtpe2_i_RXELECIDLE_UNCONNECTED,
      RXELECIDLEMODE(1 downto 0) => B"11",
      RXGEARBOXSLIP => '0',
      RXHEADER(2 downto 0) => NLW_gtpe2_i_RXHEADER_UNCONNECTED(2 downto 0),
      RXHEADERVALID => NLW_gtpe2_i_RXHEADERVALID_UNCONNECTED,
      RXLPMHFHOLD => gt0_rxlpmhfhold_in,
      RXLPMHFOVRDEN => '0',
      RXLPMLFHOLD => gt0_rxlpmlfhold_in,
      RXLPMLFOVRDEN => '0',
      RXLPMOSINTNTRLEN => '0',
      RXLPMRESET => gt0_rxlpmreset_in,
      RXMCOMMAALIGNEN => '0',
      RXNOTINTABLE(3 downto 0) => NLW_gtpe2_i_RXNOTINTABLE_UNCONNECTED(3 downto 0),
      RXOOBRESET => '0',
      RXOSCALRESET => '0',
      RXOSHOLD => '0',
      RXOSINTCFG(3 downto 0) => B"0010",
      RXOSINTDONE => NLW_gtpe2_i_RXOSINTDONE_UNCONNECTED,
      RXOSINTEN => '1',
      RXOSINTHOLD => '0',
      RXOSINTID0(3 downto 0) => B"0000",
      RXOSINTNTRLEN => '0',
      RXOSINTOVRDEN => '0',
      RXOSINTPD => '0',
      RXOSINTSTARTED => NLW_gtpe2_i_RXOSINTSTARTED_UNCONNECTED,
      RXOSINTSTROBE => '0',
      RXOSINTSTROBEDONE => NLW_gtpe2_i_RXOSINTSTROBEDONE_UNCONNECTED,
      RXOSINTSTROBESTARTED => NLW_gtpe2_i_RXOSINTSTROBESTARTED_UNCONNECTED,
      RXOSINTTESTOVRDEN => '0',
      RXOSOVRDEN => '0',
      RXOUTCLK => gt0_rxoutclk_out,
      RXOUTCLKFABRIC => gt0_rxoutclkfabric_out,
      RXOUTCLKPCS => NLW_gtpe2_i_RXOUTCLKPCS_UNCONNECTED,
      RXOUTCLKSEL(2 downto 0) => B"010",
      RXPCOMMAALIGNEN => '0',
      RXPCSRESET => gt0_rxpcsreset_in,
      RXPD(1 downto 0) => B"00",
      RXPHALIGN => '0',
      RXPHALIGNDONE => NLW_gtpe2_i_RXPHALIGNDONE_UNCONNECTED,
      RXPHALIGNEN => '0',
      RXPHDLYPD => '0',
      RXPHDLYRESET => '0',
      RXPHMONITOR(4 downto 0) => NLW_gtpe2_i_RXPHMONITOR_UNCONNECTED(4 downto 0),
      RXPHOVRDEN => '0',
      RXPHSLIPMONITOR(4 downto 0) => NLW_gtpe2_i_RXPHSLIPMONITOR_UNCONNECTED(4 downto 0),
      RXPMARESET => '0',
      RXPMARESETDONE => gt0_rxpmaresetdone_i,
      RXPOLARITY => '0',
      RXPRBSCNTRESET => '0',
      RXPRBSERR => NLW_gtpe2_i_RXPRBSERR_UNCONNECTED,
      RXPRBSSEL(2 downto 0) => B"000",
      RXRATE(2 downto 0) => rxrate_out_i(2 downto 0),
      RXRATEDONE => gt0_rxratedone_out,
      RXRATEMODE => '0',
      RXRESETDONE => gt0_rxresetdone_out,
      RXSLIDE => '0',
      RXSTARTOFSEQ(1 downto 0) => NLW_gtpe2_i_RXSTARTOFSEQ_UNCONNECTED(1 downto 0),
      RXSTATUS(2 downto 0) => NLW_gtpe2_i_RXSTATUS_UNCONNECTED(2 downto 0),
      RXSYNCALLIN => '0',
      RXSYNCDONE => NLW_gtpe2_i_RXSYNCDONE_UNCONNECTED,
      RXSYNCIN => '0',
      RXSYNCMODE => '0',
      RXSYNCOUT => NLW_gtpe2_i_RXSYNCOUT_UNCONNECTED,
      RXSYSCLKSEL(1 downto 0) => B"00",
      RXUSERRDY => gt0_rxuserrdy_i,
      RXUSRCLK => gt0_rxusrclk_in,
      RXUSRCLK2 => gt0_rxusrclk2_in,
      RXVALID => NLW_gtpe2_i_RXVALID_UNCONNECTED,
      SETERRSTATUS => '0',
      SIGVALIDCLK => '0',
      TSTIN(19 downto 0) => B"11111111111111111111",
      TX8B10BBYPASS(3 downto 0) => B"0000",
      TX8B10BEN => '0',
      TXBUFDIFFCTRL(2 downto 0) => B"100",
      TXBUFSTATUS(1 downto 0) => gt0_txbufstatus_out(1 downto 0),
      TXCHARDISPMODE(3 downto 0) => B"0000",
      TXCHARDISPVAL(3 downto 0) => B"0000",
      TXCHARISK(3 downto 0) => B"0000",
      TXCOMFINISH => NLW_gtpe2_i_TXCOMFINISH_UNCONNECTED,
      TXCOMINIT => '0',
      TXCOMSAS => '0',
      TXCOMWAKE => '0',
      TXDATA(31 downto 0) => B"00000000000000000000000000000000",
      TXDEEMPH => '0',
      TXDETECTRX => '0',
      TXDIFFCTRL(3 downto 0) => B"1000",
      TXDIFFPD => '1',
      TXDLYBYPASS => '1',
      TXDLYEN => '0',
      TXDLYHOLD => '0',
      TXDLYOVRDEN => '0',
      TXDLYSRESET => '0',
      TXDLYSRESETDONE => NLW_gtpe2_i_TXDLYSRESETDONE_UNCONNECTED,
      TXDLYUPDOWN => '0',
      TXELECIDLE => '1',
      TXGEARBOXREADY => NLW_gtpe2_i_TXGEARBOXREADY_UNCONNECTED,
      TXHEADER(2 downto 0) => B"000",
      TXINHIBIT => '0',
      TXMAINCURSOR(6 downto 0) => B"0000000",
      TXMARGIN(2 downto 0) => B"000",
      TXOUTCLK => NLW_gtpe2_i_TXOUTCLK_UNCONNECTED,
      TXOUTCLKFABRIC => NLW_gtpe2_i_TXOUTCLKFABRIC_UNCONNECTED,
      TXOUTCLKPCS => NLW_gtpe2_i_TXOUTCLKPCS_UNCONNECTED,
      TXOUTCLKSEL(2 downto 0) => B"010",
      TXPCSRESET => gt0_txpcsreset_in,
      TXPD(1 downto 0) => B"11",
      TXPDELECIDLEMODE => '1',
      TXPHALIGN => '0',
      TXPHALIGNDONE => NLW_gtpe2_i_TXPHALIGNDONE_UNCONNECTED,
      TXPHALIGNEN => '0',
      TXPHDLYPD => '1',
      TXPHDLYRESET => '0',
      TXPHDLYTSTCLK => '0',
      TXPHINIT => '0',
      TXPHINITDONE => NLW_gtpe2_i_TXPHINITDONE_UNCONNECTED,
      TXPHOVRDEN => '0',
      TXPIPPMEN => '0',
      TXPIPPMOVRDEN => '0',
      TXPIPPMPD => '1',
      TXPIPPMSEL => '0',
      TXPIPPMSTEPSIZE(4 downto 0) => B"00000",
      TXPISOPD => '1',
      TXPMARESET => '0',
      TXPMARESETDONE => NLW_gtpe2_i_TXPMARESETDONE_UNCONNECTED,
      TXPOLARITY => '0',
      TXPOSTCURSOR(4 downto 0) => B"00000",
      TXPOSTCURSORINV => '0',
      TXPRBSFORCEERR => '0',
      TXPRBSSEL(2 downto 0) => B"000",
      TXPRECURSOR(4 downto 0) => B"00000",
      TXPRECURSORINV => '0',
      TXRATE(2 downto 0) => B"000",
      TXRATEDONE => NLW_gtpe2_i_TXRATEDONE_UNCONNECTED,
      TXRATEMODE => '0',
      TXRESETDONE => NLW_gtpe2_i_TXRESETDONE_UNCONNECTED,
      TXSEQUENCE(6 downto 0) => B"0000000",
      TXSTARTSEQ => '0',
      TXSWING => '0',
      TXSYNCALLIN => '0',
      TXSYNCDONE => NLW_gtpe2_i_TXSYNCDONE_UNCONNECTED,
      TXSYNCIN => '0',
      TXSYNCMODE => '0',
      TXSYNCOUT => NLW_gtpe2_i_TXSYNCOUT_UNCONNECTED,
      TXSYSCLKSEL(1 downto 0) => B"11",
      TXUSERRDY => '0',
      TXUSRCLK => '0',
      TXUSRCLK2 => '0'
    );
gtrxreset_seq_i: entity work.gtwizard_0_gtrxreset_seq
     port map (
      AR(0) => AR(0),
      D(15 downto 0) => \^d\(15 downto 0),
      DRPDI(0) => drpdi_i(11),
      DRP_OP_DONE_reg_0 => gtrxreset_seq_i_n_20,
      \FSM_onehot_state_reg[3]_0\ => \^gtpe2_i_0\,
      \FSM_onehot_state_reg[5]_0\ => gtrxreset_seq_i_n_19,
      \FSM_onehot_state_reg[7]_0\(0) => gtrxreset_seq_i_n_21,
      Q(14 downto 11) => rd_data(15 downto 12),
      Q(10 downto 0) => rd_data(10 downto 0),
      SR(0) => SR(0),
      data_in => gt0_rxpmaresetdone_i,
      drp_busy_i10 => drp_busy_i10,
      drp_op_done => drp_op_done,
      drpwe_i => drpwe_i,
      gt0_drpclk_in => gt0_drpclk_in,
      gt0_drpdi_in(0) => gt0_drpdi_in(11),
      gt0_drpwe_in => gt0_drpwe_in,
      gtpe2_i => rxrate_seq_i_n_27,
      gtpe2_i_0 => rxrate_seq_i_n_17,
      gtrxreset_out => gtrxreset_out
    );
rxrate_seq_i: entity work.gtwizard_0_rxrate_seq
     port map (
      AR(0) => AR(0),
      D(15 downto 0) => \^d\(15 downto 0),
      DRPADDR(8 downto 0) => drpaddr_i(8 downto 0),
      DRPDI(14 downto 11) => drpdi_i(15 downto 12),
      DRPDI(10 downto 0) => drpdi_i(10 downto 0),
      DRP_OP_DONE_reg => rxrate_seq_i_n_17,
      \FSM_sequential_state_reg[0]_0\ => \^gtpe2_i_0\,
      Q(14 downto 11) => rd_data(15 downto 12),
      Q(10 downto 0) => rd_data(10 downto 0),
      data_in => gt0_rxpmaresetdone_i,
      drp_busy_i10 => drp_busy_i10,
      drp_busy_i2 => drp_busy_i2,
      drp_op_done => drp_op_done,
      drpen_i => drpen_i,
      gt0_drpaddr_in(8 downto 0) => gt0_drpaddr_in(8 downto 0),
      gt0_drpclk_in => gt0_drpclk_in,
      gt0_drpdi_in(14 downto 11) => gt0_drpdi_in(15 downto 12),
      gt0_drpdi_in(10 downto 0) => gt0_drpdi_in(10 downto 0),
      gt0_drpen_in => gt0_drpen_in,
      gt0_rxrate_in(2 downto 0) => gt0_rxrate_in(2 downto 0),
      gtpe2_i(0) => gtrxreset_seq_i_n_21,
      gtpe2_i_0 => gtrxreset_seq_i_n_19,
      \rd_data_reg[11]_0\ => rxrate_seq_i_n_27,
      \rxrate_o_reg[2]_0\(2 downto 0) => rxrate_out(2 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_multi_gt is
  port (
    gtpe2_i : out STD_LOGIC;
    gt0_eyescandataerror_out : out STD_LOGIC;
    gt0_rxoutclk_out : out STD_LOGIC;
    gt0_rxoutclkfabric_out : out STD_LOGIC;
    gt0_rxratedone_out : out STD_LOGIC;
    gt0_rxresetdone_out : out STD_LOGIC;
    gt0_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxdata_out : out STD_LOGIC_VECTOR ( 19 downto 0 );
    gt0_drp_busy_out : out STD_LOGIC;
    gt0_drpclk_in : in STD_LOGIC;
    gt0_eyescanreset_in : in STD_LOGIC;
    gt0_eyescantrigger_in : in STD_LOGIC;
    gt0_gtprxn_in : in STD_LOGIC;
    gt0_gtprxp_in : in STD_LOGIC;
    gt0_pll0outclk_in : in STD_LOGIC;
    gt0_pll0outrefclk_in : in STD_LOGIC;
    gt0_pll1outclk_in : in STD_LOGIC;
    gt0_pll1outrefclk_in : in STD_LOGIC;
    gt0_rxbufreset_in : in STD_LOGIC;
    gt0_rxlpmhfhold_in : in STD_LOGIC;
    gt0_rxlpmlfhold_in : in STD_LOGIC;
    gt0_rxlpmreset_in : in STD_LOGIC;
    gt0_rxpcsreset_in : in STD_LOGIC;
    gt0_rxuserrdy_i : in STD_LOGIC;
    gt0_rxusrclk_in : in STD_LOGIC;
    gt0_rxusrclk2_in : in STD_LOGIC;
    gt0_txpcsreset_in : in STD_LOGIC;
    gt0_loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt0_rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_drpen_in : in STD_LOGIC;
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpwe_in : in STD_LOGIC;
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
end gtwizard_0_multi_gt;

architecture STRUCTURE of gtwizard_0_multi_gt is
begin
gt0_gtwizard_0_i: entity work.gtwizard_0_GT
     port map (
      AR(0) => AR(0),
      D(15 downto 0) => D(15 downto 0),
      SR(0) => SR(0),
      gt0_dmonitorout_out(14 downto 0) => gt0_dmonitorout_out(14 downto 0),
      gt0_drp_busy_out => gt0_drp_busy_out,
      gt0_drpaddr_in(8 downto 0) => gt0_drpaddr_in(8 downto 0),
      gt0_drpclk_in => gt0_drpclk_in,
      gt0_drpdi_in(15 downto 0) => gt0_drpdi_in(15 downto 0),
      gt0_drpen_in => gt0_drpen_in,
      gt0_drpwe_in => gt0_drpwe_in,
      gt0_eyescandataerror_out => gt0_eyescandataerror_out,
      gt0_eyescanreset_in => gt0_eyescanreset_in,
      gt0_eyescantrigger_in => gt0_eyescantrigger_in,
      gt0_gtprxn_in => gt0_gtprxn_in,
      gt0_gtprxp_in => gt0_gtprxp_in,
      gt0_loopback_in(2 downto 0) => gt0_loopback_in(2 downto 0),
      gt0_pll0outclk_in => gt0_pll0outclk_in,
      gt0_pll0outrefclk_in => gt0_pll0outrefclk_in,
      gt0_pll1outclk_in => gt0_pll1outclk_in,
      gt0_pll1outrefclk_in => gt0_pll1outrefclk_in,
      gt0_rxbufreset_in => gt0_rxbufreset_in,
      gt0_rxbufstatus_out(2 downto 0) => gt0_rxbufstatus_out(2 downto 0),
      gt0_rxdata_out(19 downto 0) => gt0_rxdata_out(19 downto 0),
      gt0_rxlpmhfhold_in => gt0_rxlpmhfhold_in,
      gt0_rxlpmlfhold_in => gt0_rxlpmlfhold_in,
      gt0_rxlpmreset_in => gt0_rxlpmreset_in,
      gt0_rxoutclk_out => gt0_rxoutclk_out,
      gt0_rxoutclkfabric_out => gt0_rxoutclkfabric_out,
      gt0_rxpcsreset_in => gt0_rxpcsreset_in,
      gt0_rxrate_in(2 downto 0) => gt0_rxrate_in(2 downto 0),
      gt0_rxratedone_out => gt0_rxratedone_out,
      gt0_rxresetdone_out => gt0_rxresetdone_out,
      gt0_rxuserrdy_i => gt0_rxuserrdy_i,
      gt0_rxusrclk2_in => gt0_rxusrclk2_in,
      gt0_rxusrclk_in => gt0_rxusrclk_in,
      gt0_txbufstatus_out(1 downto 0) => gt0_txbufstatus_out(1 downto 0),
      gt0_txpcsreset_in => gt0_txpcsreset_in,
      gtpe2_i_0 => gtpe2_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0_init is
  port (
    sysclk_in : in STD_LOGIC;
    soft_reset_rx_in : in STD_LOGIC;
    dont_reset_on_data_error_in : in STD_LOGIC;
    gt0_drp_busy_out : out STD_LOGIC;
    gt0_tx_fsm_reset_done_out : out STD_LOGIC;
    gt0_rx_fsm_reset_done_out : out STD_LOGIC;
    gt0_data_valid_in : in STD_LOGIC;
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt0_drpclk_in : in STD_LOGIC;
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpen_in : in STD_LOGIC;
    gt0_drprdy_out : out STD_LOGIC;
    gt0_drpwe_in : in STD_LOGIC;
    gt0_loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_eyescanreset_in : in STD_LOGIC;
    gt0_rxuserrdy_in : in STD_LOGIC;
    gt0_eyescandataerror_out : out STD_LOGIC;
    gt0_eyescantrigger_in : in STD_LOGIC;
    gt0_rxdata_out : out STD_LOGIC_VECTOR ( 19 downto 0 );
    gt0_rxusrclk_in : in STD_LOGIC;
    gt0_rxusrclk2_in : in STD_LOGIC;
    gt0_gtprxn_in : in STD_LOGIC;
    gt0_gtprxp_in : in STD_LOGIC;
    gt0_rxbufreset_in : in STD_LOGIC;
    gt0_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt0_rxlpmhfhold_in : in STD_LOGIC;
    gt0_rxlpmlfhold_in : in STD_LOGIC;
    gt0_rxratedone_out : out STD_LOGIC;
    gt0_rxoutclk_out : out STD_LOGIC;
    gt0_rxoutclkfabric_out : out STD_LOGIC;
    gt0_gtrxreset_in : in STD_LOGIC;
    gt0_rxlpmreset_in : in STD_LOGIC;
    gt0_rxpcsreset_in : in STD_LOGIC;
    gt0_rxresetdone_out : out STD_LOGIC;
    gt0_gttxreset_in : in STD_LOGIC;
    gt0_txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_txpcsreset_in : in STD_LOGIC;
    gt0_pll0reset_out : out STD_LOGIC;
    gt0_pll0outclk_in : in STD_LOGIC;
    gt0_pll0outrefclk_in : in STD_LOGIC;
    gt0_pll0lock_in : in STD_LOGIC;
    gt0_pll0refclklost_in : in STD_LOGIC;
    gt0_pll1outclk_in : in STD_LOGIC;
    gt0_pll1outrefclk_in : in STD_LOGIC
  );
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of gtwizard_0_init : entity is "yes";
  attribute EXAMPLE_SIMULATION : integer;
  attribute EXAMPLE_SIMULATION of gtwizard_0_init : entity is 0;
  attribute EXAMPLE_SIM_GTRESET_SPEEDUP : string;
  attribute EXAMPLE_SIM_GTRESET_SPEEDUP of gtwizard_0_init : entity is "FALSE";
  attribute EXAMPLE_USE_CHIPSCOPE : integer;
  attribute EXAMPLE_USE_CHIPSCOPE of gtwizard_0_init : entity is 0;
  attribute RX_CDRLOCK_TIME : string;
  attribute RX_CDRLOCK_TIME of gtwizard_0_init : entity is "33670.033670";
  attribute STABLE_CLOCK_PERIOD : integer;
  attribute STABLE_CLOCK_PERIOD of gtwizard_0_init : entity is 10;
  attribute WAIT_TIME_CDRLOCK : integer;
  attribute WAIT_TIME_CDRLOCK of gtwizard_0_init : entity is 3367;
end gtwizard_0_init;

architecture STRUCTURE of gtwizard_0_init is
  signal \<const0>\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \^gt0_pll0reset_out\ : STD_LOGIC;
  signal gt0_rx_cdrlock_counter : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \gt0_rx_cdrlock_counter[31]_i_10_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_2_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_3_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_4_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_6_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_7_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_8_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_9_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[12]_i_2_n_1\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[12]_i_2_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[12]_i_2_n_3\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[16]_i_2_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[16]_i_2_n_1\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[16]_i_2_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[16]_i_2_n_3\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[20]_i_2_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[20]_i_2_n_1\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[20]_i_2_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[20]_i_2_n_3\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[24]_i_2_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[24]_i_2_n_1\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[24]_i_2_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[24]_i_2_n_3\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[28]_i_2_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[28]_i_2_n_1\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[28]_i_2_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[28]_i_2_n_3\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[31]_i_5_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[31]_i_5_n_3\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[10]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[11]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[12]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[13]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[14]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[15]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[16]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[17]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[18]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[19]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[20]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[21]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[22]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[23]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[24]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[25]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[26]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[27]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[28]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[29]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[30]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[31]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[6]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[7]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[8]\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter_reg_n_0_[9]\ : STD_LOGIC;
  signal gt0_rx_cdrlocked_i_1_n_0 : STD_LOGIC;
  signal gt0_rx_cdrlocked_reg_n_0 : STD_LOGIC;
  signal \^gt0_rxresetdone_out\ : STD_LOGIC;
  signal gt0_rxuserrdy_i : STD_LOGIC;
  signal gtrxreset_i : STD_LOGIC;
  signal \NLW_gt0_rx_cdrlock_counter_reg[31]_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gt0_rx_cdrlock_counter_reg[31]_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gt0_rx_cdrlock_counter[0]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \gt0_rx_cdrlock_counter[30]_i_1\ : label is "soft_lutpair40";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter_reg[12]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter_reg[16]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter_reg[20]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter_reg[24]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter_reg[28]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter_reg[31]_i_5\ : label is 35;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter_reg[4]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter_reg[8]_i_2\ : label is 35;
begin
  gt0_pll0reset_out <= \^gt0_pll0reset_out\;
  gt0_rxresetdone_out <= \^gt0_rxresetdone_out\;
  gt0_tx_fsm_reset_done_out <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gt0_rx_cdrlock_counter[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"01FF"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      O => gt0_rx_cdrlock_counter(0)
    );
\gt0_rx_cdrlock_counter[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAE"
    )
        port map (
      I0 => data0(10),
      I1 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      O => gt0_rx_cdrlock_counter(10)
    );
\gt0_rx_cdrlock_counter[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAE"
    )
        port map (
      I0 => data0(11),
      I1 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      O => gt0_rx_cdrlock_counter(11)
    );
\gt0_rx_cdrlock_counter[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(12),
      O => gt0_rx_cdrlock_counter(12)
    );
\gt0_rx_cdrlock_counter[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(13),
      O => gt0_rx_cdrlock_counter(13)
    );
\gt0_rx_cdrlock_counter[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(14),
      O => gt0_rx_cdrlock_counter(14)
    );
\gt0_rx_cdrlock_counter[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(15),
      O => gt0_rx_cdrlock_counter(15)
    );
\gt0_rx_cdrlock_counter[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(16),
      O => gt0_rx_cdrlock_counter(16)
    );
\gt0_rx_cdrlock_counter[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(17),
      O => gt0_rx_cdrlock_counter(17)
    );
\gt0_rx_cdrlock_counter[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(18),
      O => gt0_rx_cdrlock_counter(18)
    );
\gt0_rx_cdrlock_counter[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(19),
      O => gt0_rx_cdrlock_counter(19)
    );
\gt0_rx_cdrlock_counter[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAE"
    )
        port map (
      I0 => data0(1),
      I1 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      O => gt0_rx_cdrlock_counter(1)
    );
\gt0_rx_cdrlock_counter[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(20),
      O => gt0_rx_cdrlock_counter(20)
    );
\gt0_rx_cdrlock_counter[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(21),
      O => gt0_rx_cdrlock_counter(21)
    );
\gt0_rx_cdrlock_counter[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(22),
      O => gt0_rx_cdrlock_counter(22)
    );
\gt0_rx_cdrlock_counter[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(23),
      O => gt0_rx_cdrlock_counter(23)
    );
\gt0_rx_cdrlock_counter[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(24),
      O => gt0_rx_cdrlock_counter(24)
    );
\gt0_rx_cdrlock_counter[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(25),
      O => gt0_rx_cdrlock_counter(25)
    );
\gt0_rx_cdrlock_counter[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(26),
      O => gt0_rx_cdrlock_counter(26)
    );
\gt0_rx_cdrlock_counter[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(27),
      O => gt0_rx_cdrlock_counter(27)
    );
\gt0_rx_cdrlock_counter[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(28),
      O => gt0_rx_cdrlock_counter(28)
    );
\gt0_rx_cdrlock_counter[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(29),
      O => gt0_rx_cdrlock_counter(29)
    );
\gt0_rx_cdrlock_counter[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAE"
    )
        port map (
      I0 => data0(2),
      I1 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      O => gt0_rx_cdrlock_counter(2)
    );
\gt0_rx_cdrlock_counter[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(30),
      O => gt0_rx_cdrlock_counter(30)
    );
\gt0_rx_cdrlock_counter[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(31),
      O => gt0_rx_cdrlock_counter(31)
    );
\gt0_rx_cdrlock_counter[31]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[27]\,
      I1 => \gt0_rx_cdrlock_counter_reg_n_0_[26]\,
      I2 => \gt0_rx_cdrlock_counter_reg_n_0_[29]\,
      I3 => \gt0_rx_cdrlock_counter_reg_n_0_[28]\,
      O => \gt0_rx_cdrlock_counter[31]_i_10_n_0\
    );
\gt0_rx_cdrlock_counter[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEFFF"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[12]\,
      I1 => \gt0_rx_cdrlock_counter_reg_n_0_[13]\,
      I2 => \gt0_rx_cdrlock_counter_reg_n_0_[10]\,
      I3 => \gt0_rx_cdrlock_counter_reg_n_0_[11]\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_6_n_0\,
      O => \gt0_rx_cdrlock_counter[31]_i_2_n_0\
    );
\gt0_rx_cdrlock_counter[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[4]\,
      I1 => \gt0_rx_cdrlock_counter_reg_n_0_[5]\,
      I2 => \gt0_rx_cdrlock_counter_reg_n_0_[3]\,
      I3 => \gt0_rx_cdrlock_counter_reg_n_0_[2]\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_7_n_0\,
      O => \gt0_rx_cdrlock_counter[31]_i_3_n_0\
    );
\gt0_rx_cdrlock_counter[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFFFF"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter[31]_i_8_n_0\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_9_n_0\,
      I2 => \gt0_rx_cdrlock_counter_reg_n_0_[31]\,
      I3 => \gt0_rx_cdrlock_counter_reg_n_0_[30]\,
      I4 => \gt0_rx_cdrlock_counter_reg_n_0_[1]\,
      I5 => \gt0_rx_cdrlock_counter[31]_i_10_n_0\,
      O => \gt0_rx_cdrlock_counter[31]_i_4_n_0\
    );
\gt0_rx_cdrlock_counter[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[15]\,
      I1 => \gt0_rx_cdrlock_counter_reg_n_0_[14]\,
      I2 => \gt0_rx_cdrlock_counter_reg_n_0_[17]\,
      I3 => \gt0_rx_cdrlock_counter_reg_n_0_[16]\,
      O => \gt0_rx_cdrlock_counter[31]_i_6_n_0\
    );
\gt0_rx_cdrlock_counter[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[7]\,
      I1 => \gt0_rx_cdrlock_counter_reg_n_0_[6]\,
      I2 => \gt0_rx_cdrlock_counter_reg_n_0_[8]\,
      I3 => \gt0_rx_cdrlock_counter_reg_n_0_[9]\,
      O => \gt0_rx_cdrlock_counter[31]_i_7_n_0\
    );
\gt0_rx_cdrlock_counter[31]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[23]\,
      I1 => \gt0_rx_cdrlock_counter_reg_n_0_[22]\,
      I2 => \gt0_rx_cdrlock_counter_reg_n_0_[25]\,
      I3 => \gt0_rx_cdrlock_counter_reg_n_0_[24]\,
      O => \gt0_rx_cdrlock_counter[31]_i_8_n_0\
    );
\gt0_rx_cdrlock_counter[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[19]\,
      I1 => \gt0_rx_cdrlock_counter_reg_n_0_[18]\,
      I2 => \gt0_rx_cdrlock_counter_reg_n_0_[21]\,
      I3 => \gt0_rx_cdrlock_counter_reg_n_0_[20]\,
      O => \gt0_rx_cdrlock_counter[31]_i_9_n_0\
    );
\gt0_rx_cdrlock_counter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(3),
      O => gt0_rx_cdrlock_counter(3)
    );
\gt0_rx_cdrlock_counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(4),
      O => gt0_rx_cdrlock_counter(4)
    );
\gt0_rx_cdrlock_counter[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAE"
    )
        port map (
      I0 => data0(5),
      I1 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      O => gt0_rx_cdrlock_counter(5)
    );
\gt0_rx_cdrlock_counter[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(6),
      O => gt0_rx_cdrlock_counter(6)
    );
\gt0_rx_cdrlock_counter[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(7),
      O => gt0_rx_cdrlock_counter(7)
    );
\gt0_rx_cdrlock_counter[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAE"
    )
        port map (
      I0 => data0(8),
      I1 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      O => gt0_rx_cdrlock_counter(8)
    );
\gt0_rx_cdrlock_counter[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0000"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(9),
      O => gt0_rx_cdrlock_counter(9)
    );
\gt0_rx_cdrlock_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(0),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(10),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[10]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(11),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[11]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(12),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[12]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[12]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \gt0_rx_cdrlock_counter_reg[8]_i_2_n_0\,
      CO(3) => \gt0_rx_cdrlock_counter_reg[12]_i_2_n_0\,
      CO(2) => \gt0_rx_cdrlock_counter_reg[12]_i_2_n_1\,
      CO(1) => \gt0_rx_cdrlock_counter_reg[12]_i_2_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter_reg[12]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3) => \gt0_rx_cdrlock_counter_reg_n_0_[12]\,
      S(2) => \gt0_rx_cdrlock_counter_reg_n_0_[11]\,
      S(1) => \gt0_rx_cdrlock_counter_reg_n_0_[10]\,
      S(0) => \gt0_rx_cdrlock_counter_reg_n_0_[9]\
    );
\gt0_rx_cdrlock_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(13),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[13]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(14),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[14]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(15),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[15]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(16),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[16]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[16]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \gt0_rx_cdrlock_counter_reg[12]_i_2_n_0\,
      CO(3) => \gt0_rx_cdrlock_counter_reg[16]_i_2_n_0\,
      CO(2) => \gt0_rx_cdrlock_counter_reg[16]_i_2_n_1\,
      CO(1) => \gt0_rx_cdrlock_counter_reg[16]_i_2_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter_reg[16]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3) => \gt0_rx_cdrlock_counter_reg_n_0_[16]\,
      S(2) => \gt0_rx_cdrlock_counter_reg_n_0_[15]\,
      S(1) => \gt0_rx_cdrlock_counter_reg_n_0_[14]\,
      S(0) => \gt0_rx_cdrlock_counter_reg_n_0_[13]\
    );
\gt0_rx_cdrlock_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(17),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[17]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(18),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[18]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(19),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[19]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(1),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[1]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(20),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[20]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[20]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \gt0_rx_cdrlock_counter_reg[16]_i_2_n_0\,
      CO(3) => \gt0_rx_cdrlock_counter_reg[20]_i_2_n_0\,
      CO(2) => \gt0_rx_cdrlock_counter_reg[20]_i_2_n_1\,
      CO(1) => \gt0_rx_cdrlock_counter_reg[20]_i_2_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter_reg[20]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3) => \gt0_rx_cdrlock_counter_reg_n_0_[20]\,
      S(2) => \gt0_rx_cdrlock_counter_reg_n_0_[19]\,
      S(1) => \gt0_rx_cdrlock_counter_reg_n_0_[18]\,
      S(0) => \gt0_rx_cdrlock_counter_reg_n_0_[17]\
    );
\gt0_rx_cdrlock_counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(21),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[21]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(22),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[22]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(23),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[23]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(24),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[24]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[24]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \gt0_rx_cdrlock_counter_reg[20]_i_2_n_0\,
      CO(3) => \gt0_rx_cdrlock_counter_reg[24]_i_2_n_0\,
      CO(2) => \gt0_rx_cdrlock_counter_reg[24]_i_2_n_1\,
      CO(1) => \gt0_rx_cdrlock_counter_reg[24]_i_2_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter_reg[24]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(24 downto 21),
      S(3) => \gt0_rx_cdrlock_counter_reg_n_0_[24]\,
      S(2) => \gt0_rx_cdrlock_counter_reg_n_0_[23]\,
      S(1) => \gt0_rx_cdrlock_counter_reg_n_0_[22]\,
      S(0) => \gt0_rx_cdrlock_counter_reg_n_0_[21]\
    );
\gt0_rx_cdrlock_counter_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(25),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[25]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(26),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[26]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(27),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[27]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(28),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[28]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[28]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \gt0_rx_cdrlock_counter_reg[24]_i_2_n_0\,
      CO(3) => \gt0_rx_cdrlock_counter_reg[28]_i_2_n_0\,
      CO(2) => \gt0_rx_cdrlock_counter_reg[28]_i_2_n_1\,
      CO(1) => \gt0_rx_cdrlock_counter_reg[28]_i_2_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter_reg[28]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(28 downto 25),
      S(3) => \gt0_rx_cdrlock_counter_reg_n_0_[28]\,
      S(2) => \gt0_rx_cdrlock_counter_reg_n_0_[27]\,
      S(1) => \gt0_rx_cdrlock_counter_reg_n_0_[26]\,
      S(0) => \gt0_rx_cdrlock_counter_reg_n_0_[25]\
    );
\gt0_rx_cdrlock_counter_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(29),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[29]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(2),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[2]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(30),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[30]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(31),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[31]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[31]_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \gt0_rx_cdrlock_counter_reg[28]_i_2_n_0\,
      CO(3 downto 2) => \NLW_gt0_rx_cdrlock_counter_reg[31]_i_5_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \gt0_rx_cdrlock_counter_reg[31]_i_5_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter_reg[31]_i_5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_gt0_rx_cdrlock_counter_reg[31]_i_5_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(31 downto 29),
      S(3) => '0',
      S(2) => \gt0_rx_cdrlock_counter_reg_n_0_[31]\,
      S(1) => \gt0_rx_cdrlock_counter_reg_n_0_[30]\,
      S(0) => \gt0_rx_cdrlock_counter_reg_n_0_[29]\
    );
\gt0_rx_cdrlock_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(3),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[3]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(4),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[4]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \gt0_rx_cdrlock_counter_reg[4]_i_2_n_0\,
      CO(2) => \gt0_rx_cdrlock_counter_reg[4]_i_2_n_1\,
      CO(1) => \gt0_rx_cdrlock_counter_reg[4]_i_2_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter_reg[4]_i_2_n_3\,
      CYINIT => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3) => \gt0_rx_cdrlock_counter_reg_n_0_[4]\,
      S(2) => \gt0_rx_cdrlock_counter_reg_n_0_[3]\,
      S(1) => \gt0_rx_cdrlock_counter_reg_n_0_[2]\,
      S(0) => \gt0_rx_cdrlock_counter_reg_n_0_[1]\
    );
\gt0_rx_cdrlock_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(5),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[5]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(6),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[6]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(7),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[7]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(8),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[8]\,
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \gt0_rx_cdrlock_counter_reg[4]_i_2_n_0\,
      CO(3) => \gt0_rx_cdrlock_counter_reg[8]_i_2_n_0\,
      CO(2) => \gt0_rx_cdrlock_counter_reg[8]_i_2_n_1\,
      CO(1) => \gt0_rx_cdrlock_counter_reg[8]_i_2_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3) => \gt0_rx_cdrlock_counter_reg_n_0_[8]\,
      S(2) => \gt0_rx_cdrlock_counter_reg_n_0_[7]\,
      S(1) => \gt0_rx_cdrlock_counter_reg_n_0_[6]\,
      S(0) => \gt0_rx_cdrlock_counter_reg_n_0_[5]\
    );
\gt0_rx_cdrlock_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlock_counter(9),
      Q => \gt0_rx_cdrlock_counter_reg_n_0_[9]\,
      R => gtrxreset_i
    );
gt0_rx_cdrlocked_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAE"
    )
        port map (
      I0 => gt0_rx_cdrlocked_reg_n_0,
      I1 => \gt0_rx_cdrlock_counter_reg_n_0_[0]\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      O => gt0_rx_cdrlocked_i_1_n_0
    );
gt0_rx_cdrlocked_reg: unisim.vcomponents.FDRE
     port map (
      C => sysclk_in,
      CE => '1',
      D => gt0_rx_cdrlocked_i_1_n_0,
      Q => gt0_rx_cdrlocked_reg_n_0,
      R => gtrxreset_i
    );
gt0_rxresetfsm_i: entity work.gtwizard_0_RX_STARTUP_FSM
     port map (
      AR(0) => \^gt0_pll0reset_out\,
      SR(0) => gtrxreset_i,
      dont_reset_on_data_error_in => dont_reset_on_data_error_in,
      gt0_data_valid_in => gt0_data_valid_in,
      gt0_pll0lock_in => gt0_pll0lock_in,
      gt0_pll0refclklost_in => gt0_pll0refclklost_in,
      gt0_rx_fsm_reset_done_out => gt0_rx_fsm_reset_done_out,
      gt0_rxresetdone_out => \^gt0_rxresetdone_out\,
      gt0_rxuserrdy_i => gt0_rxuserrdy_i,
      gt0_rxusrclk_in => gt0_rxusrclk_in,
      reset_time_out_reg_0 => gt0_rx_cdrlocked_reg_n_0,
      soft_reset_rx_in => soft_reset_rx_in,
      sysclk_in => sysclk_in
    );
gtwizard_0_i: entity work.gtwizard_0_multi_gt
     port map (
      AR(0) => \^gt0_pll0reset_out\,
      D(15 downto 0) => gt0_drpdo_out(15 downto 0),
      SR(0) => gtrxreset_i,
      gt0_dmonitorout_out(14 downto 0) => gt0_dmonitorout_out(14 downto 0),
      gt0_drp_busy_out => gt0_drp_busy_out,
      gt0_drpaddr_in(8 downto 0) => gt0_drpaddr_in(8 downto 0),
      gt0_drpclk_in => gt0_drpclk_in,
      gt0_drpdi_in(15 downto 0) => gt0_drpdi_in(15 downto 0),
      gt0_drpen_in => gt0_drpen_in,
      gt0_drpwe_in => gt0_drpwe_in,
      gt0_eyescandataerror_out => gt0_eyescandataerror_out,
      gt0_eyescanreset_in => gt0_eyescanreset_in,
      gt0_eyescantrigger_in => gt0_eyescantrigger_in,
      gt0_gtprxn_in => gt0_gtprxn_in,
      gt0_gtprxp_in => gt0_gtprxp_in,
      gt0_loopback_in(2 downto 0) => gt0_loopback_in(2 downto 0),
      gt0_pll0outclk_in => gt0_pll0outclk_in,
      gt0_pll0outrefclk_in => gt0_pll0outrefclk_in,
      gt0_pll1outclk_in => gt0_pll1outclk_in,
      gt0_pll1outrefclk_in => gt0_pll1outrefclk_in,
      gt0_rxbufreset_in => gt0_rxbufreset_in,
      gt0_rxbufstatus_out(2 downto 0) => gt0_rxbufstatus_out(2 downto 0),
      gt0_rxdata_out(19 downto 0) => gt0_rxdata_out(19 downto 0),
      gt0_rxlpmhfhold_in => gt0_rxlpmhfhold_in,
      gt0_rxlpmlfhold_in => gt0_rxlpmlfhold_in,
      gt0_rxlpmreset_in => gt0_rxlpmreset_in,
      gt0_rxoutclk_out => gt0_rxoutclk_out,
      gt0_rxoutclkfabric_out => gt0_rxoutclkfabric_out,
      gt0_rxpcsreset_in => gt0_rxpcsreset_in,
      gt0_rxrate_in(2 downto 0) => gt0_rxrate_in(2 downto 0),
      gt0_rxratedone_out => gt0_rxratedone_out,
      gt0_rxresetdone_out => \^gt0_rxresetdone_out\,
      gt0_rxuserrdy_i => gt0_rxuserrdy_i,
      gt0_rxusrclk2_in => gt0_rxusrclk2_in,
      gt0_rxusrclk_in => gt0_rxusrclk_in,
      gt0_txbufstatus_out(1 downto 0) => gt0_txbufstatus_out(1 downto 0),
      gt0_txpcsreset_in => gt0_txpcsreset_in,
      gtpe2_i => gt0_drprdy_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_0 is
  port (
    sysclk_in : in STD_LOGIC;
    soft_reset_rx_in : in STD_LOGIC;
    dont_reset_on_data_error_in : in STD_LOGIC;
    gt0_drp_busy_out : out STD_LOGIC;
    gt0_tx_fsm_reset_done_out : out STD_LOGIC;
    gt0_rx_fsm_reset_done_out : out STD_LOGIC;
    gt0_data_valid_in : in STD_LOGIC;
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt0_drpclk_in : in STD_LOGIC;
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpen_in : in STD_LOGIC;
    gt0_drprdy_out : out STD_LOGIC;
    gt0_drpwe_in : in STD_LOGIC;
    gt0_loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_eyescanreset_in : in STD_LOGIC;
    gt0_rxuserrdy_in : in STD_LOGIC;
    gt0_eyescandataerror_out : out STD_LOGIC;
    gt0_eyescantrigger_in : in STD_LOGIC;
    gt0_rxdata_out : out STD_LOGIC_VECTOR ( 19 downto 0 );
    gt0_rxusrclk_in : in STD_LOGIC;
    gt0_rxusrclk2_in : in STD_LOGIC;
    gt0_gtprxn_in : in STD_LOGIC;
    gt0_gtprxp_in : in STD_LOGIC;
    gt0_rxbufreset_in : in STD_LOGIC;
    gt0_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt0_rxlpmhfhold_in : in STD_LOGIC;
    gt0_rxlpmlfhold_in : in STD_LOGIC;
    gt0_rxratedone_out : out STD_LOGIC;
    gt0_rxoutclk_out : out STD_LOGIC;
    gt0_rxoutclkfabric_out : out STD_LOGIC;
    gt0_gtrxreset_in : in STD_LOGIC;
    gt0_rxlpmreset_in : in STD_LOGIC;
    gt0_rxpcsreset_in : in STD_LOGIC;
    gt0_rxresetdone_out : out STD_LOGIC;
    gt0_gttxreset_in : in STD_LOGIC;
    gt0_txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_txpcsreset_in : in STD_LOGIC;
    gt0_pll0outclk_in : in STD_LOGIC;
    gt0_pll0outrefclk_in : in STD_LOGIC;
    gt0_pll0reset_out : out STD_LOGIC;
    gt0_pll0lock_in : in STD_LOGIC;
    gt0_pll0refclklost_in : in STD_LOGIC;
    gt0_pll1outclk_in : in STD_LOGIC;
    gt0_pll1outrefclk_in : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of gtwizard_0 : entity is true;
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of gtwizard_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of gtwizard_0 : entity is "gtwizard_0,gtwizard_v3_6_18,{protocol_file=3g_sdi}";
end gtwizard_0;

architecture STRUCTURE of gtwizard_0 is
  signal \<const0>\ : STD_LOGIC;
  signal NLW_inst_gt0_tx_fsm_reset_done_out_UNCONNECTED : STD_LOGIC;
  attribute DowngradeIPIdentifiedWarnings of inst : label is "yes";
  attribute EXAMPLE_SIMULATION : integer;
  attribute EXAMPLE_SIMULATION of inst : label is 0;
  attribute EXAMPLE_SIM_GTRESET_SPEEDUP : string;
  attribute EXAMPLE_SIM_GTRESET_SPEEDUP of inst : label is "FALSE";
  attribute EXAMPLE_USE_CHIPSCOPE : integer;
  attribute EXAMPLE_USE_CHIPSCOPE of inst : label is 0;
  attribute RX_CDRLOCK_TIME : string;
  attribute RX_CDRLOCK_TIME of inst : label is "33670.033670";
  attribute STABLE_CLOCK_PERIOD : integer;
  attribute STABLE_CLOCK_PERIOD of inst : label is 10;
  attribute WAIT_TIME_CDRLOCK : integer;
  attribute WAIT_TIME_CDRLOCK of inst : label is 3367;
begin
  gt0_tx_fsm_reset_done_out <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.gtwizard_0_init
     port map (
      dont_reset_on_data_error_in => dont_reset_on_data_error_in,
      gt0_data_valid_in => gt0_data_valid_in,
      gt0_dmonitorout_out(14 downto 0) => gt0_dmonitorout_out(14 downto 0),
      gt0_drp_busy_out => gt0_drp_busy_out,
      gt0_drpaddr_in(8 downto 0) => gt0_drpaddr_in(8 downto 0),
      gt0_drpclk_in => gt0_drpclk_in,
      gt0_drpdi_in(15 downto 0) => gt0_drpdi_in(15 downto 0),
      gt0_drpdo_out(15 downto 0) => gt0_drpdo_out(15 downto 0),
      gt0_drpen_in => gt0_drpen_in,
      gt0_drprdy_out => gt0_drprdy_out,
      gt0_drpwe_in => gt0_drpwe_in,
      gt0_eyescandataerror_out => gt0_eyescandataerror_out,
      gt0_eyescanreset_in => gt0_eyescanreset_in,
      gt0_eyescantrigger_in => gt0_eyescantrigger_in,
      gt0_gtprxn_in => gt0_gtprxn_in,
      gt0_gtprxp_in => gt0_gtprxp_in,
      gt0_gtrxreset_in => '0',
      gt0_gttxreset_in => '0',
      gt0_loopback_in(2 downto 0) => gt0_loopback_in(2 downto 0),
      gt0_pll0lock_in => gt0_pll0lock_in,
      gt0_pll0outclk_in => gt0_pll0outclk_in,
      gt0_pll0outrefclk_in => gt0_pll0outrefclk_in,
      gt0_pll0refclklost_in => gt0_pll0refclklost_in,
      gt0_pll0reset_out => gt0_pll0reset_out,
      gt0_pll1outclk_in => gt0_pll1outclk_in,
      gt0_pll1outrefclk_in => gt0_pll1outrefclk_in,
      gt0_rx_fsm_reset_done_out => gt0_rx_fsm_reset_done_out,
      gt0_rxbufreset_in => gt0_rxbufreset_in,
      gt0_rxbufstatus_out(2 downto 0) => gt0_rxbufstatus_out(2 downto 0),
      gt0_rxdata_out(19 downto 0) => gt0_rxdata_out(19 downto 0),
      gt0_rxlpmhfhold_in => gt0_rxlpmhfhold_in,
      gt0_rxlpmlfhold_in => gt0_rxlpmlfhold_in,
      gt0_rxlpmreset_in => gt0_rxlpmreset_in,
      gt0_rxoutclk_out => gt0_rxoutclk_out,
      gt0_rxoutclkfabric_out => gt0_rxoutclkfabric_out,
      gt0_rxpcsreset_in => gt0_rxpcsreset_in,
      gt0_rxrate_in(2 downto 0) => gt0_rxrate_in(2 downto 0),
      gt0_rxratedone_out => gt0_rxratedone_out,
      gt0_rxresetdone_out => gt0_rxresetdone_out,
      gt0_rxuserrdy_in => '0',
      gt0_rxusrclk2_in => gt0_rxusrclk2_in,
      gt0_rxusrclk_in => gt0_rxusrclk_in,
      gt0_tx_fsm_reset_done_out => NLW_inst_gt0_tx_fsm_reset_done_out_UNCONNECTED,
      gt0_txbufstatus_out(1 downto 0) => gt0_txbufstatus_out(1 downto 0),
      gt0_txpcsreset_in => gt0_txpcsreset_in,
      soft_reset_rx_in => soft_reset_rx_in,
      sysclk_in => sysclk_in
    );
end STRUCTURE;
