package day0629;

/**
 * 추상클래스<br>
 * 변수,method, abstract method를 가진다.<br>
 * abstract method는 body가 없어서 일을 할 수 없는 method이고, 구현의 강제성을 가진다<br>
 * 객체화가 되지 않는다.
 * 
 * @author user
 *
 */
//public class AbstractParent {
public abstract class AbstractParent {

	int i; // 변수 가질 수 있음

	public AbstractParent() { // 생성자가 있거나 없거나 객체화가 되지 않음
		System.out.println("추상클래스의 생성자");
	}// AbstractParent

	public void test() {
		System.out.println("일반 method");// 일도 할 수 있음
	}

	// abstract method
	public abstract void abTest();
	// abstract method는 오직 추상 클래스 안에서만 정의
	protected abstract void abTest(int i);  //method에 body 없음 //overloading

//	public static void main(String[] args) {

//		new AbstractParent(); // 추상 클래스는 객체화가 되지 않음.
//	}// main
}// class
