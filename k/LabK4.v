module labK;
reg a, b;//default is Boolean
wire notOutput, lowerInput;
integer i,j;

not my_not(notOutput, b);
and my_and(z, a, lowerInput);
assign lowerInput = notOutput;

initial
begin
	for (i = 0; i < 2; i ++)
	begin
		for (j = 0; j < 2; j ++)
		begin
			a = i;
			b = j;
			//#1
			$display("a=%b b=%b z=%b", a, b, z);
		end
	end
//	#1
	$finish;

end
endmodule
