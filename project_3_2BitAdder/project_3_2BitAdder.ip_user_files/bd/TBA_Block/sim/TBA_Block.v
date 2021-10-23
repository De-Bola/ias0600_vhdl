//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Wed Oct 13 18:00:33 2021
//Host        : ICT-50102K running 64-bit major release  (build 9200)
//Command     : generate_target TBA_Block.bd
//Design      : TBA_Block
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "TBA_Block,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=TBA_Block,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "TBA_Block.hwdef" *) 
module TBA_Block
   (a_0,
    a_1,
    b_0,
    b_1,
    carry,
    sum_0,
    sum_1);
  input a_0;
  input a_1;
  input b_0;
  input b_1;
  output carry;
  output sum_0;
  output sum_1;

  wire FA_Source_0_carry_out;
  wire FA_Source_0_sum;
  wire HA_source_0_carry;
  wire HA_source_0_sum;
  wire a_0_1;
  wire a_in_0_1;
  wire b_0_1;
  wire b_in_0_1;

  assign a_0_1 = a_0;
  assign a_in_0_1 = a_1;
  assign b_0_1 = b_0;
  assign b_in_0_1 = b_1;
  assign carry = FA_Source_0_carry_out;
  assign sum_0 = HA_source_0_sum;
  assign sum_1 = FA_Source_0_sum;
  TBA_Block_FA_Source_0_0 FA_Source_0
       (.a_in(a_in_0_1),
        .b_in(b_in_0_1),
        .carry_in(HA_source_0_carry),
        .carry_out(FA_Source_0_carry_out),
        .sum(FA_Source_0_sum));
  TBA_Block_HA_source_0_0 HA_source_0
       (.a(a_0_1),
        .b(b_0_1),
        .carry(HA_source_0_carry),
        .sum(HA_source_0_sum));
endmodule
