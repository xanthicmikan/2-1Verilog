`timescale 1ns/1ns
module pri_enc_tb;
    parameter N = 8;
	
    reg [N-1:0] a;
    reg [N-1:0] b;	
    reg [N-1:0] c;
    reg [N-1:0] d;	
    reg [1:0] sel;
	
	integer i;
    //output
    wire [N-1:0] out;

	pri_enc #(N) u0 (
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
		$monitor("sel=%0d, a=%0d, b=%d, c=%0d, d=%0d, out=%0d", sel, a, b, c, d, out);
	end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, pri_enc_tb);
	end  

endmodule