del wave
del wave.vcd
iverilog -o wave fft8.v butterfly.v fft_tb.v
vvp wave
gtkwave dump.vcd
pause