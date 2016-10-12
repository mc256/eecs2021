module labM;
reg [31:0] PCin;
reg clk;
wire [31:0] ins, PCp4;

//This sequential component is made up of many 32-bit words.
yIF myIF(ins, PCp4, PCin, clk);

initial
begin
	PCin = 32'h80;
	repeat(11)
	begin
		#1;
		clk = 1'b1;
		#1;
		if (ins[31:26] == 0)
		begin
			//R-type
			$display("[0x%h]R %d %d %d %d %d %d", PCin, ins[31:26], ins[25:21], ins[20:16], ins[15:11], ins[10:6], ins[5:0]);
		end
		else if(ins[31:26] == 2)
		begin
			//J-type
			$display("[0x%h]J %d %d", PCin, ins[31:26], ins[25:0]);
		end
		else
		begin
			//I-type
			$display("[0x%h]I %d %d %d %d", PCin, ins[31:26], ins[25:21], ins[20:16], ins[15:0]);
		end
		#1;
		clk = 1'b0;
		#1;
		PCin = PCp4;
	end
	
end
endmodule
