//Mux 1-bit
module yMux1(z, a, b, c);
output z;
input a, b, c;
wire notC, upper, lower;
not my_not(notC, c);
and upperAnd(upper, a, notC);
and lowerAnd(lower, c, b);
or my_or(z, upper, lower);
endmodule

//Adder 1-bit
module yAdder1(z, cout, a, b, cin);
output z, cout;
input a, b, cin;
xor (p1, a, b);
xor (z, p1, cin);
and (p2, a, b);
and (p3, cin, p1);
or (cout, p3, p2);
endmodule

module yAlu1(result, cout, set, a, b, ainvert, binvert, cin, less, op);
output result, cout, set;
input a, b, ainvert, binvert, cin, less;
input [1:0] op;
wire notA, notB, resA, resB, resultAnd, resultOr, resultAdd, lowR, hiR;
not (notA, a);
not (notB, b);
yMux1 amux(resA, a, notA, ainvert);
yMux1 bmux(resB, b, notB, binvert);
and (resultAnd, resA, resB);
or (resultOr, resA, resB);
yAdder1 adder(resultAdd, cout, resA, resB, cin);
yMux1 m1(lowR, resultAnd, resultOr, op[0]);
yMux1 m2(hiR, resultAdd, less, op[0]);
yMux1 m3(result, lowR, hiR, op[1]);
assign set = resultAdd;
endmodule

module Alu32(result, exp, a, b, op);
output [31:0] result;
output exp;

input [31:0] a, b;
input [3:0] op;

wire [31:0] cout, cin, less, set;
wire [1:0] opA;
wire ainvert, binvert;

assign ainvert = op[3];
assign binvert = op[2];
assign opA[1:0] = op[1:0];

assign cin[0] = op[3];	//warning, substract should be minus
assign cin[31:1] = cout[30:0];
assign exp = cout[31];
assign less[0] = set[31];
assign less[31:1] = 1'b0;


yAlu1 master[31:0](result, cout, set, a, b, ainvert, binvert, cin, less, opA);


endmodule























