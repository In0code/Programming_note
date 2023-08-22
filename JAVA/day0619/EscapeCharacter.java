package day0619;

/**
 * 특수문자 : 문자열 안에서 \ 뒤에 나오는 하나의 기능을 가진 문자.
 * @author user
 *
 */
public class EscapeCharacter {

	public static void main(String[] args) {
		//console에 안녕하세요?를 출력하는 코드를 작성
		String hi="안녕하세요";
		System.out.println(hi);
		System.out.println("안녕하세요"); 
		System.out.println("'안녕하세요?'");
		
		System.out.println("\"안녕하세요\"");
		
		System.out.print("안녕\n");
		System.out.print("하세요");
		
		//c드라이브 하위에는 temp폴더가 있고, 그 안에는 test.txt파일이 존재한다.
		//이 경로를 콘솔창에 출력해보세요.
		System.out.println("\nc:\\temp\\test.txt");
		//지원하지않는 특수문자는 사용할 수 없다. \d 나 \e를 나는 그렇게 생각하지 않았지만, java는 특수문자로 판단했기 때문에 error가 난다.
		//그래서 java에서는 경로를 쓸때 역슬래스가 아니라 슬래스로 / 쓰는 것을 권장한다.
		System.out.println("e:\\dev\\env.bat"); //유효한 특수문자가 아니면 쓸 수 없다. \d와 \e는 없기때문에 error가 뜬다.
		                                        //그래서 \\ 로 써줘야함.
		
		
		

	}//main

}//class
