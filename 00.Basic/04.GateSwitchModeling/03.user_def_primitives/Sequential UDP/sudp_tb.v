`timescale 1ns/1ns
module d_latch_tb;
  reg clk, d;
  reg [1:0] dly;
  wire q;
  integer i;

  d_latch u_latch (q, clk, d);

  always #10 clk = ~clk;

  initial begin
    clk = 0;

    $monitor ("[T=%0t] clk=%0b d=%0b q=%0b", $time, clk, d, q);

    #10;  

    for (i = 0; i < 50; i = i+1) begin
        dly = $random;
        #(dly) d <= $random;
    end

    #20 $finish;
  end
endmodule