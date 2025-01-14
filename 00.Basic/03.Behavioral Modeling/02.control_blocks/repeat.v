/*
// 1.
repeat ([num_of_times]) begin
	[statements]
end
// 2.
repeat ([num_of_times]) @ ([some_event]) begin
	[statements]
end
*/
module my_top;
	initial begin
		repeat(4) begin
			$display("Repeat 4 times ...");
		end
	end
endmodule