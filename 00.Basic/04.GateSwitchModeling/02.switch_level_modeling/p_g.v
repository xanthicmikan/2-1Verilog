module p_g (output vdd,
			output gnd);

	supply1 _vdd;
	supply0 _gnd;

	assign vdd = _vdd;
	assign gnd = _gnd;
  
endmodule