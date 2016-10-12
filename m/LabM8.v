module labM;
reg [31:0] PCin;
reg RegDst, RegWrite, clk, ALUSrc;
reg [2:0] op;

wire [31:0] wd, rd1, rd2, imm, ins, PCp4, z;
wire [25:0] jTarget;
wire zero;

yIF myIF(ins, PCp4, PCin, clk);
yID myID(rd1, rd2, imm, jTarget, ins, wd, RegDst, RegWrite, clk);
yEX myEX(z, zero, rd1, rd2, imm, op, ALUSrc);
assign wd = z;

initial
begin
	PCin = 32'h80;
	repeat(11)
	begin
		//Fetch an instruction
		#1;
		clk = 1'b1;
	
		//Set Control Signals
		#1;
		op = 3'b010;
		if (ins[31:26] == 0)
		begin
			//R-type
			RegDst = 1;
			RegWrite = 1;
			ALUSrc = 0;
		end
		else if(ins[31:26] == 2)
		begin
			//J-type
			RegDst = 0;
			RegWrite = 0;
			ALUSrc = 1;
		end
		else if (ins[31:26] == 6'h4)	//beq
		begin
			RegDst = 0;
			RegWrite = 0;
			ALUSrc = 0;
		end
		else
		begin
			//I-type
			RegDst = 0;
			RegWrite = 1;
			ALUSrc = 1;
		end


		//Execute this insturction
		#1;
		clk = 1'b0;

		//View Results
		#1;
		$display("[0x%h]rd1=%d rd2=%d imm=%h jTarget=%h z=%d zero=%h", PCin, rd1, rd2, imm, jTarget, z, zero);

		//Next
		#1;
		PCin = PCp4;
	end
	
end
endmodule
