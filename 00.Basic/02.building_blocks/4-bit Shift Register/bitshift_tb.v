`timescale 1ns/1ns
module bitshift_tb;

	
    reg clk;
    reg rstn;		
    reg d;
	
    //output
    wire [3:0] out;

	bitshift #(MSB) u0 (
	                .clk(clk),
	                .rstn(rstn),
	                .d(d),					
	                .out(out));
	always #10 clk = ~clk;

	initial begin
	    clk <= 0;
	    rstn <= 0;
	    d <= 'h0;
	end

    initial begin
        #10 rstn <= 1;
        #10 d <= 'h1;
        #10 d <= 'h1;
        #10 d <= 'h0;
        #10 d <= 'h1;
        #10 d <= 'h0;
        #10 d <= 'h0;
        #10 d <= 'h1;
        #10 d <= 'h1;
        #10 d <= 'h1;		
        #20 $finish;
    end	
   
    initial begin//An initial block is not synthesizable.
	    $monitor("d= 0x%0h, out= 0x%0h", d,out);
	end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, bitshift_tb);
	end  

endmodule