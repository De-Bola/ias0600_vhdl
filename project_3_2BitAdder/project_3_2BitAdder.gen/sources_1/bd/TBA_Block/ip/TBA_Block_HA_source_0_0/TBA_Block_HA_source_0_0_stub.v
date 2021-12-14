// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Sun Dec  5 11:50:29 2021
// Host        : LAPTOP-1AC7T8FO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/bhumm/OneDrive -
//               TalTech/IAS0600_VHDL/project_3_2BitAdder/project_3_2BitAdder.gen/sources_1/bd/TBA_Block/ip/TBA_Block_HA_source_0_0/TBA_Block_HA_source_0_0_stub.v}
// Design      : TBA_Block_HA_source_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "HA_source,Vivado 2021.1" *)
module TBA_Block_HA_source_0_0(a, b, sum, carry)
/* synthesis syn_black_box black_box_pad_pin="a,b,sum,carry" */;
  input a;
  input b;
  output sum;
  output carry;
endmodule
