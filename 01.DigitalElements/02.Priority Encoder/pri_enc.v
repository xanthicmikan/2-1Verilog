module pri_enc
  #(parameter N = 8)
  (
    input [N-1:0] a,
    input [N-1:0] b,	
    input [N-1:0] c,
    input [N-1:0] d,	
    input [1:0] sel,
    output reg [N-1:0] out
  );
    
	always@(a, b, c, d, sel) begin
	    if (sel == 2'b00)
		    out <= a;	
	    else if (sel == 2'b01)
		    out <= b;	
	    else if (sel == 2'b10)
		    out <= c;	
	    else
		    out <= d;			
	end
	
endmodule