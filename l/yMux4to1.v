module yMux4to1(z, a0, a1, a2, a3, c);
parameter SIZE = 2;//similar to constant
output [SIZE-1:0] z;
input [SIZE-1:0] a0, a1, a2, a3;
input [1:0] c;
wire [SIZE-1:0] rlo, rhi;

yMuxN #(SIZE) low(rlo, a0, a1, c[0]);
yMuxN #(SIZE) high(rhi, a2, a3, c[0]);
yMuxN #(SIZE) result(z, rlo, rhi, c[1]);
//return [1:0] z a b ,whereas(Ran2E2) as declared as a single bit but replicated

endmodule
