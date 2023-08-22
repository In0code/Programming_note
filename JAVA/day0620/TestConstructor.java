package day0620;

/**
 * 생성자 연습<br>
 * -객체가 생성될 때 기본적으로 가지고 있어야할 값이나 코드를 정의하는 method의 일종<br>
 * -개발자가 생성자를 하나도 정의하지 않으면 컴파일러가 기본 생성자를 생성해준다 <br>
 * -생성자는 new(객체생성용 키워드)에 의해서만 호출된다.<br>
 * -생성자는 overload가 된다.
 * @author user
 *
 */
public class TestConstructor {

	public TestConstructor() {
		System.out.println("기본생성자");
	}
	
	/**
	 * 생성자의 Overload
	 * @param i
	 */
	public TestConstructor(int i) {
		System.out.println("매개변수 있는 생성자");
		test();  //method는 같은 영역에서 직접 호출 가능
		//TestConstructor();  //생성자는 직접 호출 되지 않는다. 생성자는 new를 붙여서 불러야한다. 
	}//TestConstructor
	
	public void test() {
		System.out.println("test method");
	}//test
	
	public static void main(String[] args) {
		//객체화 : 참조형 데이터형을 사용하기 위해 하는 것.
		//문법 ) 클래스명 객체명=new 생성자
		TestConstructor tc=new TestConstructor();  //기본생성자를 사용한 객체화
		TestConstructor tc2=new TestConstructor(2023);  //매개변수 있는 생성자를 사용한 객체화
		
		
	}//main
}//class
