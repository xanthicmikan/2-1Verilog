del wave
del wave.vcd
iverilog -o wave DFF#2.v DFF#2_tb.v
vvp wave
gtkwave dump.vcd
pause