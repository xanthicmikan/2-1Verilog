module my_top_tb;
    reg  a, b, sel;
    wire out;
    integer i;
    

    my_top #(.USE_CASE(1)) u0 ( .a(a), .b(b), .sel(sel), .out(out));
    
    initial begin
        a <= 0;
        b <= 0;
        sel <= 0;
        
        for (i = 0; i < 5; i = i + 1) begin
            #10 a <= $random;
            	b <= $random;
                sel <= $random;
            $display ("i=%0d a=0x%0h b=0x%0h sel=0x%0h out=0x%0h", i, a, b, sel, out);
        end
    end
	
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(2, my_top_tb);
    end  
	
endmodule