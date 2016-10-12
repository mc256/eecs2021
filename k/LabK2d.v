module labK;
reg [31:0] x, y, z, k, i;
//Simillar to PASCAL style
//Block ONE
initial
begin
	x = 0;
	y = 0;
	z = 0;

	#1
	#1
	#1

	#10
	x = 5;

	#10
	y = x + 1;

	#10
	z = y + 1;
	#1
	$finish;
end


initial
begin
	$monitor("%3d=> x=%1d y=%1d z=%1d", $time, x, y, z);
end


endmodule

