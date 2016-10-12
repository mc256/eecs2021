public class LabA3 {

	public static void main(String[] args) {
		int x = Integer.parseInt(args[0]);
		int y = Integer.parseInt(args[1]);
		
		System.out.printf("x:%5d - %s\ny:%5d - %s\n", x, Integer.toBinaryString(x), y, Integer.toBinaryString(y));
		System.out.printf("x & y = %5d %s\n", x & y, Integer.toBinaryString(x & y));
		System.out.printf("x | y = %5d %s\n", x | y, Integer.toBinaryString(x | y));
		System.out.printf("x ^ y = %5d %s\n", x ^ y, Integer.toBinaryString(x ^ y));
		System.out.printf("~x    = %5d %s\n", ~x, Integer.toBinaryString(~x));
		
	}

}
