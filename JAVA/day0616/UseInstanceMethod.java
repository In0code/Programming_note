package day0616;

/**
 * instance method :
 * instance variable를 사용하여 업무를 처리하는 일
 * @author user
 *
 */
public class UseInstanceMethod {
	int age;
	
//	instance variable에 나이를 할당하면 태어난 해를 출력해주는 일!
	
	public void printBirth() {
		if (age > -1) {
			System.out.println(age+" 살은 "+(2023-age));
		}else {
			System.out.println(age+"살는 잘못된 나이입니다.");
		}
	}//printBirth
	public static void main(String[] args) {
//		printBirth();   
		//static 영역에서는 instance 영역의 method를 직접 호출할 수 없다.
		
		//2. 객체화 : 클래스명 객체명 = new 클래스명();
		UseInstanceMethod uim=new UseInstanceMethod();
		
		//3.instance variable에 값을 할당
		uim.age=24;
		
		//4. method 호출
		uim.printBirth();
		
		
		
		
		
		
		
		//method 형태
		//1. 고정 일- 봔환형 없고, 매개변수 없는 형.
		// parameter은 여러개가 들어갈 수 있따
		//return은 parameter가 여러개라도 하나만 나온다.
		
		// public 피자 술마시는 일(술의종류,안주)
		//		비둘기
		//닫침괄호 } : 나를 호출한 곳으로 돌아가
		
		//2. 가변 일- 반환값 없고, 하지만 매개변수가 있어서 가변적이 된다.
		//주의 : 변수의 맞게 arguments를 집어넣어야 한다.
		//매개변수는 어떤 종류의 변수일까? local variable 종류이다.
		//parameter은 local variable이기 때문에 그 안에서만 쓰여지게 된다.
		
		//값으로 사용하는 method는 method의 가장 마지막 줄에 반드시 분기문인 return이 나와야 한다.
				//return 사용법)
				//return 값;
				//return의 값은 변수, 상수, 연산식이 될 수 있다.
		
		//3. 고정값 - 반환형이 있고 (void가 아님), 매개변수 없는 형
		// return 타입과 return되는 값의 형은 일치해야한다.
		//return의 값은 반환형과 같은 형의 값이 정의되어야 한다.
		//ex) public int typeC(){
		//return 6;
		//이면 int와 6은 같은 형이어야 한다.
		//반환형 있고, 매개변수 없는 형은 값이다. 그래서 연산에 참여해도 되고...
		
		//호출)
		//데이터형 변수명 = 객체명. typeC();
		//객체명.typeC(); 은 값이다. 6이다.
		
		//4. 가변값 -  반환형 있고, 매개변수 있는 형. 
		//method가 가변이 될려면 parameter이 필요하다.
		// public int typeD(double d) 
		
		
		
		
		
		//java는 객체지향언어. 객체를 지향한다. instance variable이 그래서 많음.
		//static variable도 많지만 , instance variable이 훨씬 많다.
		
		
		//1. method 정의
		//public 반환형 method명 (매개변수...){
		//2. 객체 생성
		//  클래스명 객체명=new 클래스명();
		//3. 변수의 값 할당
		//  객체명.변수명=값;
		//4.호출
		//  객체명.method명(값...);
		 
	}//main
}//class
