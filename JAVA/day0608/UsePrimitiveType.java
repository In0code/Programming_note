/**
기본형 데이터 형: 선언한 변수 자체에 값을 저장하는 데이터형
*/
package day0608;
class UsePrimitiveType{
	
	public static void main(String[] args) {

   ////////////////////////////정수형 데이터형//////////////////////////////
	
	byte a=10;    // byte: -128 ~ +127
	short b=20;  // short 약 30000정도의 값
	int c=30;     // int 약 21억 정도의 값
	long d=40;  // long 21억을 초과하는 값

	System.out.println("정수형 byte : " + a +", short : "+b+", int : "+c+", long : "+d );

	//아파트 가격을 저장하는 변수를 선언하고 54억을 입력하여 출력
	long AptPrice=5400000000L;    //형 명시 : literal이 4byte에서 8byte로 확장

	System.out.println("APT Price : " +AptPrice);
	
   ////////////////////////////문자형 데이터형//////////////////////////////
	
	//char e='A';
	//char e=65;  //unicode값에 해당하는 10진수를 할당 할 수 있다.
	char e='\uFFFF';  //unicode를 직접 사용할 수 있다
	char f='0';
	char g='가';

	System.out.println("char : " + e + ", "+f+", "+g);

   ////////////////////////////실수형 데이터형//////////////////////////////
	
	//float h=6.08;   //error.  ->8byte인 실수가 4byte인 float에 들어갈 수 없기 때문 ->8byte literal을 4byte로 줄이기 위해 형명시 해야함.
	float h=6.08F;   //float은 literal보다 작기 때문에 형명시 필수
	double i=2023.0608;  //형명시 생략
	double j=2023.0608D;  //형명시 정의		
	System.out.println("실수형 float : " +h+", double : "+i+", "+j); 

   ////////////////////////////블린형 데이터형//////////////////////////////

	boolean k=true;
	boolean l=false;

	System.out.println("블린형: "+k+", "+l );

  //////////////////////////promotion(자동 형 변환)////////////////////////
   /*
	byte num1=10;
	byte num2=20;
	byte result=0;
	result=num1 + num2;  //error  =>연산 결과가 int(byte+byte=int)에 저장되었기 때문에 erro가 난다(promotion)
  */

 	byte num1=10;
	byte num2=20;
	int result=0;

	result=num1 + num2;   //promotion

	System.out.println(num1+ " + "+num2+" = "+result);


	}//main
}//class
