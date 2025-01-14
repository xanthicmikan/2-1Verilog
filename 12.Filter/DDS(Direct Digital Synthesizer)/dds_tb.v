`timescale 1ns/1ns

module dds_tb ;
    reg       clk ;
    reg       rstn ;
    reg       wave_en ;
    reg [1:0] wave_sel ;
    reg [1:0] wave_amp ;
    reg [7:0] phase_init ;
    reg [7:0] f_word ;
    wire [9:0]dout ;
    wire      dout_en ;

    initial begin
        clk = 1'b0 ;
        rstn = 1'b0 ;
        #100 ;
        rstn = 1'b1 ;
        #10 ;
        forever begin
            #5; clk = ~clk ;
        end
    end

    parameter clk_freq = 100000000;
    integer freq_dst = 2000000 ;
    integer  phase_coe = 2;

    initial begin
        wave_en    = 1'b0 ;
        wave_amp   = 2'd1 ;
        wave_sel   = 2'd0 ;
        phase_init = 256/phase_coe;
        f_word     = (1<<8) * freq_dst / clk_freq;
        #500 ;
        @ (negedge clk) ;
        wave_en    = 1'b1 ;
        # 2000 ;
        wave_en    = 1'b0 ;
        wave_sel   = 2'd2 ;
        phase_init = 256/4 ;
        wave_amp   = 2'd2 ;
        # 50 ;
        wave_en    = 1'b1 ;
    end

    dds u_dds(
        .clk       (clk),
        .rstn      (rstn),
        .wave_en   (wave_en),
        .wave_sel  (wave_sel[1:0]),
        .wave_amp  (wave_amp[1:0]),
        .phase_init(phase_init[7:0]),
        .f_word    (f_word[7:0]),
        .dout      (dout[9:0]),
        .dout_en   (dout_en));

    always begin
        #100;
        if ($time >= 100000) $finish ;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(2, dds_tb);
    end
endmodule