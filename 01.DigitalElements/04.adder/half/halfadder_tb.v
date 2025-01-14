`timescale 1ns/1ns
module halfadder_tb;
	
    reg a;
    reg b;	
	
	integer i;
    //output
    wire sum;
    wire carry;	

	halfadder u0 (
	        .a(a),
	        .b(b),
	        .carry(carry),					
	        .sum(sum));
	

	initial begin
	    a <= 0;
	    b <= 0;
		
	    for (i = 1; i < 5; i=i+1) begin
	    	#10 a <= $random;
	    	    b <= $random;				
        end

	    #5 $finish;		
	end

	initial begin		
		$monitor(" a=0x%0h, b=0x%0h, carry=0x%0h,  sum=0x%0h ", a, b, carry, sum);
	end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, halfadder_tb);
	end  

endmodule