onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib TBA_Block_opt

do {wave.do}

view wave
view structure
view signals

do {TBA_Block.udo}

run -all

quit -force
