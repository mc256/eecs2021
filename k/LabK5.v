module labK;
reg a, b, expect;//default is Boolean
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
			expect = i & ~b;
			#1//;	
			if (expect === z)
			begin
				$display("PASS: a=%b b=%b z=%b", a, b, z);				
			end
			else
			begin
				$display("FAIL: a=%b b=%b z=%b", a, b, z);
			end
		end
	end
	$finish;

end
endmodule
