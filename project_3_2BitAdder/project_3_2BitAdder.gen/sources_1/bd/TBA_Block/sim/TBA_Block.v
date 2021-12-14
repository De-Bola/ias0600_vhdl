//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Sun Dec  5 11:33:14 2021
//Host        : LAPTOP-1AC7T8FO running 64-bit major release  (build 9200)
//Command     : generate_target TBA_Block.bd
//Design      : TBA_Block
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "TBA_Block,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=TBA_Block,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=1,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=4,numPkgbdBlks=1,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "TBA_Block.hwdef" *) 
module TBA_Block
   (a_0,
    a_1,
    b_0,
    b_1,
    carry_out_0,
    sum_0,
    sum_1);
  input a_0;
  input a_1;
  input b_0;
  input b_1;
  output carry_out_0;
  output sum_0;
  output sum_1;

  wire FA_Block_0_carry_out;
  wire FA_Block_0_sum;
  wire HA_source_0_carry;
  wire HA_source_0_sum;
  wire a_0_1;
  wire a_1_1;
  wire b_0_1;
  wire b_1_1;

  assign a_0_1 = a_0;
  assign a_1_1 = a_1;
  assign b_0_1 = b_0;
  assign b_1_1 = b_1;
  assign carry_out_0 = FA_Block_0_carry_out;
  assign sum_0 = HA_source_0_sum;
  assign sum_1 = FA_Block_0_sum;
  FA_Block_inst_0 FA_Block_0
       (.a(a_1_1),
        .b(b_1_1),
        .carry_in(HA_source_0_carry),
        .carry_out(FA_Block_0_carry_out),
        .sum(FA_Block_0_sum));
  TBA_Block_HA_source_0_0 HA_source_0
       (.a(a_0_1),
        .b(b_0_1),
        .carry(HA_source_0_carry),
        .sum(HA_source_0_sum));
endmodule
