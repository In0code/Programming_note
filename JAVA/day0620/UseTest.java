package day0620;

public class UseTest {

	public static void main(String[] args) {
		
		//public인 변수는 클래스 외부에서 사용할 수 있다.
		Test t=new Test();
		
		//사람은 1~100살까지만 가능하다.
		t.age=1000;    //외부에서 값을 넣으면 값에 대한 체크를 여러번 만들어야 한다.
		if (!(t.age > 0 && t.age < 101)) {
			t.age=1;
		}//end if
		System.out.println("나이 : " + t.age);
		
		t.age=25;    //외부에서 값을 넣으면 값에 대한 체크를 여러번 만들어야 한다.
		if (!(t.age > 0 && t.age < 101)) {
			t.age=1;
		}//end if
		System.out.println("나이 : " + t.age);
		
		t.setDay(40);
		System.out.println(t.getDay());

	}//main

}//class
