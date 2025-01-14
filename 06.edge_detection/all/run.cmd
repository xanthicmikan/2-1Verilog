del wave
del wave.vcd
iverilog -o wave det.v det_tb.v
vvp wave
gtkwave dump.vcd
pause