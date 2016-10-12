module labL;

//integer signed expect;
reg signed [31:0] a, b;
reg [2:0] op;
reg flag;

wire ex;
wire signed [31:0] z;

yAlu32 fun(z, ex, a, b, op);

initial
begin
		
	flag = $value$plusargs("op=%d", op);
	$display("OPC = %b", op);

	repeat(10)
	begin
		a = $random % 100;
		b = $random % 100;
		//cin = $random % 2;

		#1;
		$display("RESULT: a=%b %d b=%b %d =>  z=%b %d", a,a, b,b, z,z);

	end	
	$finish;

end
endmodule
