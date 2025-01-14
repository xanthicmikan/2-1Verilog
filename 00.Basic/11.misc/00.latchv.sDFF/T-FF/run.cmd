del wave
del wave.vcd
iverilog -o wave t_ff.v t_ff_tb.v
vvp wave
gtkwave dump.vcd
pause