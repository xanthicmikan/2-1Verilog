del wave
del wave.vcd
iverilog -o wave dly_sample.v dly_sample_tb.v
vvp wave
gtkwave dump.vcd
pause