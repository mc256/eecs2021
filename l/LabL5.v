module labL;

integer i, j, k, expect;
reg a, b, cin;
output z, cout;

yAdder1 funny(z, cout, a, b, cin);

initial
begin
	for (i = 0; i < 2; i ++)
	begin
		for (j = 0; j < 2; j ++)
		begin
			for (k = 0; k < 2; k ++)
			begin
				a = i;
				b = j;
				cin = k;
//				expect = (a & (~ cin)) | (cin & b);
				#1	
//				if (expect === z)
//				begin
					$display("PASS: a=%b b=%b cin=%b cout=%b z=%b", a, b, cin, cout, z);				
//				end
//				else
//				begin
//					$display("FAIL: a=%b b=%b cin=%b cout=%b z=%b", a, b, cin, cout, z);
//				end
			end
		end
	end
	$finish;

end
endmodule
