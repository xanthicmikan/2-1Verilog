del wave
del wave.vcd
iverilog -o wave sinew.v sinew_tb.v
vvp wave
gtkwave dump.vcd
pause