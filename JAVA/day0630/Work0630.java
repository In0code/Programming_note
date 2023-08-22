package day0630;

public class Work0630 {

	public Work0630() {
	}

	/**
	 * 문자열로 파일명을 입력받아 백업 파일명(파일명_bak.확장자)<br>
	 * 을 만들어서 반환하는 method를 작성<br>
	 * .없다면 파일명 가장 뒤에 _bak를 붙여서 반환<br>
	 * ex) <br>
	 * "test.txt" 입력 -> "test_bak.txt" 반환 <br>
	 * "test" 입력 -> "test_bak" 반환
	 * 
	 * @param args 파일명
	 */
	public void printFile(String[] args) {

		StringBuilder sb1 = new StringBuilder();
		 sb1.append(args[0]);
		String dot = ".";

		if (args[0].contains(".")) {
			sb1.insert(sb1.lastIndexOf(dot), "_bak");
		} else {
			sb1.append("_bak");
		} // end if
		System.out.println(sb1);
	}// printFile

	/**
	 * 대문자, 소문자, 숫자로 구성된 임의의 8자리 비밀번호를 만들어<br>
	 * 반환하는 일을하는 method를 작성하고 <br>
	 * 해당 method를 호출하여 비밀번호를 출력하는 method 작성
	 */
	public void passWord() {
		StringBuilder sb = new StringBuilder(8);

		double c = 0.0;
		int capitalLetter = 0;
		double s = 0.0;
		int smallLetter = 0;
		double n = 0.0;
		int number = 0;
		for (int i = 0; i < 3; i++) {
			c = Math.random();
			capitalLetter = (int) ((c * 26) + 65);
			s = Math.random();
			smallLetter = (int) ((s * 26) + 97);
			n = Math.random();
			number = (int) (n * 10);
			sb.append((char) capitalLetter);
			sb.append((char) smallLetter);
			sb.append(number);

		} // end for
		System.out.println("비밀번호 : " + sb.substring(0, 8));
	}// passWord

	public static void main(String[] args) {

		Work0630 wk = new Work0630();
		wk.printFile(args);
		System.out.println("------------------------");
		wk.passWord();

	}// main

}// class
