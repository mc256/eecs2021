module labK;
reg a, b;//default is Boolean
wire notOutput, lowerInput;

not my_not(notOutput, b);
and my_and(z, a, lowerInput);
assign lowerInput = notOutput;

initial
begin
	a = 1;
	b = 0;
	#1
	$display("a=%b b=%b z=%b", a, b, z);
	$finish;

end
endmodule
