module labM;
reg [31:0] d;
reg clk, enable, flag;
wire [31:0] z;

register #(32) master(z, d, clk, enable);

initial
begin
	enable = 1;
	clk = 1;
	repeat (20)
	begin
		#2;
		d = $random;
	end
	$finish; 
end

always
begin
	#5;
	clk = ~ clk;
	//if change to true, will store in memory
	//announce that I have finished reading data, I just need to keep the data
end

always
begin
	#24;
	enable = 0;//Read only lock
end


initial
begin
	$monitor("%5d => enable=%b, clk=%b, d=%d, z=%d", $time, enable, clk, d, z);
end

endmodule
