module bin2gray
  #(parameter MSB = 4)
  (
    input [MSB-1:0] bin,
    output [MSB-1:0] gray
  );
    
	assign gray = (bin >> 1) ^ bin;

endmodule