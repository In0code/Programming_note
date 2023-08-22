package day0608;
/*
값을 개발자가 원하는 데이터형으로 일시적인 변환을 수행하는 Casting의 사용
값 손실이 발생할 수 있다.
*/

class UseCasting{
	public static void main(String[] args) {
		float f=2023.06F;


		int i=0;

		// i=f;    //byte크기는 같으나 저장하는 값의 종류가 다르기 때문에 error
		i=(int)f;  //실수부가 사라지는 값 손실이 발생한다.

		System.out.println("int : "+i+", float : "+f);

		i=65;
		char c=(char)i;   //4byte의 정수를 2byte의 문자로 
		System.out.println("char : "+c+" , int : "+i);

		double d=0.123456789;
		f=(float)d;
		System.out.println("float : "+f+" , double : "+d);    //foalt: 0.12345679  //맨 끝자리가 반올림해서 올라감

	                                 //	 형명시와 캐스팅의 차이? : 
		float f1=(float)1.23;  // 리터럴은 그대로 두고, 할당할 때 데이터형을 변경하여 할당
		float f2=1.23F;    // 리터럴 자체를 줄여서 저장하고 할당
		System.out.println(f1+" , "+f2);


		//boolean형은 다른 데이터 형으로 casting되지 않는다.
		boolean flag=true;   //0은 false 0,이외는 true
		//  boolean flag1=(boolean)1;      // error  , 다른형은 boolean으로 casting 되지 않음
	   //	i=(int)flag;    // error  , boolean은 다른형으로 casting 되지 않는다.
	   //boolean flag1=flag;  // boolean 은 오직 boolean 으로만 casting이 된다.
	   System.out.println((boolean)flag);

	   //기본형은 참조형으로, 참조형이 기본형으로 casting될 수 없다. 기본형은 기본형 끼리만, 참조형은 참조형 끼리만 casting됨.
	   //String str=(String)i;  //error
	   String str="안녕";
	  // i=str;     // error , int를 string으로 , string을 int로 casting할 수 없다.
	  System.out.println(str);

	  byte num1=10;
	  byte num2=20;
	  byte result=0;

	  result=(byte)(num1+num2);   //계산 순서를 바꿔준다.
	


	  System.out.println(num1+" + "+num2+" = " +result);


	}
}
  