module yMux(z, a, b, c);
output [1:0] z;
input [1:0] a, b;
input c;

yMux1 funny0[1:0](z, a, b, c);
//return [1:0] z a b ,whereas(Ran2E2) as declared as a single bit but replicated

endmodule
