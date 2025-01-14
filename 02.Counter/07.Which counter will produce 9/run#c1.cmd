del wave
del wave.vcd
iverilog -o wave counter9_c1.v counter9_c1_tb.v
vvp wave
gtkwave dump.vcd
pause