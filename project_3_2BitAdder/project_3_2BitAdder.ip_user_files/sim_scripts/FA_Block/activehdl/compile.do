vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/FA_Block/sim/FA_Block.v" \


vlog -work xil_defaultlib \
"glbl.v"

