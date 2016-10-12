module labK;

reg a, b, c;
wire p1, p2, p3, p4, p5, p6, p7;
integer i, j, k;
reg[1:0] expect;

output [0:0] cout,z;

xor (p1, a, b);
xor (z, p1, c);
and (p2, a, b);
and (p3, c, p1);
or (cout, p3, p2);

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
				expect[1] = ((a ^ b) & c) | (a & b);	//c out
				expect[0] = ((a ^ b) ^ c);				//z
				#1	
				if (expect[0] === z && expect[1] === cout)
				begin
					$display("PASS: a=%b b=%b c=%b 		cout=%b z=%b -->%b", a, b, c, cout, z, expect);				
				end
				else
				begin
					$display("FAIL: a=%b b=%b c=%b 		cout=%b z=%b -->%b", a, b, c, cout, z, expect);
				end
			end
		end
	end
	$finish;

end
endmodule
