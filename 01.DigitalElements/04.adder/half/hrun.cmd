del wave
del wave.vcd
iverilog -o wave halfadder.v halfadder_tb.v
vvp wave
gtkwave dump.vcd
pause