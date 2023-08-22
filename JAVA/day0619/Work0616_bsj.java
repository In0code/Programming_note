package day0619;

public class Work0616_bsj {
	
	public void printName() {
		System.out.println("내 이름은 박상준!!");
	}
	
	public char printInitialP() {
		return 'P';
	}
	
	/**
	 * 점수를 입력 받아 점수의 판정을 출력하느 method- 가변일
	 * @param socore
	 */
	public void grading(int score) {
		if(score>-1&&score<101) {
			if(score<40) {
				System.out.println("과락");
			}else if(score<60) {
				System.out.println("다른 과목 참조");
			}else{
				System.out.println("합격");
			}//else
		}else {
			System.out.println("잘못된 점수");
		}//else
	}
	
	/**
	 * 문자를 입력받아 해당 문자가 "대문자",, "소문자", "숫자"인지를 판단하는
	 * @param c
	 */
	public void separate(char c) {
		if(c>64&&c<91) {
			System.out.println("대문자");
		}else if(c>96&&c<123) {
			System.out.println("소문자");
		}else if(c>47&&c<58) {
			System.out.println("숫자");
		}else {
			System.out.println("대문자, 소문자, 숫자가 아닙니다.");
		}
	}
	
	/**
	 * 태어난 해를 입력받아 나이를 반환하는 method- 가변값
	 * @param birth 태어난해
	 * @return 나이
	 */
	public int seekAge(int birth) {
		return 2023-birth+1;
	}
	
	/**
	 * 두 개의 수를 입력 받아 둘 중 큰 수를 반환하는 일을 하는 method
	 * @param num1 처음수
	 * @param num2 두번째 수
	 * @return 판정결과
	 */
	public int greaterNumber(int num1, int num2) {
		if(num1-num2>=0) {
			return num1;
		}else {
			return num2;			
		}//end else
	}
	
	
	public static void main(String[] args) {
		Work0616_bsj work = new Work0616_bsj();
		//고정일을 하는 method: method안에서 출력이 된다
		work.printName();
		//고정 값으로 사용하는 method:
		//값을 반환하니 값을 받아서 출력하는 일을 한다.
		
//		System.out.print(work.printInitialP());   //바로 출력해도 되고
		char initail=work.printInitialP(); //변수에 저장한 후
		System.out.println(initail); //출력해도 된다.
		
		work.grading(35);
		work.separate('A');
		
		//가변값으로 사용하는 method
//		System.out.println(work.seekAge(1997));   //직접 출력혁해도 괜찮지만
		//1.변수에 저장하고

		int age=work.seekAge(1997);
		//2.변수를 출력
		System.out.println(age);
		
		//
//		System.out.println(work.greaterNumber(153, 151));//직접 출력해도 되지만
		//1.변수에 저장하고
		int num=work.greaterNumber(153, 151);
		///2.변수를 출력
		System.out.println(num);

	}

}
