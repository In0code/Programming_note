package day0607;
//1. 소스코드 작성
//콘솔에 출력하는 일을 하는 자바 소스코드 작성

class UsePrintMethod{
        
        public static void main(String[] args){
                // System.out.print("안녕");
                // System.out.print("하세요?");
		System.out.println("----------------상수출력------------------");
                System.out.println(2023);    //정수 상수
                System.out.println(2023.06);  //실수 상수
                System.out.println(true);  //블린 상수
        	    System.out.println('A');   //문자 상수
                System.out.println("2023년 6월 7일");  //문자열 상수	
		System.out.println("----------------연산결과출력------------------");
		System.out.println(6+7);
		System.out.println("6+7="+6+7);  //문자열 뒤에 더하기가 붙으면 문자열 뒤에 덧 붙여라 라는 뜻 , 6+7=67
		System.out.println("6+7="+(6+7));  //너네 먼저 연산해 라는 뜻으로 괄호 쳐주면 13이 잘 나온다.  6+7=13

      }//main



}//class

//2. 저장 UsePrintMethod.java

//3. 컴파일  javac UsePrintMethod.java

//4. 실행 java UsePrintMethod