//Edge-Sensitive UDP 
primitive d_flop (q, clk, d);
	output  q;
	input 	clk, d;
	reg 	q;

	table
		// clk 		d 	 	q 		q+
			// obtain output on rising edge of clk
			(01)	0 	: 	? 	: 	0;
			(01) 	1 	: 	? 	: 	1;
			(0?) 	1 	: 	1 	: 	1;
			(0?) 	0 	: 	0 	: 	0;

			// ignore negative edge of clk
			(?0) 	? 	: 	? 	: 	-;

			// ignore data changes on steady clk
			? 		(??): 	? 	: 	-;
	endtable
endprimitive