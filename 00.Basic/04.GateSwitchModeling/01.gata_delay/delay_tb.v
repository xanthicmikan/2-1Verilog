`timescale 1ns/1ns
module delay_tb;
	reg a, b;
	wire c, d, e, f;


	delay u0 ( .a(a), .b(b), .c(c), .d(d), .e(e), .f(f));

	initial begin
		{a, b} = 0;

      $monitor ("[T=%0t a=%0b b=%0b c=%0b d=%0b e=%0b f=%0b", 
	             $time, a, b, c, d, e, f);

        #10 a <= 1;
        #10 b <= 1;
        #10 a <= 0;
        #10 b <= 0;
        #10 a <= 1;
        #10 b <= 1;
        #10 a <= 0;
        #10 b <= 0;
        #10 a <= 1;
        #10 b <= 1;
        #10 a <= 0;
        #10 b <= 0;
        #10 a <= 1;
        #10 b <= 1;
        #10 a <= 0;
        #10 b <= 0;
        #5 $finish;		
	end
	
	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, delay_tb);
	end  	
endmodule