module dff_tb;
	reg clk;
	reg d;
	reg rstn;
	wire q;
    integer i;
    

    dff d0 (.d(d),
            .rstn(rstn),
            .clk(clk),
            .q(q));
    		 
    // Generate clock
    always #10 clk = ~clk;
    
    initial begin
        clk <= 0;
    	d <= 0;
    	rstn <= 0;
    
    	#15 d <= 1;
    	#10 rstn <= 1;
    
    	for (i = 0; i < 5; i=i+1) begin
    	    #(5) d <= i;
    	end
    	#10 $finish;
    end
    
     initial
    	$monitor("d=%0d, q=%0d", d, q);	
    
     initial begin
    	$dumpfile("dump.vcd");
    	$dumpvars(2, dff_tb);
     end  	
endmodule