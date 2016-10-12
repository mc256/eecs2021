import me.masterchan.eecs2021.laba.Output;

public class LabA4 {

	public static void main(String[] args) {

		int x = Integer.parseInt(args[0]);
		System.out.println(Integer.toBinaryString(x));
		System.out.println(Integer.toBinaryString(x << 1));
		System.out.println(Integer.toBinaryString(x >>> 1));// ignore sign, no matter positive or negative
		System.out.println(Integer.toBinaryString(x >> 1));
		System.out.println(Integer.toBinaryString(x << 2));
		System.out.println(Integer.toBinaryString(x >> 2));
		System.out.println(Integer.toBinaryString(x >> 4));
		
		x = -23333;
		Output.outputBinary(Integer.toBinaryString(x));
		Output.outputBinary(Integer.toBinaryString(x << 1));
		Output.outputBinary(Integer.toBinaryString(x >>> 1));// ignore sign, no matter positive or negative
		Output.outputBinary(Integer.toBinaryString(x >> 1));
		Output.outputBinary(Integer.toBinaryString(x << 2));
		Output.outputBinary(Integer.toBinaryString(x >> 2));
		Output.outputBinary(Integer.toBinaryString(x >> 4));
		
	}

}
