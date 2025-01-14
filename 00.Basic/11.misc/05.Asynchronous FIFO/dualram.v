module dualram
    #(
        parameter BUF_WIDTH = 8, 
        parameter BUF_SIZE = 8   
    )
    (
        input      wclken,wclk,
        input      [$clog2(BUF_SIZE)-1:0]  raddr,     
        input      [$clog2(BUF_SIZE)-1:0]  waddr,     
        input      [BUF_WIDTH-1:0]  wdata,
        output     [BUF_WIDTH-1:0]  rdata 
    );
    
    reg [BUF_WIDTH-1:0] Mem[BUF_SIZE-1:0];

    always@(posedge wclk)
        begin
            if(wclken)
                Mem[waddr] <= wdata;
        end

    assign rdata =  Mem[raddr];

endmodule