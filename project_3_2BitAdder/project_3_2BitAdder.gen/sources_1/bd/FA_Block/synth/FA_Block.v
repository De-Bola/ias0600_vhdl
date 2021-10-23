//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Wed Oct  6 19:27:52 2021
//Host        : ICT-50102K running 64-bit major release  (build 9200)
//Command     : generate_target FA_Block.bd
//Design      : FA_Block
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "FA_Block,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=FA_Block,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "FA_Block.hwdef" *) 
module FA_Block
   (a,
    b,
    carry_in,
    carry_out,
    sum);
  input a;
  input b;
  input carry_in;
  output carry_out;
  output sum;

  wire HA_source_0_carry;
  wire HA_source_0_sum;
  wire HA_source_1_carry;
  wire HA_source_1_sum;
  wire HA_source_2_sum;
  wire a_0_1;
  wire b_0_1;
  wire b_1_1;

  assign a_0_1 = a;
  assign b_0_1 = b;
  assign b_1_1 = carry_in;
  assign carry_out = HA_source_2_sum;
  assign sum = HA_source_1_sum;
  FA_Block_HA_source_0_0 HA_source_0
       (.a(a_0_1),
        .b(b_0_1),
        .carry(HA_source_0_carry),
        .sum(HA_source_0_sum));
  FA_Block_HA_source_1_0 HA_source_1
       (.a(HA_source_0_sum),
        .b(b_1_1),
        .carry(HA_source_1_carry),
        .sum(HA_source_1_sum));
  FA_Block_HA_source_2_0 HA_source_2
       (.a(HA_source_0_carry),
        .b(HA_source_1_carry),
        .sum(HA_source_2_sum));
endmodule
