import me.masterchan.eecs2021.laba.Output;

public class LabA7 {

	public static void main(String[] args) {
		//int x = Integer.parseInt(args[0]);
		int x = 1024;

		int l10 = 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2;
		int l20 = l10 * 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2;
		Output.outputBinary(x,"<-- original");
		Output.outputBinary(l10,"<-- position 10");
		Output.outputBinary(l20,"<-- position 20");
		
		int position10 = (x & l10) >>> 9;
		int position20 = (x & l20) >>> 19;
		Output.outputBinary(position10,"bit #10");
		Output.outputBinary(position20,"bit #20");
		
		int allmask = (~l10) & (~l20);
		Output.outputBinary(allmask,"<-- filter all");
		
		int result = (x & allmask) + (position10 << 19) + (position20 << 9);
		Output.outputBinary(result,"<== RESULT");

	}

}
