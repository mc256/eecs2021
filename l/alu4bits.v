module alu4bits;
input [8:0]a,b;
input [3:0]sel;
output [8:0]z;
reg [8:0]z;
always @(sel,a,b)
begin
case(sel)
4'b0000: z = a + b;
4'b0000: z = a - b;
4'b0000: z = b - 1;
4'b0000: z = a * b;
4'b0000: z = a && b;

4'b0000: z = a || b;
4'b0000: z = !a;
4'b0000: z = ~a;
4'b0000: z = a & b;
4'b0000: z = a | b;
4'b0000: z = a ^ b;

4'b0000: z = a << 1;
4'b0000: z = a >> 1;
4'b0000: z = a + 1;
4'b0000: z = a - 1;
4'b0000: z = b;
endcase
end
endmodule
