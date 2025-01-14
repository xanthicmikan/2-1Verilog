del wave
del wave.vcd
iverilog -o wave updowncon.v updowncon_tb.v
vvp wave
gtkwave dump.vcd
pause