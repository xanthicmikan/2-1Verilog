del wave
del wave.vcd
iverilog -o wave enc_4x2.v enc_4x2_tb.v
vvp wave
gtkwave dump.vcd
pause