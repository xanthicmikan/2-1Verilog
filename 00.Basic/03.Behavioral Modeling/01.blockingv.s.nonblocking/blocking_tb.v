module blocking_tb;
    reg [3:0] a, b, c, d, e;
	
	initial begin
	    #10 a = 4'd1;
		    b = 4'd2;
		    c = 4'd5;
		    d = 4'd7;
		    e = 4'd3;	
                
	    #10 a = 4'd9;
		    b = a;
		    c = b;
		    d = c;
		    e = d;
			
    	#10 $finish;	   
	end
	
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(2, blocking_tb);
    end  
endmodule