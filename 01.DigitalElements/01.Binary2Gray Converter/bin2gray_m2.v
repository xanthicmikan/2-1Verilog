module bin2gray
  #(parameter MSB = 4)
  (
    input [MSB-1:0] bin,
    output [MSB-1:0] gray
  );
    
    genvar i;
    generate
        for(i = 0; i < MSB-1; i = i + 1) begin
            assign gray[i] = bin[i] ^ bin[i+1];
        end
    endgenerate
    
    assign gray[MSB-1] = bin[MSB-1];	
endmodule