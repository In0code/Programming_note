/**
입력되는 문자열을 정수(byte, short, int, long)나 실수(float, double)로 변환
*/
package day0612;
class UseArguments2 {
	public static void main(String[] args) {
	//	int i = args[0]; //args는 String형 이므로 int형인 i변수에 할당 될 수 없다.
	int i=Integer.parseInt( args[0] );
	double d= Double.parseDouble( args[1] );     // 입력 문자열이 반드시 숫자 형태이어야 한다.

	System.out.println (i+ " + 2 = "+( i + 2 ));

	System.out.println (d+ " + 2.5 = "+( d + 2.5 ));

	System.out.println( args[2].equals("안녕") );  // 2번째가 "안녕"과 같니?  맞으면 true, 틀리면 false


	//args[3]에 입력된 값이 자신의 이름이라면 "앗!나다!!" , 그렇지 않다면 "입력된 이름님 안녕하세요?"를 출력	
	System.out.println( args[3].equals("김인영") ? "앗!나다!!": args[3]+"님 안녕하세요?");


	}
}
