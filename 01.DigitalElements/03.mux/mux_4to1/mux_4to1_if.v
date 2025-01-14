module mux_4to1(input [3:0] a,    
                input [3:0] b,    
                input [3:0] c,    
                input [3:0] d,    
                input [1:0] sel,  
                output reg [3:0] out);

	always @(a, b, c, d, sel) begin
		if(sel == 2'b00)
			out = a;
		else if(sel == 2'b01)
			out = b;
		else if(sel == 2'b10)
			out = c;
		else if(sel == 2'b11)
			out = d;
		else
			out = out;			
	end
                
endmodule