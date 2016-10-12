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

	#10
	z = y + 1;
	$display("%2d: x=%1d y=%1d z=%1d", $time, x, y, z);
	$finish;
end


//Block TWO
always
begin
	#1
	x = x + 1;
	$write("==>", $time); //write dont return line

end

endmodule

