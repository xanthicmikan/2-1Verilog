module file_tb;
    integer    fd_w, fd_r;
    integer    i, result;
    reg [7:0]  my_var;
    reg [8*32-1:0] str = 0;	
    
    initial begin
        // Create a new file
        fd_w = $fopen("test.txt", "w");
        fd_r = $fopen("my_file.txt", "r");	
        my_var = 0;
        
        $fdisplay(fd_w, "Value displayed with $fdisplay");
        #10 my_var = 8'h1A;
        $fdisplay(fd_w, my_var);  // decimal
        $fdisplayb(fd_w, my_var); // binary
        $fdisplayo(fd_w, my_var); // octal
        $fdisplayh(fd_w, my_var); // hex
        
        $fdisplay(fd_w, "Value displayed with $fwrite");
        #10 my_var = 8'h2B;
        $fwrite(fd_w, my_var);
        $fwriteb(fd_w, my_var);
        $fwriteo(fd_w, my_var);
        $fwriteh(fd_w, my_var);
        
        //#10 $fdisplay(fd_w, "Value displayed with $fmonitor");
        //$fmonitor(fd_w, "0x%h", my_var);
        
        //for(i = 0; i < 5; i= i+1) begin
            //#5 my_var <= i;
        //end

        while (! $feof(fd_r)) begin
          result = $fgets(str, fd_r);
          $display("%0s", str);
        end		
        
        #10 $fclose(fd_w);
		    $fclose(fd_r);
    end
endmodule