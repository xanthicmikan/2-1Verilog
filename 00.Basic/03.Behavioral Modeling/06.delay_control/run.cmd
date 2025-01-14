del wave
del wave.vcd
iverilog -o wave delay_Inter_tb.v
% iverilog -o wave delay_tb.v %
vvp wave
gtkwave dump.vcd
pause