module labK;

reg [32:0] x;
reg [64:0] y;
reg [0:0] one;
reg [3:0] two;
reg [50:0] three;

initial
begin

	$display("time = %5d, x = %b", $time, x);	x = 32'hffff0000;	//32bit input Hexa
	$display("time = %5d, x = %b", $time, x);
	x = x + 2;
	$display("time = %5d, x = %b", $time, x);

	$display("time = %5d, y = %b", $time, y);	y = 16'd11;	//16bit input Decimal
	$display("time = %5d, y = %b", $time, y);
	y = y + 2;
	$display("time = %5d, y = %b", $time, y);


	one = 0; // and reduction
	two = ~ y[3:0]; // part-select
	three = {one, two, x}; // concatenate


	$display("time = %5d, 1 = %b", $time, one);	$display("time = %5d, 2 = %b", $time, two);
	$display("time = %5d, 3 = %b", $time, three);

	$finish;

end
endmodule
