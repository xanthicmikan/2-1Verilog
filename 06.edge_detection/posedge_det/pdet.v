module pdet(
            input rstn,
            input clk,
			input d,
            output p_edge);
			
    reg d0, d1;
    
	assign p_edge = ~d0 & d1;
 
	always @ (posedge clk or negedge rstn)
        if (!rstn) begin
            d0 <= 1'b0;
            d1 <= 1'b0;			
	    end
        else begin
            d0 <= d1;
            d1 <= d;	
		end
		  
endmodule
