package day0621;

/**
 * 생성자에서 다른 생성자를 호출할 때 사용하는 this  <br>
 * -생성자의 첫 번째 줄에서만 사용할 수 있다.
 * @author user
 *
 */
public class TestThisConstructor {
	
	public TestThisConstructor() {
//		this(2,3);   //error. 프로그램이 끝날 수 없음. 재귀호출에 대한 문제가 발생했기 때문에
		
		System.out.println("기본생성자");
	}//TestThisConstructor
	
	public TestThisConstructor(int i) {
		System.out.println("i를 받는 생성자");
	}//TestThisConstructor
	
	//매개 변수 두 개인 생성자는 기본생성자가 먼저 일을 한 후 그 다음으로 일을 해야한다.
	public TestThisConstructor(int i, int j) {
		this();
//		new TestThisConstructor();
		System.out.println("i와 j를 받는 생성자");
		
	}//TestThisConstructor
	
	public static void main(String[] args) {
		
		new TestThisConstructor(3,5);
		
	}

}
