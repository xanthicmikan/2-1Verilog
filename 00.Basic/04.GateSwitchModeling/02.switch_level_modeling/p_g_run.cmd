del wave
del wave.vcd
iverilog -o wave p_g.v p_g_tb.v
vvp wave
gtkwave dump.vcd
pause