`timescale 1ns/1ns
module mux_2to1_tb;

    reg a;
    reg b;		
    reg sel;
	
	integer i;
    //output
    wire out;

	mux_2to1 u0 (
	        .I0(a),
	        .I1(b),
	        .S(sel),			
	        .Y(out));
	

	initial begin
	    sel <= 0;
	    a <= $random;
	    b <= $random;
	    for (i = 1; i < 2; i=i+1) begin
	    	#5 sel <= i;
        end

	    #5 $finish;		
	end

	initial begin		
		$monitor("sel=0x%0h, a=0x%0h, b=0x%0h, out=0x%0h ", sel, a, b, out);
	end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, mux_2to1_tb);
	end  

endmodule