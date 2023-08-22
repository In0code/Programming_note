package day0630;

public class UseMath {
	public UseMath() {
		int i = -6;
		double d = -2023.06;

		System.out.println(i + "의 절대값 : " + Math.abs(i));
		System.out.println(d + "의 절대값 : " + Math.abs(d));
		
		d=3.55;
		System.out.println(d+"의 반올림 : "+ Math.round(d));
		
		d=10.01;
		System.out.println(d+"의 올림 : "+Math.ceil(d));
		
		d=10.9;
		System.out.println(d+"의 내림 : "+Math.floor(d));
		System.out.println(d+"의 절사 : "+(int)(d));

		
		//random number
		//0.0000000000000000 ~0.99999999999999999 중 하나의 수가 나온다
		d=Math.random();
		System.out.println("발생한 수 : "+d);
		System.out.println("범위의 수 : "+d*10);  //10개의 난수 0.0 ~ 9.0
		
		//casting이 먼져 되면 0이 나오므로 d*10에 괄호를 해서 우선순위를 바꿔줘야한다
		int num=(int)(d*10); 
		System.out.println("범위의 수에서 정수 : "+num);  //10개의 난수 0.0 ~ 9.0
		
		//1~10까지 임의의 수 하나를 얻어 출력해보세요
		num=(int)(d*10)+1; 
		System.out.println("1~10까지 임의의 수 : "+num);
		
		//대문자 A의 코드 값은 65 입니다. 대문자 Z의 코드값은 90
		//알파벳(26자) 대문자 중 임의의 문자 하나를 풀력
//		char c=(char)(d*26+65);
//		System.out.println(c);
		System.out.println("대문자 A~Z : "+(char)((Math.random()*26)+65));
		//소문자 a의 코드 값은 97 입니다. 소문자 z의 코드값은 122
		System.out.println("소문자 a~z : "+(char)((Math.random()*26)+97));  //소문자
		
		//숫자 0의 코드 값은 48 입니다. 숫자 9의 코드값은 57
		//숫자 0~9 중 임의의 숫하나를 출력
		System.out.println("숫자 0~9 : "+(char)((Math.random()*10)+48));  //소문자
		
	
		
	}// UseMath

	public static void main(String[] args) {
		new UseMath();
	}// main

}// class
