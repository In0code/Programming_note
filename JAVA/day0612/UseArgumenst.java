/**
main method의 arguments 입력
사용법) 
   java 클래스명 값 값 값 값 값 값,,,,,
*/
package day0612;
class UseArgumenst {
	public static void main(String[] args) {


	// 주의 : 입력되지 않는 번호를 사용하면 error가 발생
	// java UseArguments ABC DEF
	//main 안에서 args[0], args[1] 는 괜찮은데 args[2]는 존재하지 않기 때문에 error가 난다. 2번 index는 존재하지 않기 때문에 에러

	System.out.println( args[0] );
	System.out.println( args[1] );
	System.out.println( args[2] );  //문자만 됨. args[2]*2 하면 error  //  args는 문자열이므로 연산자를 사용한 연산을 할 수 없다.
	
		

	}//main  
}//class
