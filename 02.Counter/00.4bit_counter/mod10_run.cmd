del wave
del wave.vcd
iverilog -o wave mod10.v mod10_tb.v
vvp wave
gtkwave dump.vcd
pause