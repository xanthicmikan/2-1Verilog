module s2p (
    input clk,
    input rst_n,
    input en,
    input si,
    output [3:0] po);
    
    input clk;
    input rst_n;
    input en;
    input si;
    output [3:0] po;
    
    reg [3:0] r;
    
    always@(posedge clk or negedge rst_n)
        if (~rst_n)
            r <= 8'h0;
        else
            r <= {r, si};
       
    assign po = (en) ? r : 4'h0;
       
endmodule