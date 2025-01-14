del wave
del wave.vcd
iverilog -o wave cudp.v cudp_tb.v
vvp wave
gtkwave dump.vcd
pause