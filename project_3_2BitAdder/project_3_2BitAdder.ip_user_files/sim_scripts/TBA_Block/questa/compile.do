vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  \
"../../../bd/TBA_Block/ip/TBA_Block_HA_source_0_0/sim/TBA_Block_HA_source_0_0.v" \
"../../../bd/TBA_Block/ip/TBA_Block_FA_Source_0_0/sim/TBA_Block_FA_Source_0_0.v" \
"../../../bd/TBA_Block/sim/TBA_Block.v" \


vlog -work xil_defaultlib \
"glbl.v"

