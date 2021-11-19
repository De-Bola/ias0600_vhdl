//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Wed Oct 13 17:53:26 2021
//Host        : ICT-50102K running 64-bit major release  (build 9200)
//Command     : generate_target FA_Block_wrapper.bd
//Design      : FA_Block_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module FA_Block_wrapper
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

  wire a;
  wire b;
  wire carry_in;
  wire carry_out;
  wire sum;

  FA_Block FA_Block_i
       (.a(a),
        .b(b),
        .carry_in(carry_in),
        .carry_out(carry_out),
        .sum(sum));
endmodule
