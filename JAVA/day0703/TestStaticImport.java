package day0703;

import static java.lang.Integer.MAX_VALUE;
//import static java.lang.Long.MAX_VALUE; //⇒ 같은 이름의 상수나 변수는 하나만  선언 할 수 있다.

import static java.lang.Integer.parseInt;

/**
 * static import : 다른 클래스의 static 변수, 상수, static method를 클래스명 없이 <br>
 * 바로 사용할 때.
 * 
 * @author user
 *
 */
public class TestStaticImport {

	public static void main(String[] args) {
		System.out.println(MAX_VALUE); // 클래스명 없이 constant 사용
		// 위에 import로 Integer.parseInt를 걸어놓으면 클래스명 없이 써도 되서 편해진다.
		System.out.println(parseInt("10")); // class명 없이 method사용
		System.out.println(parseInt("20"));
		System.out.println(parseInt("30"));
		System.out.println(parseInt("40"));

	}// main

}// class
