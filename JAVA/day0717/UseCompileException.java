package day0717;

/**
 * 개발자가 반드시 처리해야하는 Compile Exception
 * 
 * @author user
 *
 */
public class UseCompileException {

	public static void main(String[] args) {

		try {
			// 컴파일 예외는 개발자가 반드시 처리해야한다.
			Class c = Class.forName("java.lang.String");
			System.out.println(c+"을 로딩하였음");
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		}finally {
			System.out.println("반드시 실행되어야 할 코드");
		}//end finally

	}// main

}// class
