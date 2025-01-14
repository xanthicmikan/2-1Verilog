module mos( input d,
                    input ctrl,//nmos/pmos
                    input nctrl,//cmos
                    input pctrl,//cmos	
                    output outn,
                    output outp,
					output outc);

    nmos (outn, d, ctrl);
    pmos (outp, d, ctrl);
	
	cmos (outc, d, nctrl, pctrl);

endmodule