del wave
del wave.vcd
iverilog -o wave jk_ff.v jk_ff_tb.v
vvp wave
gtkwave dump.vcd
pause