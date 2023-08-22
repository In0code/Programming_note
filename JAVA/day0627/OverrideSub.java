package day0627;

/**
 * 부모클래스에서 제공하는 method가 자식클래스에서 맞지 않으념 <br>
 * 부모 클래스의 method를 자식 클래스에서 변경하는 것. <br>
 * 
 * @author user
 *
 */
public class OverrideSub extends OverrideSuper {

	int subJ;

	@Override
	public void print() { // override를 하면 최우선적으로 자식의 method가 호출된다
		System.out.println("자식 subJ" + subJ);
	}// print

	public void test() {
		System.out.println("자식의 method");
	}// test

	// 접근지정자는 광의의 접근지정자로 변환가능 //광의: 접근이 원활한 쪽
	// default > protected > public 로 변환가능
	@Override
	public void overTest() {

	}

	public static void main(String[] args) {
		// is a 관계의 객체화 : 부모클래스명 객체명=new 자식클래스의 생성자();
		// Override된 method가 존재하면 자식의 method가 호출된다.
		OverrideSuper os = new OverrideSub(); // => is a 관계의 객체화
		// 자식의 method는 부를 수 없다. OverrideSuper에는 어디에도 자식 method가 없음
		// os.test(); //자식의 method인 test는 OverrideSupper클래스에 존재하지 않으므로 호출 불가
		os.print(); // override를 하면 최우선적으로 자식의 method가 호출된다

	}// main

}// class
