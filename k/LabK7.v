module labK;

reg a, b, c, flagA, flagB, flagC;
wire p1, p2, p3, p4, p5, p6, p7;
integer i, j, k, expect;

not (p1, c);
and (p4, p3, a);
and (p5, c, b);
or (z, p6, p7);

assign p3 = p1;
assign p6 = p4;
assign p7 = p5;

initial
begin
	//Get value from user input
	flagA = $value$plusargs("a=%b", a);	//if no input we will get 0 in flag
	flagB = $value$plusargs("b=%b", b);
	flagC = $value$plusargs("c=%b", c);

	if (flagA === 0)
	begin
		$display("value A missing");
	end

	if (flagB === 0)
	begin
		$display("value B missing");
	end

	if (flagC === 0)
	begin
		$display("value B missing");
	end

	if (flagA === 0 | flagB === 0 | flagC === 0)	
	begin
		$finish;
	end


	expect = (a & (~ c)) | (c & b);
				
	#1	
	if (expect === z)
	begin
		$display("PASS: a=%b b=%b c=%b z=%b", a, b, c, z);				
	end
	else
	begin
		$display("FAIL: a=%b b=%b c=%b z=%b", a, b, c, z);
	end

	$finish;

end
endmodule
