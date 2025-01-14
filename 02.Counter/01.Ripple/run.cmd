del wave
del wave.vcd
iverilog -o wave ripple.v ripple_tb.v
vvp wave
gtkwave dump.vcd
pause