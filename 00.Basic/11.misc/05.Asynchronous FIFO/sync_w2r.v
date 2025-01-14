module sync_w2r
    #(parameter BUF_SIZE = 8)
    (
        output reg [$clog2(BUF_SIZE)+1:0] rq2_wptr,
        input      [$clog2(BUF_SIZE)+1:0] wptr,
        input      rclk, rrst_n
    );        
	
	reg [$clog2(BUF_SIZE)+1:0] rq1_wptr;
    
    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n)
            {rq2_wptr,rq1_wptr} <= 0;
        else
            {rq2_wptr,rq1_wptr} <= {rq1_wptr,wptr};
    end
endmodule