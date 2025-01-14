//The push and pop signals are used to add and delete data from the stack. 
//Any data that is added to a full stack will be lost.
module lifo_ctl
    #(parameter WIDTH=32, 
	            DEPTH=16) 
    (
        input             clk,
        input             rst,
        input             push,
        input             pop,
        input [WIDTH-1:0] data_in,
	    
        output reg [WIDTH-1:0] data_out,
        output reg             empty,
        output reg             full );

    reg [$clog2(DEPTH):0] stack_ptr; 
    reg [WIDTH-1:0] stack [DEPTH-1:0]; 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            stack_ptr <= 0;
            empty <= 1;
            full <= 0;
        end 
		else begin
            if (push && !full) begin
                stack[stack_ptr] <= data_in;
                stack_ptr        <= stack_ptr + 1;
                empty            <= 0;

                if (stack_ptr == DEPTH - 1) begin
                    full <= 1;
                end
            end 
			else if (pop && !empty) begin
                stack_ptr <= stack_ptr - 1;
                full      <= 0;

                if (stack_ptr == 1) begin
                    empty <= 1;
                end
            end
        end
    end

    always @(*) begin
      if (!empty & pop)
            data_out = stack[stack_ptr - 1];
        else
            data_out = {WIDTH{1'b0}};
    end
endmodule