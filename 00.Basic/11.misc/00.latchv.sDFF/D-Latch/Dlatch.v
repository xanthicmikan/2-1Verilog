module d_latch (input d,           
                input en,          
                input rstn,        
                output reg q);     
				  
   always @ (en or rstn or d)//notice
        if (!rstn)
            q = 0;
        else
            if (en)
                q = d;
		  
endmodule

//mothed 2
//asign q = (!rstn) ? 0 : (en) ? d : q;