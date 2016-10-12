module labL;


reg[31:0] a, b, expect;
reg c;
integer i,j,k;

wire [31:0] z;

defparam usagi.SIZE = 32;//Set the constant in the method
yMuxN usagi(z, a, b, c);

initial
begin
	repeat(500)
	begin
		a = $random;
		b = $random;
		c = $random % 2;
		expect = (c === 0)? a : b;
		#1
		if (expect === z)
		begin
			$display("PASS: a=%d b=%d c=%b z=%d", a, b, c, z);				
		end
		else
		begin
			$display("FAIL: a=%d b=%d c=%b z=%d", a, b, c, z);
		end
	end
	$finish;
end
endmodule

