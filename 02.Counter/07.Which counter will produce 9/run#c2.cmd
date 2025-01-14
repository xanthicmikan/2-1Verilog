del wave
del wave.vcd
iverilog -o wave counter9_c2.v counter9_c2_tb.v
vvp wave
gtkwave dump.vcd
pause