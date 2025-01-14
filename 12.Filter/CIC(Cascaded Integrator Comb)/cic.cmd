del wave
del wave.vcd
iverilog -o wave cic.v cic_tb.sv comb.v decimation.v integrator.v
vvp wave
gtkwave dump.vcd
pause