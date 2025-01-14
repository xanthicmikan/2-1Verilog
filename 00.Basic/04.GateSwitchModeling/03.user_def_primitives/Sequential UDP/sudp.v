//Sequential UDP 
primitive d_latch (q, clk, d);
	output 	q;
	input 	clk, d;
	reg  	q;

	table
		// clk 	d 		q 	q+
			1 	1 	:	? :	1;
			1 	0 	: 	? : 0;
			0 	? 	: 	? : -;
	endtable
endprimitive