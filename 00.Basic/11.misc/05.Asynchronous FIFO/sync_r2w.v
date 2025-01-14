module sync_r2w
    #(parameter BUF_SIZE = 8)
    (
        output reg [$clog2(BUF_SIZE):0] wq2_rptr,
        input      [$clog2(BUF_SIZE):0] rptr,
        input                       wclk, wrst_n
    );
    reg [$clog2(BUF_SIZE):0] wq1_rptr;

    always @(posedge wclk or negedge wrst_n) begin
        if (!wrst_n)
            {wq2_rptr,wq1_rptr} <= 0;
        else
            {wq2_rptr,wq1_rptr} <= {wq1_rptr,rptr};
    
    end
    
endmodule