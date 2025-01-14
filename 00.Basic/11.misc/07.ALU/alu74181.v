module alu74181
(
        input [3:0] a, b, s,
        input cn, m,
        output [3:0] f,
        output cn4, equal, p, g);

    wire [3:0] f_logic;//logic functions
    wire [3:0] f_arith;//arithmetic operations

    alu_logic alu_l(.a(a), .b(b), .s(s), .f(f_logic));

    alu_arith alu_a(.a(a), .b(b), .s(s), .cn(cn), .f(f_arith), .cn4(cn4));

    //output
    assign f = m ? f_logic : f_arith; //M=High->logic ;M=Low->arithmetic;
    assign equal = (a === b) ? 1'b1 : 1'b0;
    assign p = 1'b0;
    assign q = 1'b0;
    
endmodule

module alu_logic
(
        input [3:0] a, b, s,
        output reg [3:0] f);

    always @(*) begin
    case (s)
      4'b0000: begin
        f = ~a;
      end
      4'b0001 : begin
        f = ~(a | b);
      end
      4'b0010 : begin
        f = (~a) & b;
      end
      4'b0011 : begin
        f = 4'b0;
      end
      4'b0100 : begin
        f = ~(a & b);
      end
      4'b0101 : begin
        f = (~b);
      end
      4'b0110 : begin
        f = a ^ b;
      end
      4'b0111 : begin
        f = a & (~b);
      end
      4'b1000 : begin
        f = (~a) | b;
      end
      4'b1001 : begin
        f = ~(a ^ b);
      end
      4'b1010 : begin
        f = b;
      end
      4'b1011 : begin
        f = a & b;
      end
      4'b1100 : begin
        f = 4'b1;
      end
      4'b1101 : begin
        f = a | (~b);
      end
      4'b1110 : begin
        f = a | b;
      end
      4'b1111 : begin
        f = a;
      end
      default : begin
        f = 4'b0;
      end
    endcase
    end
endmodule

module alu_arith
(
        input [3:0] a, b, s,
        input cn,
        output [3:0] f,
        output cn4);

    reg [4:0] temp;
    wire [4:0] temp_cn;
    // Add carry
    assign temp_cn = temp + { 4'b0000, cn };
    // Outputs
    assign f = cn ? temp_cn[3:0] : temp[3:0];
    assign cn4 = cn ? temp_cn[4] : temp[4];

    always @(*) begin
    case (s)
      4'b0000: begin
        temp = { 1'b0, a };
      end
      4'b0001 : begin
        temp = { 1'b0, (a | b) };
      end
      4'b0010 : begin
        temp = { 1'b0, (a | (~b)) };
      end
      4'b0011 : begin
        temp = 5'b1;
      end
      4'b0100 : begin
        temp = { 1'b0, a } + { 1'b0, (a & (~b)) };
      end
      4'b0101 : begin
        temp = { 1'b0, (a | b) } + { 1'b0, (a & (~b)) };
      end
      4'b0110 : begin
        temp = { 1'b0, a } - { 1'b0, b } - { 1'b0, 4'b0001 };
      end
      4'b0111 : begin
        temp = { 1'b0, (a & (~b)) } - { 1'b0, 4'b0001 };
      end
      4'b1000 : begin
        temp = { 1'b0, a } + { 1'b0, (a & b) };
      end
      4'b1001 : begin
        temp = { 1'b0, a } + { 1'b0, b };
      end
      4'b1010 : begin
        temp = { 1'b0, (a | (~b)) } + { 1'b0, (a & b) };
      end
      4'b1011 : begin
        temp = { 1'b0, (a & b) } - { 1'b0, 4'b0001 };
      end
      4'b1100 : begin
        temp = { 1'b0, a } + { 1'b0, a };
      end
      4'b1101 : begin
        temp = { 1'b0, (a | b) } + { 1'b0, a };
      end
      4'b1110 : begin
        temp = { 1'b0, (a | (~b)) } + { 1'b0, a };
      end
      4'b1111 : begin
        temp = { 1'b0, a } - { 1'b0, 4'b0001 };
      end
      default : begin
        temp = 5'b0;
      end
      
    endcase
    end

endmodule