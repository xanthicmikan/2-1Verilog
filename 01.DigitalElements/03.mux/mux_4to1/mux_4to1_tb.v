`timescale 1ns/1ns
module mux_4to1_tb;
    parameter N = 4;
	
    reg [N-1:0] a;
    reg [N-1:0] b;	
    reg [N-1:0] c;
    reg [N-1:0] d;	
    reg [1:0] sel;
	
	integer i;
    //output
    wire [N-1:0] out;

	mux_4to1 u0 (
	        .a(a),
	        .b(b),
	        .c(c),
	        .d(d),
	        .sel(sel),					
	        .out(out));
	

	initial begin
	    sel <= 0;
	    a <= $random;
	    b <= $random;
	    c <= $random;
	    d <= $random;
	    for (i = 1; i < 4; i=i+1) begin
	    	#5 sel <= i;
        end

	    #5 $finish;		
	end

	initial begin		
		$monitor("sel=0x%0h, a=0x%0h, b=0x%0h, c=0x%0h, d=0x%0h, out=0x%0h ", sel, a, b, c, d, out);
	end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, mux_4to1_tb);
	end  

endmodule