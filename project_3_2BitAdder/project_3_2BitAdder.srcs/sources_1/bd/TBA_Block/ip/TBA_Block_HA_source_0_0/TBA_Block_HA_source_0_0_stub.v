// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Oct 13 18:25:25 2021
// Host        : ICT-50102K running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               p:/IAS0600_VHDL/project_3_2BitAdder/project_3_2BitAdder.srcs/sources_1/bd/TBA_Block/ip/TBA_Block_HA_source_0_0/TBA_Block_HA_source_0_0_stub.v
// Design      : TBA_Block_HA_source_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "HA_source,Vivado 2020.1" *)
module TBA_Block_HA_source_0_0(a, b, sum, carry)
/* synthesis syn_black_box black_box_pad_pin="a,b,sum,carry" */;
  input a;
  input b;
  output sum;
  output carry;
endmodule
