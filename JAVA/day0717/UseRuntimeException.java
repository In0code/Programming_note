package day0717;

/**
 * RuntimeException :<br>
 * 개발자가 try~catch를 하지 않아도 error가 발생하지 않는 예외<br>
 * 
 * @author user
 *
 */
public class UseRuntimeException {

	public static void main(String[] args) {
		// arguments로 두 수를 입력받아 나눈 후 결과를 출력하는 일.
		try {
			int num = Integer.parseInt(args[0]);
			int num2 = Integer.parseInt(args[1]);

			int result = 0;

			result = num / num2;
			// out : 정상 출력의 의미
			System.out.println(num + " / " + num2 + " = " + result);
		} catch (ArrayIndexOutOfBoundsException aioobe) {
			// err : 에러 출력의 의미
			System.err.println("사용법) java UseRuntimeException 값1 값2 형식으로 사용해주세요");
			System.err.println(aioobe.getMessage());
			// -> 간단한 메시지여서 어디서 error가 발생했는지 모른다
			System.err.println(aioobe); // 예외발생객체와 간단한 메시지
			aioobe.printStackTrace(); // 자세한 예외 메시지
		} catch (NumberFormatException nfe) {
			System.err.println("값은 숫자형태만 입력 가능한디요");
			nfe.printStackTrace();
		} catch (ArithmeticException ae) {
			System.err.println("0으로 나눌 수 없는디요");
			ae.printStackTrace();
		} catch (Exception e) { // 부모이므로 모든 예외를 다 잡을 수 있다.
			System.err.println("개발자가 인지하지 못한 예외를 처리");
		}finally {
			System.out.println("반드시 실행될 코드정의");  //예외가 나든 예외가 안다든 반드시 실행되어야할
			System.out.println("사용해줘서 감사감사링");
		}
	}// main

}// class
