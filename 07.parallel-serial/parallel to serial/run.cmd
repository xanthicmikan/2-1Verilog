del wave
del wave.vcd
iverilog -o wave p2s.v p2s_tb.v
vvp wave
gtkwave dump.vcd
pause