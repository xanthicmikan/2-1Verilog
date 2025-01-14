`timescale 1ns/1ns
module d_flop_tb;
  reg clk, d;
  reg [1:0] dly;
  wire q;
  integer i;

  d_flop u_flop (q, clk, d);

  always #10 clk = ~clk;

  initial begin
    clk = 0;

    $monitor ("[T=%0t] clk=%0b d=%0b q=%0b", $time, clk, d, q);

    #10;  // To see the effect of X

    for (i = 0; i < 20; i = i+1) begin
      dly = $random;
      repeat(dly) @(posedge clk);
      d <= $random;
    end

    #20 $finish;
  end
endmodule