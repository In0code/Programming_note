package day0725;
//1. Runnable 구현
public class UseRunnalbe implements Runnable {

	//2. run method Override
	@Override
	public void run() {
		//3. Thread로 동작할 코드를 작성
		for(int i=0; i<500; i++) {
			System.out.println("run-----i"+i);
		}//end for
		
	}//run
	public void test() {
		//3. Thread로 동작할 코드를 작성
		for(int i=0; i<500; i++) {
			System.out.println("test======>i"+i);
		}//end for
		
	}//run
	
	
	
	public static void main(String[] args) {
		//4. Runnable을 구현한 클래스를 객체화
		UseRunnalbe ur=new UseRunnalbe();
		//5. Thread 객체와 has a 관계 설정
		Thread t=new Thread(ur);
		//6. start() 호출
		t.start();
		System.out.println("-----------------");
		ur.test();
		
	}//main

}//class
