module dec_4x16_tb;
    reg en; 
    reg  [3:0] in; 
    wire [15:0] out;  
    
    
    dec_4x16 uut(.en(en),
                  .in(in),
                  .out(out));

    initial begin
        {en, in} <= 0;
    
        $monitor("en=%0b in=0x%0h out=0x%0h", en, in, out);
    
        for (integer i = 0; i < 32; i = i+1) begin
            #(10) {en, in} <= i;
        end
    	
        #20 $finish;		
    end
  

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(2, dec_4x16_tb);
    end  
	
endmodule