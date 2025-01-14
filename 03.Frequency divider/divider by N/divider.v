//50MHz--> 0.833MHz
module divN (
    input  clk,
    input  rst_n,
    output reg o_clk);

    reg [15:0] cnt;
	
    always@(posedge clk or negedge rst_n) begin
        if (!rst_n)
          cnt <= 0;
        else if(cnt == 16'd60)
          cnt <= 0;	  
        else
          cnt <= cnt+1;

    end
     
    always@(posedge clk or negedge rst_n) begin
        if (!rst_n)
          o_clk <= 0;
        else if(cnt < 16'd30)    
          o_clk <= 1;		  
        else    
          o_clk <= 0;
    end	

endmodule