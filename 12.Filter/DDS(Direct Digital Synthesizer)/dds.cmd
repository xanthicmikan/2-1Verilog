del wave
del wave.vcd
iverilog -o wave dds.v mem.v dds_tb.v
vvp wave
gtkwave dump.vcd
pause