package day0704;

import java.util.Calendar;

public class Work0704 {

	public void JulyCalendar() {
		Calendar cal = Calendar.getInstance();

		cal.set(Calendar.MONTH, 6);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		System.out.println(" " + (cal.get(Calendar.MONTH) + 1) + "월");
		System.out.println(" 일 월  화 수 목  금  토 ");
		int firstDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		for (int i = 1; i < firstDayOfWeek; i++) {
			System.out.print("   ");
		}

		int daysInMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		for (int day = 1; day <= daysInMonth; day++) {
			System.out.printf("%2d ", day);

			if ((firstDayOfWeek + day - 1) % 7 == 0) {
				System.out.println();
			} // end if
		} // end for
		System.out.println();
	}// Calendar

	public String[][] selectCalendar(int year, int month) {
		Calendar cal2 = Calendar.getInstance();
//      String[][] selectCalendar = new String[cal2.getActualMaximum(Calendar.WEEK_OF_MONTH)][cal2.getActualMaximum(Calendar.DAY_OF_WEEK)];
//      selectCalendar = new String[6][7];

//      selectCalendar[];
		System.out.println(" " + month + "월");
		System.out.println(" 일 월  화 수 목  금  토 ");
		cal2.set(Calendar.MONTH, month - 1);
		cal2.set(Calendar.DAY_OF_MONTH, 1);
		cal2.set(Calendar.YEAR, year);
		int firstDayOfWeek = cal2.get(Calendar.DAY_OF_WEEK);
		for (int i = 1; i < firstDayOfWeek; i++) {
			System.out.print("   ");
		}

		int daysInMonth = cal2.getActualMaximum(Calendar.DAY_OF_MONTH);
		for (int day = 1; day <= daysInMonth; day++) {
			System.out.printf("%2d ", day);

			if ((firstDayOfWeek + day - 1) % 7 == 0) {
				System.out.println();
			} // end if
		} // end for

		return null;
	}

	public static void main(String[] args) {
		Work0704 w = new Work0704();
		w.JulyCalendar();
		System.out.println("--------------------");
		w.selectCalendar(2023, 10);

	}// main

}// class