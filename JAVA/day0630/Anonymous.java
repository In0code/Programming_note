package day0630;

import day0629.HongGillDong;

/**
 * Anonymous inner class 이름없는 class
 * 
 * @author user
 *
 */
public class Anonymous {

	public void useHonGilDong(HongGillDong hgd) {
		System.out.println(hgd.fight(6));
		System.out.println(hgd.fight(8));
		System.out.println(hgd.fight(5));
	}// useHonGilDong
	
	
	public void useTest(Test t) {
		t.test();
	}

	public static void main(String[] args) {
		Anonymous am=new Anonymous();
		//method를 호출하기 위해 HongGilDong 클래스가 만들어져야 한다.
		HongGillDong hgd=new HongGillDong();
		am.useHonGilDong(hgd);
		//useTest
		
		//매개변수가 참조형데이터형인 경우 (class나 interface)에는
		//1. 매개변수에 해당하는 클래스를 작성한다.
		//2. 객체를 생성
		TestImpl ti=new TestImpl();
		//3. method 호출 객체를 할당
		am.useTest(ti);
		
		//anonymous inner class 생성 => 클래스파일을 별도로 생성할 필요가 없다.
		am.useTest(new Test() {
			@Override
			public void test() {
				System.out.println("Override method");
			}//test
		});
	//어디를 봐도 class라는 느낌은 안들지만 이것이 anonymous class이다. 
   //변수도 만들 수 있고 method도 만들 수 있지만 잘 안하긴 함.
	//interface에는 상수와 추상 method가 있다
		//추상 method는 반드시 overriding 해야함.
//interface는 객체화가 안된다. => interface랑 is a 관계에 있는 클래스를 하나 만들어야 된다는 뜻
	}// class

}// main
