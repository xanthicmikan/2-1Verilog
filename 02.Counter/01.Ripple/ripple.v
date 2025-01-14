//A ripple counter is an asynchronous counter 
//in which the all the flops except the first 
//are clocked by the output of the preceding flop.

//dff
module dff 	( input d,
              input rstn,
              input clk,
              output reg q,
              output qn);

	always @ (posedge clk or negedge rstn)
       if (!rstn)
          q <= 0;
       else
          q <= d;
		  
    assign qn = ~q; 	  
endmodule

//connect dff 
module ripple ( input rstn,
                input clk,
                output [3:0] out);
	wire q0,qn0;
	wire q1,qn1;
	wire q2,qn2;
	wire q3,qn3;	
	
	dff dff0 ( .d(qn0),
               .rstn(rstn),
               .clk(clk),
               .q(q0),
               .qn(qn0));
	dff dff1 ( .d(qn1),
               .rstn(rstn),
               .clk(q0),
               .q(q1),
               .qn(qn1));
	dff dff2 ( .d(qn2),
               .rstn(rstn),
               .clk(q1),
               .q(q2),
               .qn(qn2));
	dff dff3 ( .d(qn3),
               .rstn(rstn),
               .clk(q2),
               .q(q3),
               .qn(qn3));			   

    assign out = {qn3, qn2, qn1, qn0};
endmodule