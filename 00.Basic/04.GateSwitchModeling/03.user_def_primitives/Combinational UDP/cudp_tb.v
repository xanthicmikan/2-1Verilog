`timescale 1ns/1ns
module mux_tb;
  reg 	sel, a, b;
  reg [2:0] dly;
  wire 	out;
  integer i;

  mux u_mux ( out, sel, a, b);

  initial begin
    a <= 0;
    b <= 0;

    $monitor("[T=%0t] a=%0b b=%0b sel=%0b out=%0b", $time, a, b, sel, out);


    for (i = 0; i < 10; i = i + 1) begin
        dly = $random;
        #(dly) a <= $random;
        dly = $random;
        #(dly) b <= $random;
        dly = $random;
        #(dly) sel <= $random;
    end
  end
endmodule