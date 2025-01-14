`timescale 1ns/1ns
module delay_tb;
    
	reg a, b, c, q, q1;

    initial begin
        {a, b, c, q, q1} <= 0;
		
		$monitor("[%0t] a=%0b, b=%0b, c=%0b, q=%0b, q'=%0b", $time, a, b, c, q, q1);

        #10 a <= 1;
        	c <= 1;
            
	    	
        //Delay is specified on the left side
        //#<delay> <LHS> = <RHS>
        #20 q <= a & b | c;

        // Delay is specified on the right side
        //<LHS> = #<delay> <RHS>
        q1 <= #5 a & b | c;		
		
		#10 $finish;
	end
	

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(2, delay_tb);
    end  	
endmodule