-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Wed Oct 13 18:25:25 2021
-- Host        : ICT-50102K running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               p:/IAS0600_VHDL/project_3_2BitAdder/project_3_2BitAdder.srcs/sources_1/bd/TBA_Block/ip/TBA_Block_FA_Source_0_0/TBA_Block_FA_Source_0_0_sim_netlist.vhdl
-- Design      : TBA_Block_FA_Source_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TBA_Block_FA_Source_0_0 is
  port (
    a_in : in STD_LOGIC;
    b_in : in STD_LOGIC;
    carry_in : in STD_LOGIC;
    sum : out STD_LOGIC;
    carry_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of TBA_Block_FA_Source_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of TBA_Block_FA_Source_0_0 : entity is "TBA_Block_FA_Source_0_0,FA_Source,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of TBA_Block_FA_Source_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of TBA_Block_FA_Source_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of TBA_Block_FA_Source_0_0 : entity is "FA_Source,Vivado 2020.1";
end TBA_Block_FA_Source_0_0;

architecture STRUCTURE of TBA_Block_FA_Source_0_0 is
begin
carry_out_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => carry_in,
      I1 => b_in,
      I2 => a_in,
      O => carry_out
    );
sum_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => carry_in,
      I1 => a_in,
      I2 => b_in,
      O => sum
    );
end STRUCTURE;
