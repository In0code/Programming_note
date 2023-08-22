package day0706;

public class UseWork0704 {

	public void printCalendar() {
		System.out.println(new Work0704().calendar());

	}

	public void printYearMonth(int year, int month) {
		String[][] print = new Work0704().yearMonth(year, month);

		for (int i = 0; i < print.length; i++) {
			for (int j = 0; j < print[i].length; j++) {
				System.out.print(print[i][j] + " ");
			}
			System.out.println();
		} // end for

	}// end printYearMonth

	public static void main(String[] args) {
		UseWork0704 uw = new UseWork0704();
		uw.printCalendar();
		System.out.println("----------------------");
		uw.printYearMonth(2023, 2);

	}//main

}//class
