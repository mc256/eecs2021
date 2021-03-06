module labL;

//integer signed expect;
reg signed [31:0] expect;
reg signed [31:0] a, b;// signed
reg cin;

output signed [31:0] z;
output cout;

yAdder32 funny(z, cout, a, b, cin);

initial
begin
		
	repeat(20)
	begin
		a = $random % 100;
		b = $random % 100;
		cin = 0;
		expect = a + b;
		#1;
		if (expect === z)
		begin
			$display("PASS: a=%d b=%d c=%b z=%d", a, b, cout, z);
		end
		else
		begin
			$display("FAIL: a=%d b=%d c=%b z=%d", a, b, cout, z);
		end	
	end	
	$finish;

end
endmodule
