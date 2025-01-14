del wave
del wave.vcd
iverilog -o wave doubledet.v doubledet_tb.v
vvp wave
gtkwave dump.vcd
pause