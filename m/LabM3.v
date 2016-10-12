module labM;
reg clk, w;
reg [4:0] rn1, rn2, wn;
reg [31:0] wd;
wire [31:0] rd1, rd2;

integer flag, i;

// It allows us to read any two registers in it in parallel and to write to any one register. 
rf myRF(rd1, rd2, rn1, rn2, wn, wd, clk, w);

initial
begin
	//save (wd) to (wn), accepting data(clk)
	#1;
	w = 1'b1;
	wd = 32'b00101110101001111010101111011101;
	wn = 5'b00001;
	clk = 1'b0;
	$display("rd=%d %d rn=%d %d wn=%d wd=%d clk=%b w=%b", rd1, rd2, rn1, rn2, wn, wd, clk, w);

	//stop accepting data(clk)
	#1;
	clk = 1'b1;	
	$display("rd=%d %d rn=%d %d wn=%d wd=%d clk=%b w=%b", rd1, rd2, rn1, rn2, wn, wd, clk, w);
	


	//----------SAME HERE
	#1;
	w = 1'b1;
	wd = 32'b00101110101001111010101111011111;
	wn = 5'b00010;
	clk = 1'b0;
	$display("rd=%d %d rn=%d %d wn=%d wd=%d clk=%b w=%b", rd1, rd2, rn1, rn2, wn, wd, clk, w);

	#1;
	clk = 1'b1;	
	$display("rd=%d %d rn=%d %d wn=%d wd=%d clk=%b w=%b", rd1, rd2, rn1, rn2, wn, wd, clk, w);




	//Read from (rn1) and (rn2)
	#1;
	rn1 = 5'b00001;
	rn2 = 5'b00010;
	$display("rd=%d %d rn=%d %d wn=%d wd=%d clk=%b w=%b", rd1, rd2, rn1, rn2, wn, wd, clk, w);
	
	#1;
	$display("rd=%d %d rn=%d %d wn=%d wd=%d clk=%b w=%b", rd1, rd2, rn1, rn2, wn, wd, clk, w);

	#10
	$display("=======================================");

	
	w = 1'b1;
	for (i = 0; i < 32; i = i + 1)
	begin
 		clk = 0;
		wd = i * i;
		wn = i;
		clk = 1;
		#1;
		$display("rd=%d %d rn=%d %d wn=%d wd=%d clk=%b w=%b", rd1, rd2, rn1, rn2, wn, wd, clk, w);
	end
 
	#1;
	$display("=======================================");
	w = 0;
	repeat(10)
	begin
		rn1 = $random % 32;
		rn2 = $random % 32;
		#1;
		$display("rd=%d %d rn=%d %d wn=%d wd=%d clk=%b w=%b", rd1, rd2, rn1, rn2, wn, wd, clk, w);
	end


end
endmodule
