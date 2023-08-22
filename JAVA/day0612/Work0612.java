package day0612;
class Work0612 {
	public static void main(String[] args) {
		
/*1. int temp1=10, temp2=20; 변수를 만들고 아래와 같은 코드를 작성했을 때
     어떤 값이 출력되는지 예상해보고 어떻게 그런 결과가 나왔는지 
     주석을 열고 간략하게 써보세요.
      System.out.println( ++temp1 + temp2--);
      System.out.println( “temp1 = “ + temp1 + “ / temp2 = “+ temp2 );*/

	int temp1=10, temp2=20;
	System.out.println( ++temp1 + temp2--);  //11+20 =31
    System.out.println( "temp1 = " + temp1 + "/ temp2 = "+ temp2 ); 
	// temp2-- 는 후위 연산 이므로 대입 후 연산하기 때문에, 처음에는 연산 하기 전이어서 20, 
	//두 번째는 연산 한 후라서 19가 나온다.



/*2. Integer.MAX_VALUE상수를 사용하여 Integer의 하위 2Byte 값이 출력되도록
    비트논리연산자를 사용하여 연산해보세요. ( 65535가 출력되어야합니다.)*/



	  //integer은 4byte.
	  //Integer.MAX_VALUE & Caracter.MAX_VALUE
	  //Integer.MAX_VALUE & 65535
	  //Integer.MAX_VALUE & 0x0000FFFF;
	  //  => 다 됨


	System.out.println(Integer.MAX_VALUE & Character.MAX_VALUE);


/*3. main method의 arguments로 입력된 값이 0~100 사이 값이라면 “입력성공” 그렇지 않으면 
   “점수를 확인하세요”를 출력하세요.*/

	 int inputScore=Integer.parseInt( args[0] );
	System.out.println ( inputScore + "점은" + (inputScore > -1 && inputScore <101 ? "성공" : "실패"));
	//System.out.println ( inputScore + "점은" + (inputScore >= 0 && intputScore <= 100 ? "성공" : "실패"));  // 이것도 되긴 됨. 그러나 위에 것이 결과가 빠름
	
	
	//int i=Integer.parseInt(args[0]);
	//System.out.println(i < 101 & i>-1 ? "입력성공":"점수를 확인하세요");

	//args 는 String이기 때문에 int에 대입될 수 없다
	//그러기 위해서 Integer.parsInt(args[0]); 라는 걸 해줘야 함
	
	//System.out.println( 0 < args[0] <100 ? "입력성공":"점수를 확인하세요");



 /*4. arguments로 년을 입력 받고 삼항 연산자를 사용하여 윤년을 구하세요.
   윤년을 구하는 방법은 다음과 같습니다.
    4로 나누어 떨어지는 해는 윤년입니다.
   그러나 100으로 나누어 떨어지는 해는 윤년이 아닙니다.
   그렇지만 400으로 나누어 떨어지는 해는 다시 윤년입니다. 산술, 관계,일반 연산을 마구 써야함*/
    
	int k=0;
	int[] testData= { 1900, 2000, 2001, 2002, 2003, 2004, 2020, 2024, 2100 };

	int leapYear=0;
	for ( k=0; k < testData.length; k++ ){
		leapYear=testData[k];
		System.out.println(leapYear + "년은" +(leapYear%4==0 && (leapYear%100 != 0 || leapYear % 400 ==0) ? "윤년" : "평년"));
	} // end for
	
	

	
	//int j=Integer.parseInt(args[1]);
     // System.out.println((j % 4 == 0 && j % 400 ==0) && !(j%100==0) ? "윤년입니다": "윤년이 아닙니다");

	//int a=Integer.parseInt(args[0]);
	//System.out.println(((a%4==0) && (a%400==0)) ? "윤년입니다":"윤년이아닙니다");

	}
}
