module wptr_full
    #(
        parameter BUF_SIZE = 8
    )
    (
        output reg wfull,                     
        output     [$clog2(BUF_SIZE)-1:0] waddr, 
        output reg [$clog2(BUF_SIZE):0]  wptr,  
        input      [$clog2(BUF_SIZE):0]  wq2_rptr, 
        input      winc, wclk, wrst_n
	);
	
    reg  [$clog2(BUF_SIZE):0] wbin;
    wire [$clog2(BUF_SIZE):0] wgraynext, wbinnext;
    wire wfull_val;
    // GRAYSTYLE2 pointer
    always @(posedge wclk or negedge wrst_n)
        if (!wrst_n)
        begin
            wbin <= 0;
            wptr <= 0;
        end
        else
        begin
            wbin <= wbinnext;
            wptr <= wgraynext;
        end
   
    assign wbinnext  = !wfull ? (wbin + winc) : wbin;
    assign wgraynext = (wbinnext>>1) ^ wbinnext;
    assign waddr = wbin[$clog2(BUF_SIZE)-1:0];
          
    assign wfull_val = (wgraynext=={~wq2_rptr[$clog2(BUF_SIZE):$clog2(BUF_SIZE)-1],
                        wq2_rptr[$clog2(BUF_SIZE)-2:0]});
    always @(posedge wclk or negedge wrst_n)
        if (!wrst_n)
            wfull <= 1'b0;
        else
            wfull <= wfull_val;
endmodule