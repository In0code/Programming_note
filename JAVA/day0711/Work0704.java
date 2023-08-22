package day0711;

import java.util.Calendar;

public class Work0704 {
	private Calendar cal;

	public Work0704() {
		cal = Calendar.getInstance();
	}

	public StringBuilder calendar() {
		StringBuilder sb = new StringBuilder();
		int i = 1;

		for (int j = 0; j < cal.get(Calendar.DAY_OF_WEEK); j++) {
			sb.append("    ");
		} // end for
		while (i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH)) {
			cal.set(Calendar.DAY_OF_MONTH, i);

			sb.append(cal.get(Calendar.DAY_OF_MONTH)).append("   ");
			if (cal.get(Calendar.DAY_OF_WEEK) == 7) {
				sb.append("\n");
			} // end if
			i++;
		} // end while

		return sb;
	}// calendar

	// 2번
	public String[][] yearMonth(int year, int month) {
		cal.set(year, month - 1, 1);
		int day = 1;
		int temp = 0;
		temp = cal.getActualMaximum(Calendar.WEEK_OF_MONTH);
		String[][] calendar = new String[temp][cal.getActualMaximum(Calendar.DAY_OF_WEEK)];

		for (int i = 0; i < cal.getActualMaximum(Calendar.WEEK_OF_MONTH); i++) {
			for (int j = 0; j < 7; j++) {
				if (i == 0 && cal.get(Calendar.DAY_OF_WEEK) > j + 1) {
					calendar[i][j] = "  ";
				} else if (day > cal.getActualMaximum(Calendar.DAY_OF_MONTH)) {
					calendar[i][j] = " ";

				} else {
					calendar[i][j] = String.format("%2d", day);
					day++;

				} // end else
			} // end for
		} // end for
		return calendar;
	}// end yearMonth

}// class
