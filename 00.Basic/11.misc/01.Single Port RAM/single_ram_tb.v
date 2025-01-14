`timescale 1ns/1ns
module single_ram_tb;
    parameter ADDR_WIDTH = 4;
    parameter DATA_WIDTH = 16;
    parameter DEPTH = 16;
	
    reg clk;
    reg cs;	
    reg we;
    reg oe;	
    reg [ADDR_WIDTH-1 :0] addr;
    wire [DATA_WIDTH-1 :0] data;   
    reg [DATA_WIDTH-1 :0] tb_data;	

	single_ram #(.DATA_WIDTH(DATA_WIDTH)) u0 (
	                .clk(clk),
	                .addr(addr),
	                .data(data),
	                .cs(cs),
	                .we(we),					
	                .oe(oe));
					
	always #10 clk = ~clk;
	assign data = !oe ? tb_data : 'hz;

	initial begin
        {clk, cs, we, addr, tb_data, oe} <= 0;

        repeat (2) @ (posedge clk)
        for (integer i = 0; i < 2**ADDR_WIDTH; i= i+1) begin
          repeat (1) @(posedge clk) addr <= i; we <= 1; cs <=1; oe <= 0; tb_data <= $random;
        end
        
        for (integer i = 0; i < 2**ADDR_WIDTH; i= i+1) begin
          repeat (1) @(posedge clk) addr <= i; we <= 0; cs <= 1; oe <= 1;
        end

        #20 $finish;
   end	

	initial begin		
		$monitor("T=%0t, addr=0x%0h, data=0x%0h, tb_data=0x%0h", $time, addr, data, tb_data);
	end

	initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, single_ram_tb);
	end  

endmodule