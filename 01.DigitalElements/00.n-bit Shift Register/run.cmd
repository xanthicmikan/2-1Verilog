del wave
del wave.vcd
iverilog -o wave bitshift.v bitshift_tb.v
vvp wave
gtkwave dump.vcd
pause