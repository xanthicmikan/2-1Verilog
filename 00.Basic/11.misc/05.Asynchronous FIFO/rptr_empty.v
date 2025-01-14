module rptr_empty
    #(parameter BUF_SIZE = 8)
    (
        output reg rempty,                         
        output     [$clog2(BUF_SIZE)-1:0] raddr,   
        output reg [$clog2(BUF_SIZE):0]  rptr,
        input      [$clog2(BUF_SIZE):0] rq2_wptr, 
        input      rinc, rclk, rrst_n
	);
	
    reg  [$clog2(BUF_SIZE):0] rbin;
    wire [$clog2(BUF_SIZE):0] rgraynext, rbinnext;
    wire  rempty_val;
    
    always @(posedge rclk or negedge rrst_n)
        if (!rrst_n)
            begin
                rbin <= 0;
                rptr <= 0;
            end
        else
            begin
                rbin <= rbinnext ;
                rptr <= rgraynext;
            end
    
    assign rbinnext = !rempty ? (rbin + rinc) : rbin; 
    assign rgraynext = (rbinnext>>1) ^ rbinnext;      
    assign raddr = rbin[$clog2(BUF_SIZE)-1:0];
    
    assign rempty_val = (rgraynext == rq2_wptr);
    always @(posedge rclk or negedge rrst_n)
        if (!rrst_n)
            rempty <= 1'b1;
        else
            rempty <= rempty_val;
endmodule