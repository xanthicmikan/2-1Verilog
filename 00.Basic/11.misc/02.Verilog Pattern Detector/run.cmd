del wave
del wave.vcd
iverilog -o wave detector.v detector_tb.v
vvp wave
gtkwave dump.vcd
pause