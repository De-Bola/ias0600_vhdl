-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
-- Date        : Sun Dec  5 11:50:25 2021
-- Host        : LAPTOP-1AC7T8FO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/Users/bhumm/OneDrive -
--               TalTech/IAS0600_VHDL/project_3_2BitAdder/project_3_2BitAdder.gen/sources_1/bd/TBA_Block/bd/FA_Block_inst_0/ip/FA_Block_inst_0_HA_source_2_0/FA_Block_inst_0_HA_source_2_0_stub.vhdl}
-- Design      : FA_Block_inst_0_HA_source_2_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_Block_inst_0_HA_source_2_0 is
  Port ( 
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    sum : out STD_LOGIC;
    carry : out STD_LOGIC
  );

end FA_Block_inst_0_HA_source_2_0;

architecture stub of FA_Block_inst_0_HA_source_2_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a,b,sum,carry";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "HA_source,Vivado 2021.1";
begin
end;
