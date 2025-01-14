del wave
del wave.vcd
% iverilog -o wave mux_4to1_assign.v mux_4to1_tb.v %
% iverilog -o wave mux_4to1_case.v mux_4to1_tb.v %
iverilog -o wave mux_4to1_if.v mux_4to1_tb.v
vvp wave
gtkwave dump.vcd
pause