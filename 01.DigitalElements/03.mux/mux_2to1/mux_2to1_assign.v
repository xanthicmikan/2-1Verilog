module mux_2to1(
    input I0,I1,S,
    output Y);
    
    assign Y = S?I1:I0;
                   
endmodule