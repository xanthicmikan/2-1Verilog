module glitch_free (    
    input clk0,        
    input clk1,    
    input select,  
    input rst_n,    
    output clkout
);
    wire A, B;
	wire E, F;
    reg DFF1Q, DFF2Q, DFF2_Q; 	
    reg DFF3Q, DFF4Q, DFF4_Q; 

    assign A = select & DFF4_Q;
    assign B = ~select & DFF2_Q;


    always@(posedge clk1 or negedge rst_n) begin    
        if(~rst_n)        
            DFF1Q <= 0;    
        else        
            DFF1Q <= A;
        end 
    
    always@(negedge clk1 or negedge rst_n) begin    
        if(~rst_n) begin        
            DFF2Q <= 0;        
            DFF2_Q <= 1;    
        end    
        else begin        
            DFF2Q <= DFF1Q;        
            DFF2_Q <= ~DFF1Q;     
        end 
    end 
    
    always@(posedge clk0 or negedge rst_n) begin    
        if(~rst_n)        
            DFF3Q <= 0;    
        else        
            DFF3Q <= B;
        end
    
    always@(negedge clk0 or negedge rst_n) begin    
        if(~rst_n) begin        
            DFF4Q <= 0;        
            DFF4_Q <= 1;    
        end    
        else begin        
            DFF4Q <= DFF3Q;        
            DFF4_Q <= ~DFF3Q;     
        end
    end
    
    assign E = clk1 & DFF2Q;
    assign F = clk0 & DFF4Q;
    assign clkout = E | F;
endmodule