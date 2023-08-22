package day0615;

/**
 * 무한루프와 여러개의 초기값을 가지는 for
 * @author user
 *
 */
public class InfiniteFor {

	public static void main(String[] args) {
		//수를 세는 무한 loop
		for(int i=0; ; i++) {  //조건이 없기 때문에 for가 끝나지 않는다.
			System.out.println(i);
			if(i==5) {
			break;
		}//end for
	}//end for
		//무한루프 아랫줄은 실행될 수 없기 때문에 코드를 작성할 수 없다.
		System.out.println("안녕");
		
		//증가하는 수를 세지 않는 무한 loop
		for(; ;) {
			System.out.println("무한loop");
			break;
		}//end for
		
		//여러개의 초기값을 가지는 for 문(반복문)
		for(int i=0, j=10, k=5; i < 5; i++ , j--) {
			System.out.println("i = "+i+", j = "+j+", k = "+k);
		}//end for
		
		for (char c= 65, c1= 97; c < 91; c++, c1++) {
			System.out.println(c+"("+c1+")");
		}
		System.out.println();
		for (char c= 65; c < 91; c++) {
			System.out.println(c+"("+(char)(c+32)+")");
		}
		
		System.out.println();
		// 1 ~ 100 까지 홀수만 출력
		for(int i=1; i < 101; i++) {  // i=+2 라고 해도 괜찮은데, continue를 넣어서 하자
			System.out.println(i + " ");
			if(i%2==0) {  //continue는 if랑 짝을 이뤄서 쓰게 된다.
				continue;
			}
			System.out.println("안녕");
		}//end for
		

	}//main

}//class
