`timescale 1ns/1ns
module fulladder_tb;
    parameter N = 4;
	
    reg [N-1:0] a;
    reg [N-1:0] b;	
    reg c_in;
	
	integer i;
    //output
    wire [N-1:0] sum;
    wire c_out;	

	fulladder u0 (
	        .a(a),
	        .b(b),
	        .c_in(c_in),
	        .c_out(c_out),					
	        .sum(sum));
	

	initial begin
	    a <= 0;
	    b <= 0;
	    c_in <= 0;
		
	    for (i = 1; i < 5; i=i+1) begin
	    	#10 a <= $random;
	    	    b <= $random;
	    	    c_in <= $random;					
        end

	    #5 $finish;		
	end

	initial begin		
		$monitor(" a=0x%0h, b=0x%0h, c_in=0x%0h, c_out=0x%0h, sum=0x%0h ", a, b, c_in, c_out, sum);
	end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, fulladder_tb);
	end  

endmodule