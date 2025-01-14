`timescale 1ns/1ns
module ringOSC 
    #(parameter NUM_INV = 3,
      parameter INV_delay = 2) 
    (
	    input en,
    	output osc_out
    );

    wire [NUM_INV:0] wi;
    
    assign wi[0] = en ? wi[NUM_INV] : 0;
    assign osc_out = en ? wi[NUM_INV] : 0;

    genvar i;
    generate 
	    for (i=0; i< NUM_INV; i=i+1) begin 
	        if(i == 0)begin
			   `ifndef OSC_SYNTHESIS
	    	       not #(INV_delay) (wi[i+1], wi[0]);
				`else
	    	       not (wi[i+1], wi[0]);				
				`endif
            end
	    	else if(i >= NUM_INV) begin
			   `ifndef OSC_SYNTHESIS
	    	       not #(INV_delay) (wi[i+1], wi[i]);
				`else
	    	       not (wi[i+1], wi[i]);				
				`endif
	    	end			
	    	else begin
			   `ifndef OSC_SYNTHESIS
	    	       not #(INV_delay) (wi[i+1], wi[i]);
				`else
	    	       not (wi[i+1], wi[i]);				
				`endif
	    	end
        end
    endgenerate
endmodule