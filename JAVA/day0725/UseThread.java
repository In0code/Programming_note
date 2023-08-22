package day0725;

//1. Thread를 상속받는다
public class UseThread extends Thread {

	// 2. run method의 Override
	public void run() {
		// 3. Thread로 동작해야할 코드를 정의
		for (int i = 0; i < 500; i++) {
			System.out.println("run-----i " + i);

		} // end for
	
	}// run

	public static void main(String[] args) {
		// 4. 클래스의 객체화 => 부모부터 만들어짐
		UseThread ut = new UseThread();
		// 5.start()호출하여 run()이 호출되도록 한다
		long startTime=System.currentTimeMillis();
		ut.run();
//		ut.start();
		
		System.out.println("-----------------");
		for (int i = 0; i < 500; i++) {
			System.out.println("main-----i " + i);
			
		} // end for
		long endTime=System.currentTimeMillis();
		System.out.println("실행시간 : "+(endTime - startTime)+"ms");
		// 부모에게 있는 method이지만, 자식이 자신의 것처럼 쓴다 => 코드의 재사용성
		
	}// main
}// class
