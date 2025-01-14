del wave
del wave.vcd
iverilog -o wave multix2.v multix2_tb.v
vvp wave
gtkwave dump.vcd
pause