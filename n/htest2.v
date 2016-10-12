module htest;
reg [31:0]  a, b;
reg [3:0] op;
wire [31:0] result;
wire exp;

Alu32 master(result, exp, a, b, op);

initial
begin
	a=5;
	b=5;
	op=4'b0111;

	#1;
	$display("result=%b %d, exp=%b, a=%b %d, b=%b %d, op=%b", result, result, exp, a, a, b, b, op);
	
	$finish;
end
endmodule
