package day0626;

public class ConChild extends ConParent  {

	public ConChild() {
		this(100); //가 숨어있따
		
		System.out.println("자식의 기본 생성자 ");
	}// ConChild
	

	public ConChild(int i) {
//		this();
		System.out.println("자식의 매개 생성자 "+i);
	}// ConChild



}//class
