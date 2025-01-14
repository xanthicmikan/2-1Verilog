module enc_4x2_tb;
    reg a, b, c, d; 
    wire x, y;  
    
    
    enc_4x2 u0 ( .a(a), .b(b), .c(c), .d(d), .x(x), .y(y));

    initial begin
        {a, b, c, d} <= 0;
    
        $monitor("a=%0b b=0x%0b c=0x%0b d=0x%0b x=0x%0b y=0x%0b", 
		          a, b, c, d, x, y);
    
        for (integer i = 0; i < 16; i = i+1) begin
            #(10) {a, b, c, d} <= i;
        end
    	
        #20 $finish;		
    end
  

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(2, enc_4x2_tb);
    end  
	
endmodule