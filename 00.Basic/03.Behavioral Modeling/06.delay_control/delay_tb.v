`timescale 1ns/1ns
module delay_tb;
    
	reg a, b;
	event a_event;
	
    reg [1:0] ctr;
    reg clk;

    always #2 clk = ~clk;
    
    always @ (posedge clk)
        ctr <= ctr + 1;	
	
    initial begin
        {a, b, clk, ctr} <= 0;
        $display ("T=%0t a=%0d b=%0d", $realtime, a, b);
		//delay control
        #10;
        #50 a <= $random;
        $display ("T=%0t a=%0d b=%0d", $realtime, a, b);
		#20 b <= 1;
		#20 b <= 0;
		#20 -> a_event;
		
		//wait 
	    wait (ctr == 2) $display ("T=%0t [wait] Counter reached 0x%0h", $time, ctr);
		#10 $finish;
	end
	
	//named event
	always @ (a_event) $display ("T=%0t [always] a_event is triggered", $time);
	
	//or 
	always @ (a, b)
    $display ("T=%0t Any change on a or b", $time);
	
    initial begin	
		//event contrlo
        @(posedge b);
        $display ("T=%0t Posedge of b detected", $time);
	end
	
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(2, delay_tb);
    end  	
endmodule