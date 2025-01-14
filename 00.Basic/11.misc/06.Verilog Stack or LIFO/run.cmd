del wave
del wave.vcd
iverilog -o wave LIFO.v LIFO_tb.v
vvp wave
gtkwave dump.vcd
pause