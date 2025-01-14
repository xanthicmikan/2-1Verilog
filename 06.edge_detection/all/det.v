module det(
            input rstn,
            input clk,
			input d,
            output p_edge,
            output n_edge,
            output d_edge);
			
    reg [1:0] data;
    

 
	always @ (posedge clk or negedge rstn) begin
        if (!rstn) begin
            data <= 2'b00;	
	    end
        else begin
            data <= {data[0], d};	
		end
	end
    
	assign p_edge = ~data[1] & data[0];
	assign n_edge = data[1] & ~data[0];	
	assign d_edge = data[1] ^ data[0];
    //assign d_edge = data[1] | data[0];		
		  
endmodule
