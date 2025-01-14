module gray2bin
  #(parameter MSB = 4)
  (
    input [MSB-1:0] gray,
    output [MSB-1:0] bin
  );
    
    genvar i;
    generate
        for(i = 0; i <= MSB-2; i = i + 1)
		begin
            assign bin[i] = gray[i] ^ bin[i+1];
        end
    endgenerate
    
    assign bin[MSB-1] = gray[MSB-1];

endmodule