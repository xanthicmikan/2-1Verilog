del wave
del wave.vcd
iverilog -o wave bidirectional.v bidirectional_tb.v
vvp wave
gtkwave dump.vcd
pause