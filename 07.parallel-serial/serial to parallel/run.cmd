del wave
del wave.vcd
iverilog -o wave s2p.v s2p_tb.v
vvp wave
gtkwave dump.vcd
pause