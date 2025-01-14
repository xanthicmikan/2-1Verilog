del wave
del wave.vcd
iverilog -o wave counter10.v counter10_tb.v
vvp wave
gtkwave dump.vcd
pause