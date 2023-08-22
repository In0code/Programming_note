package day0629;

/**
 * Inner class : 안쪽 클래스를 인스턴스 변수처럼 사용할 때 <br>
 * 
 * @author user
 *
 */
public class Outter {

	int out_i;

	public Outter() {
		System.out.println("외부 클래스의 생성자");
	}// Outter

	public void outMethod() {
		System.out.println("바깥 클래스의 method");
		// 바깥 클래스에서는 내부클래스의 자원을 직접 접근할 수 없다.
//		in_i=100;
//		inMethod();

		// 안쪽클래스를 객체화
		// 바깥클래스명.안쪽클래스명 객체명=바깥클래스의 객체명.new 안쪽클래스의 생성자();
		// 세 개 다 됨. this가 어디든지 다 숨어있음
		Outter.Inner in = this.new Inner();
//		Inner in=this.new Inner();   // 바깥클래스명 생략  
//		Inner in=new Inner();    // this 생략
		in.in_i = 100; // 안쪽클래스의 자원 사용가능
		in.inMethod();
		// 엄마는 애기꺼 쓸려면 허락맞고 써야 함.

	}// outMethod

	///////////////// inner class 시작//////////////////////////////////
	public class Inner {
		int in_i;

		public Inner() {
			System.out.println("내부클래스의 생성자");
		}// Inner

		public void inMethod() {
			System.out.println("내부클래스의 method");
			// 애기는 엄마의 자원을 마음대로 가져다가 쓸 수 있다.
			// 외부 클래스의 변수나 method는 직접 접근이 가능
			// 상속도 아닌데 내 것처럼 쓸 수 있음
			out_i = 100;
//			outMethod();    // 쓸 수 있음.

		}// inMethod
	}// class

	///////////////// inner class 끝//////////////////////////////////
	public static void main(String[] args) {
		// 1.외부클래스를 객체화
		Outter out = new Outter();
		out.outMethod();
		// 2. 내부클래스의 객체화
//		Outter.Inner in=out.new Inner();

	}// main

}// class
