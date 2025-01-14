del wave
del wave.vcd
iverilog -o wave demux_1x4.v demux_1x4_tb.v
vvp wave
gtkwave dump.vcd
pause