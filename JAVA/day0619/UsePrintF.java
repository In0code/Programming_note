package day0619;

public class UsePrintF {

	public static void main(String[] args) {
		int age=25;
		int year=2023;
		//올해는 2023년 내 나이는 25세를 콘솔에 출력해보세요
		System.out.println("올해는 "+year+" 년 내 나이는 "+age+" 세");  
		//이래도 되는데, 메세지, 값, 메시지 , 값, 이렇게 마구마구 섞여 있음. 
		//println은 출력 메시지와 출력 값이 섞이게 된다.
		
		//printf는 출력메시지와 출력값이 구분된다.
		System.out.printf("올해는 %d년 내 나이는 %d세\n", year, age);
		System.out.format("올해는 %d년 내 나이는 %d세\n", year, age);
		
		
		System.out.printf("[%d][%6d][%-6d]\n",year,year,year);
		
		char c='A';
		System.out.printf("[%c][%5c][%-5c]\n",c,c,c);
		
		double d=2023.619;
		System.out.printf("[%f][%8.1f][%-8.1f][%.2f]\n",d,d,d,d);
		//공백을 주지 않고 소수점 이하 두자리까지만 출력하고 싶으면  [%.2f]
		
		boolean flag=true;
		System.out.printf("%b\n",flag);
		
		String msg="오늘은 월요일 입니다";
		String msg2="오후 폭염 ";
	
		System.out.printf("%s,[%10s]\n",msg,msg2);
		
		
	//오늘은 2023년 6월 19일 입니다. 내이름은 김인영입니다.키는 165입니다.
		int yr=2023;
		int month =6;
		int day =19;
		String name="김인영";
		double tall=165.3;
		
		System.out.printf("오늘은 %d년 %d월 %d일입니다.내이름은 %s입니다. 키는 %.1f입니다",yr,month,day,name,tall);
		
		
		//error : 출력문자와 출력 값의 개수가 맞지 않을 경우 
//		System.out.printf("오늘은 %d년 %d월 입니다..",2023);
		
		//error : 출력문자와 출력 값의 데이터형이 맞지 않을 경우 
//		System.out.printf("오늘은 %d년 %d월 입니다..",2023,6.20);   //실수의 출력문자는 f이다.
		
		
	}//main

}//class
