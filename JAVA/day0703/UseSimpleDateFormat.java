package day0703;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Date 객체를 입력받아 원하는 날짜형식으로 반환하는 SimpleDateFormat의 사용
 * 
 * @author user
 *
 */
public class UseSimpleDateFormat {
	public UseSimpleDateFormat() {

		Date date = new Date();
		System.out.println(date);
// 원하지 않는 날짜 형식 출력 => Date클래스의 method는 비추천 => SimpleDateFormat
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyy , a HH(hh,KK,kk) : mm : ss EEEE");
		// Date와 SimpleDateFormat은 has a 관계
		String value = sdf.format(date);
		System.out.println(value);

		//다른 나라의 날짜 형식
		SimpleDateFormat sdf2 = 
				new SimpleDateFormat("MM-dd-yyy , a HH(hh,KK,kk) : mm : ss EEEE E",
						Locale.US);
		String value2 = sdf2.format(date);
		System.out.println(value2);

	}// UseSimpleDateFormat

	public static void main(String[] args) {
		new UseSimpleDateFormat();

	}// main

}// class
