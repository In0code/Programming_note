package day0615;

/**
 * while : 시작과 끝을 모를 때 사용하는 반복문
 * 최소 0번 수행에 최대 조건까지 수행 <br?
 * 문법) <br>
 * 조기값; <br>
 * while ( 조건식 ) <br>
 * 반복수행 문장들 <br>
 * 증.감식 <br>
 * @author user
 *
 */
public class UseWhile {

	public static void main(String[] args) {  //조건식에 맞을때까지 계속 반복
		int i=0;  //초기값
		
		while (i < 5 ) {  //조건식
			System.out.println("i = "+i); //반복 수행 문장들
			i++;  //증.감소식
		}//end while
		System.out.println();
		
		
		//while을 사용하여 국단 3단을 출력
		i=1;
		while (i <10) {
			
			i++;
			System.out.print("3*");
			System.out.println(i+ " ="+3*i );
		}
		
	}//main	

}//class
