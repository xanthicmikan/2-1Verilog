/*
// 1.
forever
	[statement]
// 2.
forever begin
	[multiple statements]
end
*/
module my_top;
	initial begin
		forever begin
			$display ("This is forever loop, simulation can hang!");
		end
	end
endmodule