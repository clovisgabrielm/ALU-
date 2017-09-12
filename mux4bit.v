module mux4bit(OUT, A, B, C, D, SEL);

input [1:0] SEL;
input [1:0] A, B, C, D;
output [1:0] OUT;
reg [1:0] OUT;

always @(SEL or A or B or C or D)
  begin
    case (SEL)
      2'b00: OUT = A;
      2'b01: OUT = B;
      2'b10: OUT = C;
      2'b11: OUT = D;
    endcase
  end

endmodule
