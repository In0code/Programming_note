package day0619;

/**
 * 
 * @author user
 *
 */
public class VariableArguments {
	//1. method 선언
	public void useVariableArgs(int ... param) {
		//variable Arguments는 배열로 처리되므로, 참조형 데이터형이고 주소가 출력된다.
//		System.out.println(param);
		for(int i=0; i < param.length; i++) {
			System.out.println(param[i]);
		}
		
	}//useVariableArgs
	
	public void useVariableArgs2(int j, char c, int ...param ) {

		System.out.println("int : "+j+", char :"+c);
		
		for(int i=0; i < param.length; i++) {
			System.out.println(param[i]);
		}
		
	}//useVariableArgs
	//V.A는 매개변수를 정의할 때 가장 마지막에만 정의할 수 있다.
//	public void useVariableArgs3(int j, char c, int ...param, char c ) {
//	}
	
	public static void main(String[] args) {
		//2. 객체생성: 클래스명 객체명 = new 클래스명():
		VariableArguments va=new VariableArguments();
		va.useVariableArgs(); //호출가능
		va.useVariableArgs(2023); //호출가능
		va.useVariableArgs(0,1,2,3,4,5,6,7,8,9,10,11,12); //호출가능

		System.out.println("----------------------");
		//일반 parameter는 값을 반드시 입력해야 하고, V.A는 생략가능
		va.useVariableArgs2(2023, 'A' );
		va.useVariableArgs2(2024, 'B', 2023,6,19,12,30 );
		
		
		
	}//main

}//class
