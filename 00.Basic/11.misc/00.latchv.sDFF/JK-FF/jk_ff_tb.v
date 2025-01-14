module jk_ff_tb;
    reg j; 
    reg k; 
    reg clk;
    wire q; 
    
    always #2 clk = ~clk;
    
    jk_ff j0(
        .j(j),
        .k(k),
        .clk(clk),
        .q(q));

    initial begin
        clk <=0;
        j<=0;
        k<=0;
        
        #5 	j<=0;
            k<=1;
        #20 j<=1;
            k<=0;
        #20 j<=1;
            k<=1;
        #20 $finish;		
    end
  
    initial
        $monitor("j=%0d, k=%0d, q=%0d", j, k, q);
	
    initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, jk_ff_tb);
    end  
	
endmodule