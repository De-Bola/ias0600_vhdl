vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr \
"../../../bd/TBA_Block/ip/TBA_Block_HA_source_0_0/sim/TBA_Block_HA_source_0_0.v" \
"../../../bd/TBA_Block/ip/TBA_Block_FA_Source_0_0/sim/TBA_Block_FA_Source_0_0.v" \
"../../../bd/TBA_Block/sim/TBA_Block.v" \


vlog -work xil_defaultlib \
"glbl.v"

