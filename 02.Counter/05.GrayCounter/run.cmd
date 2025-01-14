del wave
del wave.vcd
iverilog -o wave graycounter.v graycounter_tb.v
vvp wave
gtkwave dump.vcd
pause