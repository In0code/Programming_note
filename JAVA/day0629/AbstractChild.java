package day0629;

/**
 * 추상클래스의 자식 클래스 <br>
 * 구현의 강제성<br>
 * 자식클래스는 부모 클래스의 abstract method가 몇 개든 모두 구현해야한다.<br>
 * 
 * @author user
 *
 */
public class AbstractChild extends AbstractParent {

	public AbstractChild() {
		System.out.println("자식의 생성자");
	}// AbstractChild

	// 일반클래스는 추상 class를 가질 수 없음
	@Override
	public void abTest() {
		//abstract method는 직접 호출불가
//		super.abTest();
		System.out.println("자식이 Override한 abTest");
	}

	@Override
	public void abTest(int i) { // overriding이자 overloading임
		System.out.println("자식이 Override한 abTest i" + i);

	}

	public static void main(String[] args) {
		//추상클래스는 자식클래스가 생성될 때에만 객체로 생성된다.
		//생성자가 호출된다는 것이 자식이 만들어졌다는 것
		AbstractChild ac=new AbstractChild();
		//부모 생성자가 먼저 호출 됨. 
		
		//is a로 객체화
		AbstractParent ap=new AbstractChild();
		
		ac.abTest();
		ap.abTest();
		System.out.println("----------------------");
		ac.abTest(10);
		ap.abTest(20);

	}// main
}// class
