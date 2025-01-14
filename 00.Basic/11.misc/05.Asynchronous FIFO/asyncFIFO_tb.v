`timescale 1 ps/ 1 ps
module async_fifo_tb();
    reg i_r_en;
    reg i_rclk;
    reg i_rrst_n;
    reg i_w_en;
    reg i_wclk;
    reg i_wrst_n;
    reg [7:0] i_wdata;

    wire o_buf_empty;
    wire o_buf_full;
    wire [7:0] o_rdata;

    async_fifo u1 (
        .i_r_en(i_r_en),
        .i_rclk(i_rclk),
        .i_rrst_n(i_rrst_n),
        .i_w_en(i_w_en),
        .i_wclk(i_wclk),
        .i_wdata(i_wdata),
        .i_wrst_n(i_wrst_n),
        .o_buf_empty(o_buf_empty),
        .o_buf_full(o_buf_full),
        .o_rdata(o_rdata)
    );

    always #10 i_wclk = ~i_wclk;
    always #5 i_rclk = ~i_rclk;

    reg [7:0] r_data=8'd0;

    initial begin
        i_wclk=1'b0;
        i_rclk=1'b0;
        i_wrst_n=1'b1;
        i_rrst_n=1'b1;
        i_w_en=1'b0;
        i_r_en=1'b0;
        i_wdata=8'd0;
        #1 i_wrst_n=1'b0;
        i_rrst_n=1'b0;

        #1 i_wrst_n=1'b1;
        i_rrst_n=1'b1;

        #20 push(1);
		
        push(2);
        push(3);
        push(4);
        push(5);
        push(6);
        push(7);
        push(8);
        push(9);
        pop(r_data);
        push(10);
        push(11);
        push(12);
        push(13);
        push(14);
        push(15);
        push(16);
        pop(r_data);
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
            i_wdata=data;
            i_w_en=1;
            @(posedge i_wclk) #4 i_w_en= 0;
        end
    endtask

    task pop(output[7:0] data);
        if(o_buf_empty)
            $display("Cannot Pop: Buffer Empty");
        else begin
            data = o_rdata;
            $display("Pop:",,data);
            i_r_en=1;
            @(posedge i_rclk) #4 i_r_en= 0;
        end
    endtask

    initial begin
	    $dumpfile("dump.vcd");
	    $dumpvars(2, async_fifo_tb);
    end	
endmodule