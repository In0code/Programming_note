package day0614;

/**
 *일치하는 정수를 비교할 때 사용하는 switch~ case <br>
 * @author user
 *
 */
public class UseSwitchCase {

	public static void main(String[] args) {
		int i=1;
		
		//break;   // switch 문이나 룹핀문? 밖에서 break를 쓰면 error가 난다.
		// switch~case, for, while문을 실행을 멈추고빠져나갈 때 사용 
		// switch, for, while 문 안에서만 사용가능
		
		switch (i) {   // 일치하는 case를 찾고, 순차적인 흐름을 가진다. //switch case는 점프하는 애
		case 0:System.out.println("영");
		case 1:System.out.println("일");
		case 2:System.out.println("이"); break;  //필요에 따라 정의
		case 3:System.out.println("삼");
		default:System.out.println("해당 case 없음");
			
		}// end switch
		
		
		
		
		
		int key='A'; //A unicode 65, a 97 // 숫자 0 유니코드 48 , 1은 49
		//char는 유니코드 값을 써도 괜찮고 문자를 바로 써도 괜찮음
		//case의 상수는 입력되는 데이터형의 범위 까지만 사용할 수 있다.  
		// byte를 입력하면 -128 ~ +127까지만 사용 가능
		switch (key) {  //byte, short, int, char 를 받을 수 있다 (추후 String 도 가능)
		case 65 : System.out.println("값0"); break;
		case 1 : System.out.println("값1"); break;
		case 2 : System.out.println("값2"); break;
		default: System.out.println("해당 case 없음");
			
		}// end switch
		
		
		
		
		String s="Java";  // Java Compiler가 JDK 1.7 이상 부터 사용 가능
		switch (s) {
		case "Java" : System.out.println("WORA를 지원하는 완벽한 OOP언어"); break;
		case "Oracle" : System.out.println("대용량 DBMS"); break;
		
		}//end switch
		
		
		
		
	}

}
