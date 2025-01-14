del wave
del wave.vcd
iverilog -o wave modN.v modN_tb.v
vvp wave
gtkwave dump.vcd
pause