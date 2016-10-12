module labM;
reg [31:0] memIn, address;
reg clk, memRead, memWrite;
wire [31:0] memOut;

//This sequential component is made up of many 32-bit words.
mem myMem(memOut, address, memIn, clk, memRead, memWrite);

initial
begin
	//Write something
	#1;
	address = 32'h8;
	clk = 1'b0;
	memWrite = 1'b1;
	memIn = 32'h12345678;
	$display("addr=0x%h, clk=%b, r/w=%b/%b, IN=0x%h, OUT=0x%h", address, clk, memRead, memWrite, memIn, memOut);

	#1;
	clk = 1'b1;
	$display("addr=0x%h, clk=%b, r/w=%b/%b, IN=0x%h, OUT=0x%h", address, clk, memRead, memWrite, memIn, memOut);

	//Read something
	#1;
	address = 32'h8;
	memRead = 1'b1;
	$display("addr=0x%h, clk=%b, r/w=%b/%b, IN=0x%h, OUT=0x%h", address, clk, memRead, memWrite, memIn, memOut);

	#1;
	$display("addr=0x%h, clk=%b, r/w=%b/%b, IN=0x%h, OUT=0x%h", address, clk, memRead, memWrite, memIn, memOut);
	
end
endmodule
