module demux_1x4_tb;
    reg f; 
    reg [1:0] sel; 
    wire a, b, c, d; 
    
    
    demux_1x4 uut(.f(f),
                  .sel(sel),
                  .a(a),
                  .b(b),
                  .c(c),
                  .d(d));

    initial begin
        {f, sel} <= 0;
    
        $monitor("f=%0b sel=%0b a=%0b b=%0b c=%0b d=%0b", f, sel, a, b, c, d);
    
        for (integer i = 0; i < 8; i = i+1) begin
            #(10) {f, sel} <= i;
        end
    	
        #20 $finish;		
    end
  

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(2, demux_1x4_tb);
    end  
	
endmodule