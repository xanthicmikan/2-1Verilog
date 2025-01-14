//CLK  J K | Qn+1
//-------------------------
// 0   x x |  Qn
//-------------------------
// ↑   0 0 |  Qn (Hold)
// ↑   0 1 |  0  (Reset)
// ↑   1 0 |  1  (Set)
// ↑   1 1 |  Qn (Toggle)
//-------------------------
module jk_ff(
    input j,
    input k,
    input clk,
    output q
);

    reg q;
    
    always @(posedge clk)
        case({j,k})
          2'b00: q <= q;
          2'b01: q <= 0;
          2'b10: q <= 1;
          2'b11: q <= ~q;	
        endcase
    
endmodule