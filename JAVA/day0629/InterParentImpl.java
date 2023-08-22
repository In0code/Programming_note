package day0629;

/**
 * interface를 구현하는 클래스 interface 내 abstract method를 모두 구현해야 한다.
 * 
 * @author user
 *
 */
public class InterParentImpl implements InterParent {

	@Override
	public void test() {
		System.out.println("Constant 사용 : " + InterParent.VALUE);
	}// test

	@Override
	public int test(String str) {
		return Integer.parseInt(str);
	}// test

	public static void main(String[] args) {
		//interface는 객체화가 되지 않는다
//		InterParent ip=new InterParent();
		
		//is a 관계의 객체화는 가능
		InterParent ip=new InterParentImpl();
//ip 객체로 사용할 수 있는 자원은 상수, Override된 method, default method
		
		//Override 된 method
		ip.test();
		System.out.println(ip.test("100"));
		
		//default method 호출
		System.out.println(ip.msg());
		
	}// main

}// class
