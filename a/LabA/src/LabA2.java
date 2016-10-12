import me.masterchan.eecs2021.laba.Output;

public class LabA2 {

	public static void main(String[] args) {
		int x = Integer.parseInt(args[0]);
		//Integer.parseInt(s, radix);
		//Integer.decode();
		
		x = -231;
		Output.outputHex(Integer.toHexString(x));
		Output.outputHex(Integer.toHexString(Integer.reverse(x)));//reverse by 1 binary and append to 32 binary 
		Output.outputHex(Integer.toHexString(Integer.reverseBytes(x)));//reverse by 8 binary and append to 32 binary
		
		Output.outputBinary(Integer.toBinaryString(x));
		Output.outputBinary(Integer.toBinaryString(Integer.reverse(x)));
		Output.outputBinary(Integer.toBinaryString(Integer.reverseBytes(x)));
		Output.outputBinary(Integer.toBinaryString(Integer.reverseBytes(x) >>> 3));	//Logical right shift 
		Output.outputBinary(Integer.toBinaryString(Integer.reverseBytes(x) >> 3));	//Mathematical right shift 
		Output.outputBinary(Integer.toBinaryString(Integer.reverseBytes(x) << 3));	//Left shift
		

		System.out.printf("%d\n", x);
		System.out.printf("%d\n", Integer.reverse(x));
		System.out.printf("%d\n", Integer.reverseBytes(x));
		
		int result = 0;
		for (int k = 1; k <= 8; k++) {
			result = result << 4;
			result = result + (x & 15);
			x = x >>> 4;
		}
		
		Output.outputHex(Integer.toHexString(result));
		
		int test = Integer.reverse(1);
		System.out.printf("%d\n", test);
	}
	

}
