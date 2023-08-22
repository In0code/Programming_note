package day0616;

/**
 * instance variable이나 static variable는 선언하면 기본값을 가진다.
 * @author user
 *
 */
public class TestDefaultValue {
	////기본형 데이터형
	int a;  // 0
	char b; // \u0000  -unicode 0
	double c; // 0.0
	boolean d; // false
	
	////참조형 데이터형
	TestDefaultValue tdv;  // class - null
	String s;  // null
	int[] arr; // array - null
	
	public static void main(String[] args) {
		//객체생성 ) instance variable이 생성된다. 초기값을 가진다.
		TestDefaultValue test= new TestDefaultValue();
		System.out.println("정수형 : "+ test.a);    // 0
		System.out.println("문자형 : "+ test.b);    // \u0000 - 이unicode에 대응되는 문자가 없으므로 공백이 나온다.
		System.out.println("실수형 : "+ test.c);   // 0.0
		System.out.println("블린형 : "+ test.d);  // false
		
		System.out.println("참조형 - 클래스 : "+ test.tdv);  // null
		System.out.println("참조형 - String : "+ test.s);  // null
		System.out.println("참조형 - array : "+ test.arr); // null

		
		
	}//main

}//class
