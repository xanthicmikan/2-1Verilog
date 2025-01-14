module mem(
    input  clk,
    input  rstn,
    input  en,
    input [1:0]sel,

    input [7:0]addr,
    output  dout_en,
    output [9:0]dout);

    wire [9:0]q_tri ;
    wire [9:0]q_square ;
    wire [9:0]q_cos ;

    reg [1:0]en_r ;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            en_r <= 2'b0 ;
        end
        else begin
            en_r <= {en_r[0], en};
        end
    end
    assign dout = en_r[1] ? (q_tri | q_square | q_cos) : 10'b0 ;
    assign dout_en = en_r[1] ;

    cos_ROM u_cos_ROM (
       .clk (clk),
       .en  (en_r[0] & (sel == 2'b0)),
       .addr(addr[7:0]),
       .q   (q_cos[9:0]));

    square_ROM u_square_ROM (
       .clk (clk),
       .en  (en_r[0] & sel == 2'b01),
       .addr(addr[7:0]),
       .q   (q_square[9:0]));

    tri_ROM u_tri_ROM (
       .clk (clk),
       .en  (en_r[0] & sel == 2'b10),
       .addr(addr[7:0]),
       .q   (q_tri[9:0]));

endmodule

module square_ROM (
    input  clk,
    input  en,
    input [7:0]addr,
    output reg [9:0]q);
    
    always @(posedge clk) begin
        if (en) begin
            q <= { 10{(addr < 128)} };     
        end
        else begin
            q <= 'b0 ;
        end
    end
endmodule

module tri_ROM (
    input  clk,
    input  en,
    input [7:0]addr,
    output reg [9:0]q);
    always @(posedge clk) begin
        if (en) begin
            if (addr < 128) begin
                q <= {addr[6:0], 3'b0};
            end
            else begin 
                q <= 10'h3ff - {addr[6:0], 3'b0} ;
            end
        end
        else begin
            q <= 'b0 ;
        end
    end
endmodule

module cos_ROM (
    input  clk,
    input  en,
    input [7:0]addr,
    output reg [9:0]q);



   wire [8:0]  ROM_t [0 : 64] ;

   /*{
    511, 510, 510, 509, 508, 507, 505, 503,
    501, 498, 495, 492, 488, 485, 481, 476,
    472, 467, 461, 456, 450, 444, 438, 431,
    424, 417, 410, 402, 395, 386, 378, 370,
    361, 352, 343, 333, 324, 314, 304, 294,
    283, 273, 262, 251, 240, 229, 218, 207,
    195, 183, 172, 160, 148, 136, 124, 111,
    99 , 87 , 74 , 62 , 50 , 37 , 25 , 12 ,
    0 } ;
*/
    assign ROM_t[0] = 9'd512;
    assign ROM_t[1] = 9'd510;
    assign ROM_t[2] = 9'd510;
    assign ROM_t[3] = 9'd509;
    assign ROM_t[4] = 9'd508;
    assign ROM_t[5] = 9'd507;
    assign ROM_t[6] = 9'd505;
    assign ROM_t[7] = 9'd503;
    assign ROM_t[8] = 9'd501;
    assign ROM_t[9] = 9'd498;
    assign ROM_t[10] =9'd495;
    assign ROM_t[11] =9'd492;
    assign ROM_t[12] =9'd488;
    assign ROM_t[13] =9'd485;
    assign ROM_t[14] =9'd481;
    assign ROM_t[15] =9'd476;
    assign ROM_t[16] =9'd472;
    assign ROM_t[17] =9'd467;
    assign ROM_t[18] =9'd461;
    assign ROM_t[19] =9'd456;
    assign ROM_t[20] =9'd450;
    assign ROM_t[21] =9'd444;
    assign ROM_t[22] =9'd438;
    assign ROM_t[23] =9'd431;
    assign ROM_t[24] =9'd424;
    assign ROM_t[25] =9'd417;
    assign ROM_t[26] =9'd410;
    assign ROM_t[27] =9'd402;
    assign ROM_t[28] =9'd395;
    assign ROM_t[29] =9'd386;
    assign ROM_t[30] =9'd378;
    assign ROM_t[31] =9'd370;
    assign ROM_t[32] =9'd361;
    assign ROM_t[33] =9'd352;
    assign ROM_t[34] =9'd343;
    assign ROM_t[35] =9'd333;
    assign ROM_t[36] =9'd324;
    assign ROM_t[37] =9'd314;
    assign ROM_t[38] =9'd304;
    assign ROM_t[39] =9'd294;
    assign ROM_t[40] =9'd283;
    assign ROM_t[41] =9'd273;
    assign ROM_t[42] =9'd262;
    assign ROM_t[43] =9'd251;
    assign ROM_t[44] =9'd240;
    assign ROM_t[45] =9'd229;
    assign ROM_t[46] =9'd218;
    assign ROM_t[47] =9'd207;
    assign ROM_t[48] =9'd195;
    assign ROM_t[49] =9'd183;
    assign ROM_t[50] =9'd172;
    assign ROM_t[51] =9'd160;
    assign ROM_t[52] =9'd148;
    assign ROM_t[53] =9'd136;
    assign ROM_t[54] =9'd124;
    assign ROM_t[55] =9'd111;
    assign ROM_t[56] =9'd99;
    assign ROM_t[57] =9'd87;
    assign ROM_t[58] =9'd74;
    assign ROM_t[59] =9'd62;
    assign ROM_t[60] =9'd50;
    assign ROM_t[61] =9'd37;
    assign ROM_t[62] =9'd25;
    assign ROM_t[63] =9'd12;
    assign ROM_t[64] =9'd0;

    always @(posedge clk) begin
        if (en) begin
            if (addr[7:6] == 2'b00 ) begin 
                q <= ROM_t[addr[5:0]] + 10'd512 ; 
            end
            else if (addr[7:6] == 2'b01 ) begin 
                q <= 10'd512 - ROM_t[64-addr[5:0]] ; 
            end
            else if (addr[7:6] == 2'b10 ) begin 
                q <= 10'd512 - ROM_t[addr[5:0]]; 
            end
            else begin 
                q <= 10'd512 + ROM_t[64-addr[5:0]]; 
            end
        end
        else begin
            q <= 'b0 ;
        end
    end
endmodule