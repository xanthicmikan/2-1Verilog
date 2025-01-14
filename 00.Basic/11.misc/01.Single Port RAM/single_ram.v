//A single-port RAM has only one data port, 
//which means that read and write operations 
//cannot occur simultaneously at different addresses. 
//If a write operation is in progress, 
//a read operation must wait, and vice versa.
module single_ram
    #(parameter ADDR_WIDTH = 4,
      parameter DATA_WIDTH = 32,
      parameter DEPTH = 16)
    (
      input clk,
      input [ADDR_WIDTH-1 :0] addr,	
      inout [DATA_WIDTH-1 :0] data,
      input cs,	
      input we,
      input oe
    );

    reg [DATA_WIDTH-1 :0] tmp_data;
    reg [DATA_WIDTH-1 :0] mem [DEPTH-1:0];
	//reg [DATA_WIDTH-1 :0] mem [DEPTH]; => modify to .sv
	
	always @(posedge clk) begin
	    if(cs & we)
		    mem[addr] <= data;
	end
	
	always @(posedge clk) begin
	    if(cs & !we)
		    tmp_data <= mem[addr];
	end
	
	assign data = cs & oe & !we ? tmp_data : 'hz;
endmodule