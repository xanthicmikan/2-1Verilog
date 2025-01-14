del wave
del wave.vcd
iverilog -o wave sudp.v sudp_tb.v
vvp wave
gtkwave dump.vcd
pause