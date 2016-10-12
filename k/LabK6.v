module labK;

reg a, b, c;
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
	for (i = 0; i < 2; i ++)
	begin
		for (j = 0; j < 2; j ++)
		begin
			for (k = 0; k < 2; k ++)
			begin
				a = i;
				b = j;
				c = k;
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
			end
		end
	end
	$finish;

end
endmodule
