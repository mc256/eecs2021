module labK;
reg [31:0] x, y, z, k, i;
//Simillar to PASCAL style
//Block ONE
initial
begin
	#10
	x = 5;
	$display("%2d: x=%1d y=%1d z=%1d", $time, x, y, z);

	#10
	y = x + 1;
	$display("%2d: x=%1d y=%1d z=%1d", $time, x, y, z);

	#10000
	z = y + 1;
	$display("%2d: x=%1d y=%1d z=%1d", $time, x, y, z);
	$finish;
end


//Block TWO
initial
begin
	for (i = 0; i < 4; i++)
	begin
		#1
		$display("bios %2d: i=%1d", $time, i);
	end
	#100
	$display("dasdfasdfasdfasdf");

end

endmodule

