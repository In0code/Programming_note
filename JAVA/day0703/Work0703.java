package day0703;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.StringTokenizer;

public class Work0703 {

	public Work0703() {
	}

	/**
	 * 1.아래의 CSV데이터를 매개변수로 입력받아 배열로 반환하는 일을 하는 method를 작성하세요 String csvData=“강다연,김다영
	 * 김선경.김인영,김주민~박상준,박서현,서효민”;
	 * 
	 * 김씨는 성을 제외하고 이름만 배열에 넣어서 반환할 것.
	 * 
	 */
	public String printNameData(String csvData) {
		
		StringTokenizer st = new StringTokenizer(csvData, ",.~김 ");

		String name = "";
		while (st.hasMoreTokens()) {
			name = st.nextToken();
			System.out.print(name + " ");
		} // end while
		System.out.println();
		return name;
	}// printNameData

	/**
	 * 2. 날짜 0,1,2,3을 입력받는 method 만들고 문자열로 날짜를 반환하는 method작성하세요. 반환되는 형식은 아래와 같습니다.
	 * “년-월-일 시:분:초 오전|오후 요일”
	 * 
	 * 입력되는 0,1,2,3은 아래의 국가의 날짜로 설정되어야합니다. 0-한국, 1-미국, 2-일본, 3-캐나다
	 * 
	 * 0,1,2,3이 아니라면 0으로 설정할 것.
	 * 
	 */
	public static final int KOREA = 0;
	public static final int USA = 1;
	public static final int JAPAN = 2;
	public static final int CANADA = 3;
	public static final String PATTERN = "yyyy-MM-dd  hh:mm:ss  a  EEEE";

	public void printDay(int national) {
		Date date = new Date();
		SimpleDateFormat korea = new SimpleDateFormat(PATTERN, Locale.KOREAN);
		SimpleDateFormat usa = new SimpleDateFormat(PATTERN, Locale.US);
		SimpleDateFormat japan = new SimpleDateFormat(PATTERN, Locale.JAPAN);
		SimpleDateFormat canada = new SimpleDateFormat(PATTERN, Locale.CANADA);
		String format = null;

		switch (national) {
		case KOREA:
			format = korea.format(date); break;
		case USA:
			format = usa.format(date);	break;
		case JAPAN:
			format = japan.format(date); break;
		case CANADA:
			format = canada.format(date); break;
		default:
			format = korea.format(date);
		}// switch
		System.out.println(format);
	}// Day

	public static void main(String[] args) {

		Work0703 w = new Work0703();
		String csvData = "강다연,김다영 김선경.김인영,김주민~박상준,박서현,서효민";
		w.printNameData(csvData);
		System.out.println("-------------------------");
		w.printDay(2);

	}// main
}// class