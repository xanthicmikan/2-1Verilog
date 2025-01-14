del wave
del wave.vcd
iverilog -o wave 2ff.v 2ff_tb.v
vvp wave
gtkwave dump.vcd
pause