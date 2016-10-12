module yID(rd1, rd2, imm, jTarget, ins, wd, RegDst, RegWrite, clk);
output [31:0] rd1, rd2, imm;
output [25:0] jTarget;
input [31:0] ins, wd;
input RegDst, RegWrite, clk;
wire [4:0] rn1, rn2, rn3, wn
assign rn1 = ins[25:21];		//rs
assign rn2 = ins[20:16];		//rt
assign rn3 = ins[15:11];		//rd
assign jTarget = ins[25:0];
assign imm[15:0] = ins[15:0];	//signed number
yMux #(32) myMux(wn, rn2, rn3, RegDst);
rf myRF(rd1, rd2, rn1, rn2, wn, wd, clk, RegWrite);
yMux #(16) se(imm[31:16], 16'h0, 16'hffff, ins[15]);
endmodule
