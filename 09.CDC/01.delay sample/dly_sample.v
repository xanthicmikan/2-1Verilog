module delay_sample(
    input        rstn,
    input        clka,
    input [31:0] din,
    input        din_en,
    
    input        clkb,
    output [31:0]dout,
    output       dout_en);
    
    reg [2:0]    din_en_r ;
    reg [31:0]   dout_r ;
    reg          dout_en_r ;

    //sync din_en
    always @(posedge clkb or negedge rstn) begin
        if (!rstn) 
            din_en_r <= 3'b0 ;
        else       
            din_en_r <= {din_en_r[1:0], din_en} ;
    end
    wire din_en_pos = din_en_r[1] && !din_en_r[2] ;
    
    //sync data
    always @(posedge clkb or negedge rstn) begin
        if (!rstn)
            dout_r <= 'b0 ;
        else if (din_en_pos)
            dout_r <= din ;
    end
    //dout_en delay
    always @(posedge clkb or negedge rstn) begin
        if (!rstn)        
            dout_en_r <= 1'b0 ;
        else             
            dout_en_r <= din_en_pos ;
    end
    assign dout    = dout_r ;
    assign dout_en = dout_en_r ;
    
endmodule