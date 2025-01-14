`timescale 1ns/1ns
module convert_tb;
    parameter MSB = 4;
	
    reg [MSB-1:0] bin_in;
	
    //output
    wire [MSB-1:0] gray;
	wire [MSB-1:0] bin_out;

	bin2gray #(MSB) u0 (
	                .bin(bin_in),					
	                .gray(gray));
					
	gray2bin #(MSB) u1 (
	                .bin(bin_out),					
	                .gray(gray));

   initial begin

        bin_in = 4'd0;
        #20 bin_in = bin_in + 1;//1
        #20 bin_in = bin_in + 1;
        #20 bin_in = bin_in + 1;
        #20 bin_in = bin_in + 1;
        #20 bin_in = bin_in + 1;
        #20 bin_in = bin_in + 1;
        #20 bin_in = bin_in + 1;
        #20 bin_in = bin_in + 1;
        #20 bin_in = bin_in + 1;
        #20 bin_in = bin_in + 1;//0xa
        #20 bin_in = bin_in + 1;//0xb	
        #20 bin_in = bin_in + 1;//0xc	
        #20 bin_in = bin_in + 1;//0xd	
        #20 bin_in = bin_in + 1;//0xe
        #20 bin_in = bin_in + 1;//0xf		
        #20  $finish;
   end	

	initial begin		
		$monitor("bin_in=%b, gray=%b, bin_out=%b", bin_in, gray, bin_out);
	end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, convert_tb);
	end  

endmodule