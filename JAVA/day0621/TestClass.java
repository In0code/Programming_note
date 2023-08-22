package day0621;

/**
 * 클래스가 실행되면 static 영역이 가장 처음 로드(적재)된다.
 * @author user
 *
 */
public class TestClass {
	static int i;
	int j;  //인스턴스 변수(member 변수) 는 객체화 후 메모리에 생성
	int k;
	
	public static void main(String[] args) {
		i=10;
		System.out.println(i);
//		j=10;
		//인스턴스 변수를 사용할려면 객체화를 한 후 사용해야한다.
		//class : 참조형 데이터형 : 값은 메모리의 다른 곳에 저장되고 그 시작주소를 가진다
		
		TestClass tc=new TestClass();
		TestClass tc2=new TestClass();
		//클래스명 객체명 = new 생성자();
		
		System.out.println(tc);
		System.out.println(tc2);
		System.out.println(args);
		
	}//main

}//class
