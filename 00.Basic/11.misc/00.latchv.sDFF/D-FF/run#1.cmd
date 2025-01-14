del wave
del wave.vcd
iverilog -o wave DFF#1.v DFF#1_tb.v
vvp wave
gtkwave dump.vcd
pause