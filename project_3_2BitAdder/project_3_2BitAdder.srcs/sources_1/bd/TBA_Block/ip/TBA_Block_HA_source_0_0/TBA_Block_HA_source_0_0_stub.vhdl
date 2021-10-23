-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Wed Oct 13 18:25:25 2021
-- Host        : ICT-50102K running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               p:/IAS0600_VHDL/project_3_2BitAdder/project_3_2BitAdder.srcs/sources_1/bd/TBA_Block/ip/TBA_Block_HA_source_0_0/TBA_Block_HA_source_0_0_stub.vhdl
-- Design      : TBA_Block_HA_source_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TBA_Block_HA_source_0_0 is
  Port ( 
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    sum : out STD_LOGIC;
    carry : out STD_LOGIC
  );

end TBA_Block_HA_source_0_0;

architecture stub of TBA_Block_HA_source_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a,b,sum,carry";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "HA_source,Vivado 2020.1";
begin
end;
