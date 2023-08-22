/**
 논리 연산자

  일반 논리
 && ( AND ) : 전항 과 후항 모두  true 일때만 true 반환
   ||  ( OR ) : 전항과 후항이 모두 false 일때만 false 반환  // 하나라도 true면 true
 
  비트 논리
    & ( AND )  : 상위 비트와 하위비트 모두 1인 경우 1내림
	 |  ( OR )  :  상위 비트와 하위비트 모두 0인 경우 0 내림
	^ ( XOR ) :  상위 비트와 하위비트 둘 중 하나만 1일때 1 내림

*/
package day0612;
class Operator5 {

	public static void main(String[] args) {
		//변수의 값이  unsigned 8진수 범위인지? (0~7 사이 값인지?)
		int i=7;
		System.out.println( i+ "는 8진수의 범위? " + ( i > -1 && i < 8));
		
		boolean flag1=true, flag2=false, flag3=true, flag4=false;
		System.out.println( "-----------------------&& (AND)----------------------------" );
		System.out.println(flag1+" && "+flag3+" = "+(flag1 && flag3 ));  // T && T = T
		System.out.println(flag1+" && "+flag2+" = "+(flag1 && flag2 ));  // T && F = F
		System.out.println(flag2+" && "+flag1+" = "+(flag2 && flag1 ));  // F && T = F
		System.out.println(flag2+" && "+flag4+" = "+(flag2 && flag4 ));  // F && F = F
		// &&는 전항이 false일 때는 후항을 연산하지 않고 false를 내보낸다
		
		System.out.println( "-----------------------|| (OR)----------------------------" );
		int day=19;
		//6월에 월요일( 5, 12, 19, 26 )이면 true, 그렇지 않으면 false 출력
		boolean flag= day == 5 || day == 12 || day ==19 || day == 26 ;
		System.out.println( day+"일은 월요일인가? " + flag );

		System.out.println(flag1+" || "+flag3+" = "+(flag1 || flag3 ));  // T || T = T
		System.out.println(flag1+" || "+flag2+" = "+(flag1 || flag2 ));  // T || F = T
		System.out.println(flag2+" || "+flag1+" = "+(flag2 || flag1 ));  // F || T = T
		System.out.println(flag2+" || "+flag4+" = "+(flag2 || flag4 ));  // F || F = F
		// ||는 전항이 true라면 후항을 연산하지 않고 true를 내보낸다
		// 즉, 둘 중 하나라도 true면 true를 내보낸다.

		int num1=6, num2=12, num3=2023;
		flag1=false;
		flag2=false;
		boolean resultFlag= (flag1= num1 > num2) && (flag2 = num2 < num3);  //전항이 false라서 후항을 계산하지 않음. 그래서 후항도 false
			System.out.println( "flag1 : "+flag1 +" , flag2 : " +flag2+ ", resultFlag : "+resultFlag  );


		System.out.println( "-----------------------비트 논리연산----------------------------" );
		num1=39;
		num2=0xF;  //16진수


		System.out.println( num1+ " & " +num2+ " = " + (num1 & num2) );
		//0010 0111 & 0000 1111 = 0000 0111 => 7     // 상위 비트와 하위비트 모두 1인 경우 1내림
		
		num1=25;
		num2=19;
		System.out.println( num1+ " | " +num2+ " = " + (num1 | num2) );
		//0001 1001 | 0001 0011 = 0001 1011 => 27  //상위 비트와 하위비트 모두 0인 경우 0 내림 // 둘 중 하나라도 1이면 1 내림

		num1=30;
		num2=12;
		System.out.println( num1+ " ^ " +num2+ " = " + (num1 ^ num2) );
		//0001 1110 ^ 0000 1100 = 0001 0010  => 18  // 상위 비트와 하위비트 둘 중 하나만 1일 때 1 내림 // 둘이 값이 달라야 1내림


	} //main
} //class
