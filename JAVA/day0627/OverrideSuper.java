package day0627;

public class OverrideSuper {
	int super_i;

	/**
	 * final이 접근지정자로 사용된 method는 Override 할 수 없다.
	 */
	public /* final */ void print() {
		System.out.println("부모 super_i" + super_i);
	}// printSuper

	protected void overTest() { // 접근 지정자의 연습

	}// overTest
}// class
