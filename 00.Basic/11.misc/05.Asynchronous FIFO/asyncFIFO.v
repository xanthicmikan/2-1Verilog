module async_fifo
    #(parameter BUF_SIZE=8, 
                BUF_WIDTH=8)
    (
        input  [BUF_WIDTH-1:0] i_wdata,
        input                  i_w_en, i_wclk, i_wrst_n, 
        input                  i_r_en, i_rclk, i_rrst_n, 
        output [BUF_WIDTH-1:0] o_rdata,
        output                 o_buf_full,
        output                 o_buf_empty
    );
    wire [$clog2(BUF_SIZE)-1:0] waddr, raddr;
    wire [$clog2(BUF_SIZE):0]   wptr, rptr, wq2_rptr, rq2_wptr;

sync_r2w I1_sync_r2w(
    .wq2_rptr(wq2_rptr),
    .rptr(rptr),
    .wclk(i_wclk),
    .wrst_n(i_wrst_n));
	
sync_w2r I2_sync_w2r (
    .rq2_wptr(rq2_wptr),
    .wptr(wptr),
    .rclk(i_rclk),
    .rrst_n(i_rrst_n));

     /* DualRAM */
dualram #(BUF_WIDTH, BUF_SIZE) I3_DualRAM(
    .rdata(o_rdata),
    .wdata(i_wdata),
    .waddr(waddr),
    .raddr(raddr),
    .wclken(i_w_en),
    .wclk(i_wclk));

rptr_empty #(BUF_SIZE) I4_rptr_empty(
    .rempty(o_buf_empty),
    .raddr(raddr),
    .rptr(rptr),
    .rq2_wptr(rq2_wptr),
    .rinc(i_r_en),
    .rclk(i_rclk),
    .rrst_n(i_rrst_n));
	
wptr_full #(BUF_SIZE) I5_wptr_full(
    .wfull(o_buf_full),
    .waddr(waddr),
    .wptr(wptr),
    .wq2_rptr(wq2_rptr),
    .winc(i_w_en),
    .wclk(i_wclk),
    .wrst_n(i_wrst_n));
	
endmodule