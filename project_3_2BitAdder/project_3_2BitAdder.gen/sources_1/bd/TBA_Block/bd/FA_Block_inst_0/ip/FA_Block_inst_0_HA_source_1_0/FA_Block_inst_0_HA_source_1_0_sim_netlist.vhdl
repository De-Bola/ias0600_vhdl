-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
-- Date        : Sun Dec  5 11:50:25 2021
-- Host        : LAPTOP-1AC7T8FO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {c:/Users/bhumm/OneDrive -
--               TalTech/IAS0600_VHDL/project_3_2BitAdder/project_3_2BitAdder.gen/sources_1/bd/TBA_Block/bd/FA_Block_inst_0/ip/FA_Block_inst_0_HA_source_1_0/FA_Block_inst_0_HA_source_1_0_sim_netlist.vhdl}
-- Design      : FA_Block_inst_0_HA_source_1_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FA_Block_inst_0_HA_source_1_0 is
  port (
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    sum : out STD_LOGIC;
    carry : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of FA_Block_inst_0_HA_source_1_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of FA_Block_inst_0_HA_source_1_0 : entity is "FA_Block_inst_0_HA_source_1_0,HA_source,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of FA_Block_inst_0_HA_source_1_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of FA_Block_inst_0_HA_source_1_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of FA_Block_inst_0_HA_source_1_0 : entity is "HA_source,Vivado 2021.1";
end FA_Block_inst_0_HA_source_1_0;

architecture STRUCTURE of FA_Block_inst_0_HA_source_1_0 is
begin
carry_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => a,
      I1 => b,
      O => carry
    );
sum_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => b,
      I1 => a,
      O => sum
    );
end STRUCTURE;
