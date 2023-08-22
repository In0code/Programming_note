package day0615;

/**
 * 시작과 끝을 모를 때 사용하는 반복문
 * 최소 1번수행에 최대 조건까지 수행
 * do~while<br>
 * 문법)
 * 초기값
 * do{
 *   반복 수행 문장 들...;
 *   증.감소식
 *   }while ( 조건식) ;
 * 
 * @author user
 *
 */
public class UseDoWhile {

	public static void main(String[] args) {
		
		int i=100;  //초기값   
		//초기값과 상관없이 무조건 1번은 실행되는 반복문이 do~while
		do {
			System.out.println(i);  //반복수행문장
			i++; //증.감소식
		}while (i < 5); //조건식

			System.out.println();
		//do~ while을 사용하여 1 ~ 100까지의 합을 출력
		i=1;
		int num=0;
		do {
			num += i;
			i++;
		}while (i < 101);
		System.out.println("1~100까지의 합 : " +num);
		
		
	}

}
