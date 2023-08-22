package day0613;

/**
 * 단일 if문 사용) <br>
 * 조건에 맞을 때에만 코드를 실행햐야할 때. <br>
 * 문법) <br>
 * if ( 조건식) {<br>
 *   조건에 맞을 때 수행할 문장 들...<br>
 *   }
 * @author user
 *
 */
public class UseIf {
 
	public static void main(String[] args) {
		//매개변수로 입력된 수의 절대값
		int num=Integer.parseInt(args[0]);  //반드시 실행
		
		System.out.print(num+"의 절대값은 "); //반드시 실행
		
		if(num < 0) {     //음수면 실행해라 , 0보다 작으면 절대값의 대상
		num=-num;    //상황에 따라 실행
		}
		System.out.println(num+" 입니다."); //반드시 실행 
		
		// char형의 변수를 만들고 임의의 문자를 넣는다.
		// 입력된 문자가 대문자, 소문자 인 경우에만 해당 문자를 출력하는 코드를 작성.
		
		char a= 'z'; //A (65), Z(90), a(97), z(122)
		
		if ((a>=65 && a<=90) || (a>=97 && a<=122)) {
			System.out.println( a );
		}
	//	}else {System.out.println("대문자, 소문자가 아닙니다");
		
		//}
		
		//int 형의 변수를 만들고 임의의 숫자를 할당한다.
		//입력된 숫자가 0~100사이인 경우에만 
		//과락  // 40점 이하면
		//다른과목 참조  //60점 이하
		//합격을 출력한다.  //60점 이상
		
		//int score=10;
		
		
		
		/*if (score > -1 && score < 101) {
			if (score < 40) {
				System.out.println("과락");
			}
			if (score < 60) {
				System.out.println("다른 과목 참조");
			}
			if (score < 101) {
				System.out.println("과락");
			}
		}*/
		
		
		int score = 40;
		if (score > -1 && score < 40) {  //
			System.out.println("과락");
		}
		if ( score > 39 && score < 60) {
			System.out.println("다른과목 참조");
		}
		if (score > 59 && score < 101 ) {
			System.out.println("합격");
		}  //코드는 일관성 있게 점층적으로 짜야한다. 
		
		

		
		
	}//main

}//class
