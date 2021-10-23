//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Wed Oct 13 18:16:34 2021
//Host        : ICT-50102K running 64-bit major release  (build 9200)
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

  wire a_0;
  wire a_1;
  wire b_0;
  wire b_1;
  wire carry;
  wire sum_0;
  wire sum_1;

  TBA_Block TBA_Block_i
       (.a_0(a_0),
        .a_1(a_1),
        .b_0(b_0),
        .b_1(b_1),
        .carry(carry),
        .sum_0(sum_0),
        .sum_1(sum_1));
endmodule
