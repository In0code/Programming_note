package day0717;

/**
 * 입력받은 단을 사용하여 구구단을 출력하는 일을 하는 method를 작성합니다. - 구구단을 출력하는 method를 호출하여 사용하는
 * method 를 작성합니다.
 * 
 * 유효성 : -구구단은 2~9단 까지이며, 입력된 단이 해당범위가 아닐 때에는 예외를 발생시켜 처리합니다.
 * 
 * -구구단예외는 java에서 제공되지 않으니 사용자 정의 예외처리 클래스로 작성해 보세요
 * 
 * @author user
 *
 */
public class Work0717 {

	public void timesTable(String args) throws TimesTableException {
		// 입력된 단이 2~9가 아닐 때 예외 발생
		int a = Integer.parseInt(args);
		if (a < 2 || a > 9) {
			// 사용자 정의 예외처리 클래스 호출
			throw new TimesTableException("값은 1~9까지의 범위여야 함");
		}
		// 구구단을 출력하는 일
		System.out.println("**" + a + "단" + "**");
		for (int i = 1; i < 10; i++) {
			System.out.println(a + " x " + i + "=" + a * i);
		} // end for

	}// timesTable

	public static void main(String[] args) {
		try {
			new Work0717().timesTable(args[0]);
			;
//			System.out.println(result);
		} catch (TimesTableException e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		} // end catch
	}// main

}// class
