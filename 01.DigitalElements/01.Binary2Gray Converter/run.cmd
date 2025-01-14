del wave
del wave.vcd
iverilog -o wave bin2gray_m1.v gray2bin.v convert_tb.v
vvp wave
gtkwave dump.vcd
pause