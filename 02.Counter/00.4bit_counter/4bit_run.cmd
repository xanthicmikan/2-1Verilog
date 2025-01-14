del wave
del wave.vcd
iverilog -o wave 4bitcounter.v 4bitcounter_tb.v
vvp wave
gtkwave dump.vcd
pause