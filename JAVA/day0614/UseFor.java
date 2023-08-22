package day0614;

/**
 * 시작과 끝을 알 때 사용하는 반복문 : for <br>
 * 문법 ) <br>
 * for (시작값(초기값) ; 끝값(조건식) ; 증.감식) { <br>
 *    반복 수행 문장 들...; <br>
 *    }
 * @author user
 *
 */
public class UseFor {
 public static void main(String[] args) {
	 //0 ~ 9까지 1씩 증가하는 값을 출력하는 반복문
	 
	 for (int i=0; i<10; i++) {
		 System.out.print(i + " ");
	 }// end for
	 System.out.println(" ");
	 
	 
	 
	 // 1 ~ 100 까지 1씩 증가하는 값을 출력하는 반복문
	 for (int i=1; i < 101;  i++) {
		 if (i % 2==0) {
		 System.out.print(i+" ");
	  }
	 }
	 System.out.println(" ");
	 
	 
	 
	 //1 ~ 100 까지 홀수만 출력하는 반복문
	 //for 문의 증.감소식인 대상체의 값을 변경하여 유지할 수 있는 모든 문법을 사용할 수 있다.
	 for (int j=1; j < 101; j ++ ) {
		 if (j %2 ==1) {
			 System.out.print(j + " ");
		 }
	 }
	 System.out.println();
	 
	 
	 //1 ~ 9 까지 1씩 증가하는 수를 아래로 출력하는 반복문을 만들어라
	 for (int i=1; i < 10; i++) {
		 System.out.println("2 * " +i+ " = " + i*2);
	 }
//	 
//	 for (int i=1; i < 10; i++) {
//		 for (int i=1; i < 10; i++) {
//			 sy
//		 }
//	 }
//	
	 
	 
	 
	 
//	 for (int i=65; i <91; i++ ) {
//		 System.out.print((char)i + " ");  // int 를 char로 변환하여 출력해야 문자가 나온다
//	 }
	 
	 
	 System.out.println();
	 // for문을 사용하여 A ~ Z 까지 출력
	 for (char i=65; i <91; i++ ) {  //char에는 unicode값이 할당되고
		 System.out.print(i + " ");  //unicode 값에 해당하는 문자가 출력된다
	 }
	 System.out.println();

	 
	 
	 
	 //1 ~ 100 까지 합을 출력해 보세요
	 int sum=0;
	 for (int i=1; i < 101; i++) {
		  sum += i;
	 }
	 
	  System.out.println("1 ~ 100 까지의 합은" +sum);  // 이게 for문 안에 있으면 미친 듣이 찍기때문에 for문 밖에 있어야 한다.
	 
	  System.out.println();
	  
	  
	  // 100 에서부터 0 까지 1씩 감소하는 값을 옆으로 출력
	  for (int i=100; i > -1; i-- ) {
		  System.out.print(i+ " ");
	  }
	  
	  System.out.println();
	  
	 
	  //대문자 A~Z 와 소문자a~z까지 한 번에 출력하는 for  // A(a) B(b) ....Z(z)
	  for(char i=65, k=97; i<91 && k<129; i++, k++){
		  System.out.print(i+"("+k+")");
	  }
	  
	  //for (char c=65; c < 91; c++){        //A 랑 a 가 unicode로 32 차이남. 그래서 a를 구하는거는 A에 32를 더해주면 됨. 
	  //System.out.println(c+ "(" + (char)(c+32)+")");  //char랑 int랑 더하면 자동형 변환이 되므로 다시 char로 캐스팅 해야함
	  
	  
	  
	  
	  
	}//main

}//class
