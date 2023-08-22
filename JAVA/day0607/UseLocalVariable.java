package day0607;
//1. 소스코드 작성
//지역변수를 사용하는 일을 하는 자바 소스코드 작성

class UseLocalVariable{

	//int k;  //instance variable
	//static int j;  //static variable

	public static void main(String[] args){
		
		int i; //1. 변수의 선언 , local variable
		i=2023;  //2. 값 할당
		System.out.println(i);  //3. 변수의 사용
		
		i=6;  //2. 값 할당
		System.out.println(i);

		int j;  //int가 중요한게 아님 이름인 j가 중요. 변수의 이름만 다르다면 몇 개의 변수든 선언할 수 있음
		j=8;
		System.out.println(j);

		//같은 이름의 변수는 데이터형과 상관없이 선언할 수 없다.
		//String i;

		//지역변수는 자동 초기화가 되지 않는다. (초기화 하지 않은 변수는 사용하게 되면 error가 발생하게 된다.)
		int k;
		k=6;
		System.out.println(k);

	}      //main  //local field 라고 함.

}         //class field라고 함. 


//2. 저장 UseLocalVariable.java
//3. 컴파일 javac UseLocalVariable.java
//4.실행 java UseLocalVariable
        
     