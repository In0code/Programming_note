package day0703;

public class Work0630 {
	public static final int NUMBER = 0, UPPER = 1;

	public String modifyName(String fileName) {
		StringBuilder nameBuild = new StringBuilder(fileName);

		if (fileName.contains(".")) {

			nameBuild.insert(fileName.lastIndexOf("."), "_bak");
		} else {
			nameBuild.append("_bak");
		}
		return nameBuild.toString();
	}// modifyName

	public String randomPassword() {
		int flag = 0;
		StringBuilder randomPassword = new StringBuilder();
		double random = 0.0; // 반복무안에서 변수 선언 하지 말기
		for (int i = 0; i < 8; i++) {
			random = Math.random();
			flag = (int) (random * 3); // 숫자, 대문자, 소문자를 판단하는 변수
			switch (flag) {
			case NUMBER:
				randomPassword.append((char) (random * 10 + 48));
				break;
			case UPPER:
				randomPassword.append((char) (random * 26 + 65));
				break;
			default:
				randomPassword.append((char) (random * 26 + 97));
				break;
			}// switch
		} // for
		return randomPassword.toString();
	}// randomPassword

	// 배열을 출력하면 주소가 나옴. 근데 유일하게 character형의 배열은 값이 나옴. 문자열처럼
	public String pass2() {
		char[] passWord = new char[8];
		int random = 0;
		for (int i = 0; i < passWord.length; i++) {
			random = (int) (Math.random() * 123);
			if ((random > 48 && random < 57) || (random > 64 && random < 91) || (random > 96 && random < 123)) {
				passWord[i] = (char) random;
			} else {
				i--;
			} // end else
		}

		return new String(passWord);
	}// pass2

	public String pass3() {
		StringBuilder sbPass = new StringBuilder();

		String passChar = "sfhge54541df5ge654gdfgg5G454SVSVS465654654tyuio05";

		int ind = 0;
		for (int i = 0; i < 8; i++) {
			ind = (int) (Math.random() * passChar.length());
			sbPass.append(passChar.charAt(ind));

		} // end for

		return sbPass.toString();
	}// pass3

	public void printPassword() {
		System.out.println("임의의 비밀 번호는 " + randomPassword() + "입니다.");
		System.out.println("임의의 비밀 번호는 " + pass2() + "입니다.");
		System.out.println("임의의 비밀 번호는 " + pass3() + "입니다.");
	}// printPassword

	public static void main(String[] args) {
		Work0630 work = new Work0630();
		System.out.println(work.modifyName("test.tttt.txt"));
		work.printPassword();
		// 배열을 출력하면 주소가 나옴. 근데 유일하게 character형의 배열은 값이 나옴. 문자열처럼
//		char[] arr= {'a','a','n','b','아'};
//		System.out.println(arr);  //다른 배열과 달리 char[]은 값이 출력된다.
	}

}
