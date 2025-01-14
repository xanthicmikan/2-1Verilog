`timescale 1ns/1ns

module sync_fifo_tb;
    reg i_clk,i_rst;
    reg i_w_en,i_r_en;
    reg [7:0] i_data;
    wire [7:0] o_data;
    wire o_buf_empty,o_buf_full;

    sync_fifo dut(
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_data(i_data),
        .i_w_en(i_w_en),
        .i_r_en(i_r_en),
        .o_buf_empty(o_buf_empty),
        .o_buf_full(o_buf_full),
        .o_data(o_data)
    );

    initial begin
        #30;
        forever #10 i_clk = ~i_clk; 
    end
	
    reg [7:0] r_data=8'd0;
    initial begin
        i_clk=1'b0;
        i_rst=1'b0;
        i_w_en=1'b0;
        i_r_en=1'b0;
        i_data=8'd0;
        #5  i_rst=1'b1;
        #10 i_rst=1'b0;

        push(1);
        fork 
            push(2);
            pop(r_data);
        join
        push(3);
        push(4);
        push(5);
        push(6);
        push(7);
        push(8);
        push(9);
        push(10);
        push(11);
        push(12);
        push(13);
        push(14);
        push(15);
        push(16);
        push(17);
        pop(r_data);
        push(18);
        pop(r_data);
        pop(r_data);
        pop(r_data);
        pop(r_data);
        push(19);
        pop(r_data);
        push(20);
        pop(r_data);
        pop(r_data);
        pop(r_data);
        pop(r_data);
        pop(r_data);
        pop(r_data);
        pop(r_data);
        pop(r_data);
        pop(r_data);
        pop(r_data);
        pop(r_data);
        push(21);
        pop(r_data);
        pop(r_data);
        pop(r_data);
        pop(r_data);
        #100 $finish;
    end

    task push (input [7:0] data);
        if(o_buf_full)
            $display("Cannot push %d: Buffer Full",data);
        else begin
            $display("Push",,data);
            i_data=data;
            i_w_en=1;
            @(posedge i_clk) #4 i_w_en= 0;
        end
    endtask

    task pop(output[7:0] data);
        if(o_buf_empty)
            $display("Cannot Pop: Buffer Empty");
        else begin
            i_r_en=1;
            @(posedge i_clk) #4 i_r_en= 0;
            data = o_data;
            $display("Pop:",,data);
        end
    endtask
	
    initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, sync_fifo_tb);
    end	
endmodule