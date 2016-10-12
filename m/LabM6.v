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
		if (memOut[31:26] == 0)
		begin
			//R-type
			$display("[0x%h]R %d %d %d %d %d %d", address, memOut[31:26], memOut[25:21], memOut[20:16], memOut[15:11], memOut[10:6], memOut[5:0]);
		end
		else if(memOut[31:26] == 2)
		begin
			//J-type
			$display("[0x%h]J %d %d", address, memOut[31:26], memOut[25:0]);
		end
		else
		begin
			//I-type
			$display("[0x%h]I %d %d %d %d", address, memOut[31:26], memOut[25:21], memOut[20:16], memOut[15:0]);
		end
		#1;
		address = address + 4;
	end
	
end
endmodule
