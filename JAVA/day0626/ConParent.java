package day0626;

public class ConParent {

	public ConParent() {
		this(100); //가 숨어있다.
		System.out.println("부모 기본 생성자 ");
	}// ConParent

	public ConParent(int i) {
//		this();
		System.out.println("부모 매개 생성자 " + i);
	}// ConParent

}// class
