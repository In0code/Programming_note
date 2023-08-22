package day0703;

import java.util.StringTokenizer;

public class UseStringTokenizer {

	public UseStringTokenizer() {
		// 공백으로 토큰이 나눠지니깐, 총 토큰이 4개로 나뉨
		String data = "Java, Oracle.JDBC, HTML.CSS, JavaScript";
		// 토큰은 포인터가 지나갈때마다 줄어듬. 그것이 for를 못 쓰는 이유임.
//		StringTokenizer stk = new StringTokenizer(data); //공백으로 토큰 생성

		// 공백이 아니라 입력된 문자열로 토큰 생성 가능
		//토큰으로 구분된 문자열은 사라짐. 기준 문자열은 or 기능이 있음
//		StringTokenizer stk = new StringTokenizer(data, ".,a");
		
		//기준 문자열 보호 true - 기준 문자열 토큰으로 보호, false- 기준 문자열을 버림
		StringTokenizer stk = new StringTokenizer(data, "., a",false);
	
		System.out.println("토큰의 수 : " + stk.countTokens());
		// 포인터는 뒤로는 못 간다 앞으로만 간다

		// 토큰이 몇 개 인지 모르기때문에 while문을 쓴다
		String value = "";
		while (stk.hasMoreTokens()) { // 포인터가 잇는 위치에 토큰이 있다면
			value = stk.nextToken(); // 토큰을 얻고 다음 토큰으로 포인터를 이동
			System.out.println(value);
		}
		// 토큰은 포인터가 지나갈때마다 줄어든다. 다 뽑아 보면 토큰의 수 0
		System.out.println("토큰의 수 : " + stk.countTokens());

	}// UseStringTokenizer

	public static void main(String[] args) {
		new UseStringTokenizer();

	}// main

}// class
