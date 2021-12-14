//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Sun Dec  5 11:33:14 2021
//Host        : LAPTOP-1AC7T8FO running 64-bit major release  (build 9200)
//Command     : generate_target TBA_Block_wrapper.bd
//Design      : TBA_Block_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module TBA_Block_wrapper
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

  wire a_0;
  wire a_1;
  wire b_0;
  wire b_1;
  wire carry_out_0;
  wire sum_0;
  wire sum_1;

  TBA_Block TBA_Block_i
       (.a_0(a_0),
        .a_1(a_1),
        .b_0(b_0),
        .b_1(b_1),
        .carry_out_0(carry_out_0),
        .sum_0(sum_0),
        .sum_1(sum_1));
endmodule
