import me.masterchan.eecs2021.laba.Output;

public class LabA6 {

	public static void main(String[] args) {
		int x = Integer.parseInt(args[0]);

		int l10 = 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2;
		int l11 = l10 * 2;
		
		Output.outputBinary(x,"<-- original");
		Output.outputBinary(l10,"<-- position 10");
		Output.outputBinary(l11,"<-- position 11");
		
		int result = ((~l11) & (~10) & x) + l10;
		Output.outputBinary(result, "<==== RESULT");
		

	}

}
