vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/FA_Block/sim/FA_Block.v" \


vlog -work xil_defaultlib \
"glbl.v"

