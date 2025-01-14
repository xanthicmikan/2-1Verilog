del wave
del wave.vcd
iverilog -o wave lshift.v lshift_tb.v
vvp wave
gtkwave dump.vcd
pause