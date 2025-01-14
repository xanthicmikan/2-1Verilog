del wave
del wave.vcd
iverilog -o wave single_ram.v single_ram_tb.v
vvp wave
gtkwave dump.vcd
pause