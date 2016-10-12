module labM;
reg [31:0] memIn, address;
reg clk, memRead, memWrite;
wire [31:0] memOut;

//This sequential component is made up of many 32-bit words.
mem myMem(memOut, address, memIn, clk, memRead, memWrite);

initial
begin
	address = 32'h80;
	memWrite = 0;
	memRead = 1;
	
	repeat(11)
	begin
		#1;
		$display("addr=0x%h, clk=%b, r/w=%b/%b, IN=0x%h, OUT=0x%h", address, clk, memRead, memWrite, memIn, memOut);
		#1;
		address = address + 4;
	end
	
end
endmodule
