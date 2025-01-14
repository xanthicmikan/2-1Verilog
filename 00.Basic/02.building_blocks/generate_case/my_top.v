module mux_assign ( input a, b, sel,
                    output out);
  assign out = sel ? a : b;
  
  initial
  	$display ("mux_assign is instantiated");
endmodule

module mux_case (input a, b, sel,
                 output reg out);
  always @ (a or b or sel) begin
  	case (sel)
    	0 : out = a;
   	 	1 : out = b;
  	endcase
  end
  initial
    $display ("mux_case is instantiated");
endmodule

module my_top (	input a, b, sel,
         		output out);
  parameter USE_CASE = 0;

  generate
  	case (USE_CASE)
	  0 : mux_assign ma(.a(a), .b(b), .sel(sel), .out(out));
      1 : mux_case mc(.a(a), .b(b), .sel(sel), .out(out));
    endcase
  endgenerate

endmodule