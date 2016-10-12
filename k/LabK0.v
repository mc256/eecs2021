module labK;	//this is comment

reg [32:0] x,y;	//variables can be declare together

initial
begin

	$display($time, " %b", y);
	y = 0;
	$display($time, " %b", y);
	y = y + 2;
	$display($time, " %b", y);
	
	$display("%5d", $time, " %b", x);	
	$display("time = %5d, x = %b", $time, x);
	$display($time, "(%b)","====",1, "(%b)", y);
	$finish;

end
endmodule


module fulladder(S, Cout, A, B, C);
  output S, Cout;
  input A, B, C;		/* 1-bit full adder */

  assign S    = A ^ B ^ C;	/* We use the assign keyword */
  assign Cout = A&B | B&C | C&A;
endmodule

module adder4(S, Cout, A, B, C);
  output [3:0] S;		/* 4-bit adder using fulladder */
  output       Cout;
  input  [3:0] A, B;
  input        C;

  wire   [2:0] cw;		/* These are the carries between FAs */

  fulladder FA0(S[0], cw[0], A[0], B[0], C);
  fulladder FA1(S[1], cw[1], A[1], B[1], cw[0]);
  fulladder FA2(S[2], cw[2], A[2], B[2], cw[1]);
  fulladder FA3(S[3], Cout , A[3], B[3], cw[2]);
endmodule

module t_adder4;

  reg  [3:0] A, B;
  wire [3:0] S;
  wire       Cout;

  adder4 A4(S,Cout,A, B, 1'b0); /* We need only one instance */
/* with the cary in set to zero */

  initial
  begin
    A = 4'b0;
    B = 4'b0;
    repeat (7)
    begin
      #5 $display($time, " ", A, " ", B, " ", S, " ", Cout);
      A = A + 1;
      B = B + 2;
    end
    #5 $display($time, " ", A, " ", B, " ", S, " ", Cout);
    $finish;
  end
endmodule

/*


|)		and		&
|)o		nand	~&
))		or		|
))o		nor		~|
)))		xor		^
)))o	xnor	~^


$random



*/
