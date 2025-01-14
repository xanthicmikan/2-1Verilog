`timescale 1ns/1ns
module gate_tb;
	reg a, b;
	wire c, d, e;
	wire x, y, z;
	integer i;

	gate u0 ( .a(a), .b(b), .c(c), .d(d), .e(e), .x(x), .y(y), .z(z));

	initial begin
		{a, b} = 0;

      $monitor ("[T=%0t a=%0b b=%0b c(and)=%0b d(or)=%0b e(xor)=%0b x(nand)=%0b y(nor)=%0b z(nxor)=%0b", 
	             $time, a, b, c, d, e, x, y ,z);

		for (i = 0; i < 10; i = i+1) begin
			#1 	a <= $random;
				b <= $random;
		end
	end
endmodule