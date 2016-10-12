package me.masterchan.eecs2021.laba;

public class Output {

	public static void outputHex(String hex) {
		String preZero = "";
		for (int i = 0; i < (8 - hex.length()); i++) {
			preZero = preZero + "0";
		}
		System.out.println("0x" + preZero + hex.toUpperCase());
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
