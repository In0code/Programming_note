package day0704;

import java.text.DecimalFormat;
import static java.lang.Long.MAX_VALUE;

public class UseDecimalFormat {

	public UseDecimalFormat() {
		// JDK1.7 에서부터 숫자에 구분자를 사용할 수 있다 => 가독성 향상, 출력은 안됨
		int i = 2_147_483_647;
		System.out.println(i); // _는 출력되지 않는다
		i = 2023;
		// Letter 0 : 해당 자리에 데이터가 없으면 0을 채워서 반환
		DecimalFormat df = new DecimalFormat("0,000,000");
		System.out.println(df.format(i));
		// Letter # : 데이터가 있는 것 까지만 출력
		DecimalFormat df2 = new DecimalFormat("#,###,###");
		System.out.println(df2.format(i));

		// 실수의 자릿수 설정
		double d = 2023.1234;
		DecimalFormat df3 = new DecimalFormat("#,###,###.##"); // 섞어쓸 수 있는데 헷갈림
		System.out.println(df3.format(d));

//		i = MAX_VALUE;
		// MAX_VALUE는 9223372036854775807 을 가지고 있다
		// DecimalFormat 사용하여 3자리마다,를 넣어 출력하세요
		DecimalFormat df4 = new DecimalFormat("#,###");
		System.out.println(df4.format(MAX_VALUE));

	}// UseDecimalFormat

	public static void main(String[] args) {

		new UseDecimalFormat();

	}// main

}// class
