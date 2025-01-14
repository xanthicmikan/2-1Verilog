del wave
del wave.vcd
iverilog -o wave dec_4x16.v dec_4x16_tb.v
vvp wave
gtkwave dump.vcd
pause