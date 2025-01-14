module bidirectional (input io1, ctrl,
                      output io2,
					  output io2_0,
					  output io2_1);

  tran (io1, io2);
  
  tranif0 (io1, io2_0, ctrl);
  
  tranif1 (io1, io2_1, ctrl);
  
endmodule