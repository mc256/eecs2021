module htest;
reg  a, b, ainvert, binvert, cin, less;
reg [1:0] op;
wire result, cout, set;

yAlu1 master(result, cout, set, a, b, ainvert, binvert, cin, less, op);

initial
begin
	a=100;
	b=150;
	ainvert=1;
	binvert=0;
	cin=0;
	less=0;
	op=2'b;

	#1;
	$display("%d=>  result=%d, cout=%d, set=%d, a=%d, b=%d, ainvert=%d, binvert=%d, cin=%d, less=%d, op=%b", $time, result, cout, set, a, b, ainvert, binvert, cin, less, op);
	
	$finish;
end
endmodule
