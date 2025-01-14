module delay_2ff( //2 delay clap
    input   clka, 
    input   d,  
    input   rstn,  
    input   clkb,  
    output  out); 

    reg [2:0]    d_dly ;  
	
    always @(posedge clkb or negedge rstn) begin
        if (!rstn) 
		    d_dly  <= 3'b0 ;
        else      
		    d_dly  <= {d_dly[1:0], d} ;
    end
    assign out = d_dly[1] && !d_dly[2] ; 
   
endmodule   
   