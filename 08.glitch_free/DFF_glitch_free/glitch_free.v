//delay 3 dff
module glitch_free (  
    input  clk,  
    input  rst_n,
    input  data,	
    output out); 
	
    reg [2:0]data_dly;
	
    always @(negedge clk or negedge rst_n)begin     
        if(!rst_n)begin         
            data_dly <= 'b0;     
        end     
        else begin         
            data_dly <= {data_dly[1:0], data};      
        end 
    end 
	
    assign out = |data_dly; 
endmodule