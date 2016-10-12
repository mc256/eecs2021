import me.masterchan.eecs2021.laba.Output;

public class LabA5 {

	public static void main(String[] args) {

		////////TEST 1
		int x = Integer.parseInt(args[0]);
		Output.outputBinary(x,"<-- original");
		
		int z = x << 21;
		Output.outputBinary(z);
		
		z = z >>> 31;
		Output.outputBinary(z);
		
		
		
		/////////TEST 2
		int mask = 233333;
		Output.outputBinary(mask,"<-- the mask");
		
		int y = x & mask;
		Output.outputBinary(y,"<-- after mask");
		
		y = y >> 10;
		Output.outputBinary(y);

	}

}
