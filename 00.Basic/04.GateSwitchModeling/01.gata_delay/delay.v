module  delay (	input a, b,
				output c, d, e, f);


    //rise, fall and turn-off delay are all 0.11
	and #(0.11) (c, a, b);
	//rise delay = 0.1, fall dalay = 0.2, trun-off delay = 0.2
	or #(0.1, 0.2) (d, a, b);
	//rise delay = 0.2, fall dalay = 0.1, trun-off delay = 0.3
	bufif0 #(0.2, 0.1, 0.3) (e, a, b);
	
	or #(0.1:0.2:0.3, 0.3:0.4:0.5) (f, a, b);

		
endmodule