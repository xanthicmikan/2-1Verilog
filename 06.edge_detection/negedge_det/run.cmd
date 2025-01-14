del wave
del wave.vcd
iverilog -o wave ndet.v ndet_tb.v
vvp wave
gtkwave dump.vcd
pause