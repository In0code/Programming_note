package day0630;

/**
 * local class (지역클래스)
 * 
 * @author user
 *
 */
public class LocalOutter {

	int out_i;

	public LocalOutter() {
		System.out.println("외부 클래스의 생성자");
	}// LocalOutter

	public void method(final int paramI, int paramJ) {
		final int loc_i = 0;
		int loc_j = 0; // 지역변수는 안에서만 쓰는 거기 때문에 public을 붙일 수 없다

		//////////////////////// 지역클래스시작/////////////////////////////////
		class Inner {
			int in_i;

			public Inner() {
				System.out.println("로컬 클래스의 생성자");
			}// Inner

			public void inMethod() {
				System.out.println("Local class의 inner " + in_i);
				out_i = 12; // 외부클래스의 instance 변수는 얼마든지 쓸 수 있음
				System.out.println("외부클래스의 instance 변수 " + out_i);
				// 내부클래스에서는 final이 있는 지역변수만 사용할 수 있다.
//				paramI=10;  //final은 값할당 불가
//				paramJ=20; // JDK1.8부터 final이 없지만 final이 있는 효과가 있다
				System.out.println("매개변수 paramI : " + paramI + ", paramJ : " + paramJ);
				System.out.println("지역변수 loc_i : " + loc_i + ", loc_j : " + loc_j);
			}// inMethod
			
		}// class

		//////////////////////// 지역클래스끝/////////////////////////////////
		Inner in = new Inner();
		in.inMethod();
	}// method

	public static void main(String[] args) {
		LocalOutter lo = new LocalOutter();
		lo.method(2023, 6);

	}// main

}// class
