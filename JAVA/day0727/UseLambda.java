package day0727;

import java.util.Calendar;

/**
 * 람다식의 사용 ( ) -> { }
 * 
 * @author user
 *
 */
public class UseLambda {

	public void run(){
		
	}
	
	public static void main(String[] args) {
		// 1. 인터페이스를 람다식으로 구현
		TestInter ti = () -> {
			// TestInter의 test를 Override해서 코딩하는 것으로 생각하고 코드 작성
			int day = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
			System.out.println("오늘은 " + day + "일 입니다.");
		};
		// 2. 인터페이스 객체를 사용하여 abstract method를 호출
		ti.test();

		/////////////////////////////////////////////////////////////////////

		// 1. 인터페이스를 람다식으로 구현 ( 반환형도 있고, 매개변수도 있다 )
		TestInter2 ti2 = (String str, double d, int age) -> {

			System.out.println(str);
			System.out.println(d);
			System.out.println(age);

			return "반환형있고, 매개변수 있는 abstract method";
		};
		// 2. 인터페이스 객체를 사용하여 abstract method를 호출
		String str = ti2.test("오늘은 목요일", 7.27, 2023);
		System.out.println(str);

		//////////////////////////////////////////////////////////////////////

		// Runnable 인터페이스를 람다식으로 구현하여 1~100까지 옆으로 출력하는
		// 코드를 작성하고 호출해보자

		Runnable r= ()->{
			for(int i=1; i<101; i++) {
				System.out.print(i+" ");
			}//end for
		};
		
		Thread t=new Thread(r);
		t.start();
		
		
	}// main

}// class
