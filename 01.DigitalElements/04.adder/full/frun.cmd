del wave
del wave.vcd
iverilog -o wave fulladder.v fulladder_tb.v
vvp wave
gtkwave dump.vcd
pause