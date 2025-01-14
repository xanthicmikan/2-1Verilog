del wave
del wave.vcd
iverilog -o wave pri_enc.v pri_enc_tb.v
vvp wave
gtkwave dump.vcd
pause