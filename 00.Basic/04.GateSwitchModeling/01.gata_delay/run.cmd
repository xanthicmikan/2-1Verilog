del wave
del wave.vcd
iverilog -o wave delay.v delay_tb.v
vvp wave
gtkwave dump.vcd
pause