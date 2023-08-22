package day0608;
class Work0608{

	public static void main(String[] args) {

/*출력 1.
내 이름은 홍길동이고 이니셜은 H  G  D 입니다. 
태어난 해 는 xxxx년으로 나이는 xx 살입니다.*/

	String name="김인영";
	char initial1 ='K';    //변수의 명은 소문자로 시작
	char initial2 ='I';
	char initial3 ='Y';
	int yearOfBirth=1999;
	int thisYear=2023;
	int age=thisYear-yearOfBirth;

		System.out.println("내 이름은 " +name+"이고 이니셜은 "
		+initial1+initial2+initial3+"입니다. 태어난 해는 "+ yearOfBirth+"년으로 나이는 "+age+"살입니다.");
  
   /*출력 2.
   왼눈 시력 xx.x 오른 눈 시력 xx.x   양안시력  xx.x 입니다.*/
   double lefteye=10.4;
   double righteye=10.6;
   double botheye=(lefteye+righteye)/2;

		System.out.println("왼눈 시력 "+lefteye+" 오른눈 시력 "+righteye+" 양안시력 "+botheye+"입니다.");

   /*출력3. 
 편도 차비 xx원 왕복차비 xx 원 입니다. 한달 20일 출근을 하면 
 월 교통비는 총  xx원 입니다.*/

	int oneWayFare=1350;
	int twoWayFare= oneWayFare*2;
	int oneMonthFare=twoWayFare*20;

		System.out.println("편도 차비 "+oneWayFare+"원 왕복차비 "+twoWayFare+" 원 입니다. 한달 20일 출근을 하면 월 교통비는 총"+oneMonthFare+"원 입니다.");


  /*출력 4.
  대문자 ‘A’의 코드 값은 65 입니다. A+32를 하면 소문자 ‘a’를 만들 수 있습니다.*/

  	char capitalLetter='A';
	int codeValue=(char)capitalLetter;
	int smallLetter=capitalLetter+32;
	char a=(char)smallLetter;

	System.out.println("대문자 '"+capitalLetter+"'의 코드 값은"+codeValue+"입니다. A+32를 하면 소문자'"+a+"'를 만들 수 있습니다");


  	



	
	}
}
