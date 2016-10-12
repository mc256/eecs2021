import me.masterchan.eecs2021.laba.Output;

public class LabA8 {

	public static void main(String[] args) {

		int x = Integer.parseInt(args[0]);
		Output.outputBinary(x);
		System.out.println(x);
		
		int z = 1 + ~x;
		Output.outputBinary(z);
		System.out.println(z);
	}

}

/*
 * 
 * package me.masterchan.eecs2021.laba;

public class Output {

	public static void outputHex(String hex) {
		System.out.println("0x"+hex.toUpperCase());
	}
	
	public static void outputBinary(int number) {
		outputBinary(number, "");
	}
	
	public static void outputBinary(int number, String comment) {
		outputBinary(Integer.toBinaryString(number),comment);
	}
	
	public static void outputBinary(String binary){
		outputBinary(binary,"");
	}
	
	public static void outputBinary(String binary, String comment) {
		String temp = binary;
		while (temp.length() < 32) {
			temp = "0" + temp;
		}
		String output = "";
		for (int i = 1; i <= 32; i++) {
			output = output + temp.charAt(i - 1);
			if (i % 8 == 0) {
				output = output + " ";
			}
		}
		System.out.printf("%s %s\n",output,comment);
	}
}

 * */