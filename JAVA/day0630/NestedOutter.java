package day0630;

/**
 * nested class (중첩클래스) <br>
 * 
 * @author user
 *
 */
public class NestedOutter {

	int out_i;
	static int out_j;

	public void outInstanceMethod() {
		System.out.println("외부 클래스의 instance method");
	}// outInstanceMethod

	public static void outStaticMethod() {
		System.out.println("외부 클래스의 static method");
	}// outStaticMethod

	///////////////////// static class 시작//////////////////////////////////
	// nested class는 안쪽을 static으로 만든다.
	static class Inner { // static을 붙였다고 영역이 바뀌진 않음. 그냥 중첩 클래스라고 표시 해주는 것임
		static int in_i;

		public static void inMethod() {
			//외부 클래스의 instance 영역은 직접 접근할 수 없다.
//			outInstanceMethod();
			//내부 클래스는 외부 클래스의 static 변수나 method는 직접 접근이 가능하다.
			//클래스명 없이도 쓸 수 있음. 
			outStaticMethod();
			
			System.out.println("내부클래스의 static method");
		}// inMethod

	}// class
	///////////////////// static class 끝//////////////////////////////////

	public static void main(String[] args) {
		// static 영역은 객체화하지 않고 사용.
		Inner.in_i=100;  
		Inner.inMethod();
		
		
	}// main

}// class
