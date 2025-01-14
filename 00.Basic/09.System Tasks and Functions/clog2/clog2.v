module clog
    #(parameter NUM_UNITS = 7)
    (
	//$clog2 returns the ceiling of log2
	//$clog2 of 7 = 3
    input [$clog2(NUM_UNITS)-1:0] active_unit);

    initial
        $monitor("active_unit = %d, MSB = %d", active_unit, $clog2(NUM_UNITS));
endmodule