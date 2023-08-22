package day0622;

public class UseWork0622_t {

	public static void main(String[] args) {
		String ssn = "950120-1234567"; // 입력할 주민 번화

		// 1. 객체화) 일을하는 클래스를 객체로 생성하자
		Work0622_t work = new Work0622_t(ssn);

		// 2.객체가 제공하는 일을 사용)
		if (work.chkSsnLength()) {
			if (work.chkSsnHyphen()) {
				System.out.println("입력한 주민번호 : " + work.getSsn());
				System.out.println("생년월일 : " + work.birth());
				System.out.println("나이 : " + work.age() + "살");
				System.out.println("성별 : " + work.gender());
				System.out.println("띠 : " + work.zodiac());
			} else {
				System.out.println("- 이 정상적인 위치에 없습니다");
			} // end else
		} else {
			System.out.println("주민번호의 글자수가 틀립니다");
		}

	}// main

}// class
