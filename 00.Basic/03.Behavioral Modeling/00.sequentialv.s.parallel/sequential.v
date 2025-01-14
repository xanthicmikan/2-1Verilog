initial begin
	#10 data = 8'hfe;
	#20 data = 8'h11;
end

//That is mean
//        initial begin
//               |
//               |
//        #10 data = 8'hfe; 
//               |
//        #20 data = 8'h11;
//               |
//               |
//              end