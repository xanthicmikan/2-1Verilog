del wave
del wave.vcd
iverilog -o wave syncFIFO.v syncFIFO_tb.v
vvp wave
gtkwave dump.vcd
pause