module t_ff_tb;
    reg t; 
    reg rstn; 
    reg clk;
    wire q; 
    
    always #2 clk = ~clk;
    
    t_ff t0(.t(t),
            .rstn(rstn),
            .clk(clk),
            .q(q));

    initial begin
        {clk, rstn, t} <= 0;
    
        $monitor("T=%0t, t=%0d, rstn=%0d, q=%0d", $time, t, rstn, q);
    
        repeat(2) @(posedge clk);
        rstn <= 1;
    
        for (integer i = 0; i < 20; i = i+1) begin
            #(5) t <= $random;
        end
    	
        #20 $finish(1);		
    end
  

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(2, t_ff_tb);
    end  
	
endmodule