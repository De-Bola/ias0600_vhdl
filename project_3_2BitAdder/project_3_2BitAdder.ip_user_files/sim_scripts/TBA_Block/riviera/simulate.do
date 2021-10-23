onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+TBA_Block -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.TBA_Block xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {TBA_Block.udo}

run -all

endsim

quit -force
