module enc_4x2(
    input a, b, c, d,
    output x, y);

    or (x, b, d);
	or (y, c, d);
	
    //method 2	
    //assign x = b | d;
    //assign y = c | d;	
	
endmodule