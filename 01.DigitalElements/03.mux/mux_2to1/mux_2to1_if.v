module mux_2to1(
	input I0,I1,S,
	output reg Y);

	always @(*) begin
		if(S)
			Y = I1;
		else
			Y = I0;
	end
                
endmodule