module dds(
    input  clk,
    input  rstn,
    input  wave_en,

    input [1:0]wave_sel,
    input [1:0]wave_amp,
    input [7:0]phase_init,
    input [7:0]f_word,

    output [9:0]dout,
    output  dout_en);

    reg [7:0] phase_acc_r ;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            phase_acc_r <= 'b0 ;
        end
        else if (wave_en) begin
            phase_acc_r <= phase_acc_r + f_word ;
        end
        else begin
            phase_acc_r <= 'b0 ;
        end
    end

    reg [7:0] mem_addr_r ;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            mem_addr_r <= 'b0 ;
        end
        else if (wave_en) begin
            mem_addr_r <= phase_acc_r + phase_init ;
        end
        else begin
            mem_addr_r <= 'b0 ;
        end
    end


    wire [9:0]   dout_temp ;
    mem  u_mem_wave(
        .clk    (clk),
        .rstn   (rstn),
        .en     (wave_en),
        .sel    (wave_sel[1:0]),
        .addr   (mem_addr_r[7:0]),
        .dout_en(dout_en),
        .dout   (dout_temp[9:0]));

    assign  dout = dout_temp >> wave_amp ;
endmodule