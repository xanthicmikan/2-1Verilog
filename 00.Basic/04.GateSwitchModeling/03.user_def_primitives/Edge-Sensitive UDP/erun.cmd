del wave
del wave.vcd
iverilog -o wave eudp.v eudp_tb.v
vvp wave
gtkwave dump.vcd
pause