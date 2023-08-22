package day0616;

/**
 * static method:
 * instance variable의 값을 사용하지 않고, 입력된 값으로만 업무처리할 때.
 * 
 * @author user
 *
 */
public class UseStaticMethod {
		
	public static void printhelloMsg() {
		System.out.println("안녕하세요? 오늘은 금요일입니다.");
		System.out.println("내일은 쉽니다. 포항항항항항 ^o^.");
	}
	
	public static void main(String[] args) {
		//static method는 객체화 없이 클래스명.method명으로 호출한다.
		UseStaticMethod.printhelloMsg();
		//static은 클래스명을 생략할 수 있다.
		printhelloMsg();
		
		
	}//main

}//class
