module pulse_syn
    #(parameter PULSE_INIT = 1'b0)
    (
    input   rstn,
    input   clk_fast,
    input   pulse_fast,
    input   clk_slow,
    output  pulse_slow);
    
    wire clear_n;
    reg  pulse_fast_r;
	
	reg [1:0] pulse_fast2s_r ;
	reg [1:0]  pulse_slow2f_r ;
    //fast clk
    always@(posedge clk_fast or negedge rstn) begin
         if (!rstn)
            pulse_fast_r <= PULSE_INIT ;
         else if (!clear_n)
            pulse_fast_r <= 1'b0 ;
         else if (pulse_fast)
            pulse_fast_r <= 1'b1 ;
    end
    
    //slow clk 
    always@(posedge clk_slow or negedge rstn) begin
        if (!rstn)
            pulse_fast2s_r <= 3'b0 ;
        else               
            pulse_fast2s_r <= {pulse_fast2s_r[0], pulse_fast_r} ;
    end
    assign pulse_slow = pulse_fast2s_r[1] ;
   
    //feedback for slow clk to fast clk
    always@(posedge clk_fast or negedge rstn) begin
       if (!rstn)
         pulse_slow2f_r <= 1'b0 ;
       else
         pulse_slow2f_r <= {pulse_slow2f_r[0], pulse_slow} ;
    end

    assign clear_n = ~(!pulse_fast && pulse_slow2f_r[1]) ;
    
endmodule