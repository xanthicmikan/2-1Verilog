initial begin
	#10   data = 8'hfe;
	fork
	   #20 data = 8'h11;
	   #10 data = 8'h00;
	join
end

//That is mean
//        initial begin
//               |
//               |
//        #10 data = 8'hfe; 
//               |
//        ---------------
//       |      fork     |
//       |               |
//       |               |
//       |         #10 data = 8'h00;
//       |               |
//#20 data = 8'h11;      |
//       |               |
//       |               |
//        ---------------
//             join
//               |
//               |
//              end