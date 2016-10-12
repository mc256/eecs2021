module Test8to1;
reg signed [31:0] a0, a1, a2, a3, a4, a5, a6, a7;
reg [2:0] c;
reg flag;
wire [31:0] z;
yMux8to1 #(32) master(z, a0, a1, a2, a3, a4, a5, a6, a7, c);
initial
begin
	flag = $value$plusargs("c=%d", c);
	a0 = $random % 100;
	a1 = $random % 100;
	a2 = $random % 100;
	a3 = $random % 100;
	a4 = $random % 100;
	a5 = $random % 100;
	a6 = $random % 100;
	a7 = $random % 100;
	#1;
	$display("a=%d %d %d %d %d %d %d %d ; z=%d", a0, a1, a2, a3, a4, a5, a6, a7, z);
	$finish; 
end
endmodule

module yMux8to1(z, a0, a1, a2, a3, a4, a5, a6, a7, c);
parameter SIZE = 2;
output [SIZE-1:0] z;
input [SIZE-1:0] a0, a1, a2, a3, a4, a5, a6, a7;
input [2:0] c;
wire [SIZE-1:0] rlo, rhi;
yMux4to1 #(SIZE) low(rlo, a0, a1, a2, a3, c[1:0]);
yMux4to1 #(SIZE) high(rhi, a4, a5, a6, a7, c[1:0]);
yMux #(SIZE) result(z, rlo, rhi, c[2]);
endmodule
