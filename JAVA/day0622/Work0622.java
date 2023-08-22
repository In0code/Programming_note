package day0622;

public class Work0622 {

	// instance variable
	// 접근지정자 데이터형 변수명;
	private String boneNum; // instance variable
	// 생성자: 접근지정자 클래스명 (매개변수)

	public Work0622(String boneNum) { // 생성자
		this.boneNum = boneNum;
	}

	public String getBoneNum() { // getter method
		return boneNum;
	}

	// 입력된 주민번호의 길이가 14자 인지 체크하여 boolean으로 반환하는 method
	public boolean numCheck() {
		boolean flag = false;
		if (boneNum.length() == 14) {
			flag = true;
		}
		return flag;
	}

	// 입력된 주민번호에 '-'이 올바른 위치에 있는지 체크하여
	// boolean으로 반환하는 method 작성
	// 6번째 인덱스 자리에 '-'이 있으면 true, 그렇지 않으면 false
	public boolean checkDash() {
		boolean flag = false;
		if (boneNum.indexOf('-') == 6) {
			flag = true;
		}
		return flag;
	}

	// 입력된 주민번호에서 생년월일을 연산하여 문자열로 반환하는 method작성
	// 반환 예) 입력주민 번호가 991011-2345678이라면 1999년 10월 11일로
	// 반환되어야 합니다
	// 판단 기준 '-' 뒷자리가 1,2,5,6이라면 1900년대생 3,4,7,8,이라면
	// 2000년대생. 0,9라면 1800년대생입니다
	String year = null;
	String birthYear = null;
	String month = null;
	String day = null;
	String lastYear = null;

	public String birthCode() {
		if (boneNum.indexOf("1", 7) == 7 || boneNum.indexOf("2", 7) == 7 || boneNum.indexOf("5", 7) == 7
				|| boneNum.indexOf("6", 7) == 7) {
			year = "19";
			birthYear = (boneNum.substring(0, 2));
			month = (boneNum.substring(2, 4));
			day = (boneNum.substring(4, 6));
//	         System.out.println((year+a)+"년 "+b+"월 "+c+"일");
		} else if (boneNum.indexOf("3", 7) == 7 || boneNum.indexOf("4", 7) == 7 || boneNum.indexOf("7", 7) == 7
				|| boneNum.indexOf("8", 7) == 7) {
			year = "20";
			birthYear = (boneNum.substring(0, 2));
			month = (boneNum.substring(2, 4));
			day = (boneNum.substring(4, 6));
		} else {
			year = "18";
			birthYear = (boneNum.substring(0, 2));
			month = (boneNum.substring(2, 4));
			day = (boneNum.substring(4, 6));

		}
		lastYear = year + birthYear;
		return lastYear + "년 " + month + "월 " + day + "일";
	}

	// 입력된 주민번호에서 나이를 구해서 정수로 반환하는 method를 작성
	int thisYear = 2023;

	public int inputAge() {
		int age = (thisYear - (Integer.parseInt(lastYear)) + 1);
		return age;
	}

	// 입력된 주민번호에서 성별을 구해 문자열로 반환하는 method를 작성하세요
	String thisSex = null;

	public String sex() {
		if (boneNum.indexOf("1", 7) == 7 || boneNum.indexOf("3", 7) == 7 || boneNum.indexOf("5", 7) == 7
				|| boneNum.indexOf("7", 7) == 7 || boneNum.indexOf("9", 7) == 7) {
			thisSex = "남자";
		} else if (boneNum.indexOf("0", 7) == 7 || boneNum.indexOf("2", 7) == 7 || boneNum.indexOf("4", 7) == 7
				|| boneNum.indexOf("6", 7) == 7 || boneNum.indexOf("8", 7) == 7) {
			thisSex = "여자";
		}
		return thisSex;
	}

	String zodiac = null;

	public String inputZodiac() {
		if (Integer.parseInt(lastYear) % 12 == 0) {
			zodiac = "원숭이띠";
		} else if (Integer.parseInt(lastYear) % 12 == 1) {
			zodiac = "닭띠";
		} else if (Integer.parseInt(lastYear) % 12 == 2) {
			zodiac = "개띠";
		} else if (Integer.parseInt(lastYear) % 12 == 3) {
			zodiac = "돼지띠";
		} else if (Integer.parseInt(lastYear) % 12 == 4) {
			zodiac = "쥐띠";
		} else if (Integer.parseInt(lastYear) % 12 == 5) {
			zodiac = "소띠";
		} else if (Integer.parseInt(lastYear) % 12 == 6) {
			zodiac = "호랑이띠";
		} else if (Integer.parseInt(lastYear) % 12 == 7) {
			zodiac = "토끼띠";
		} else if (Integer.parseInt(lastYear) % 12 == 8) {
			zodiac = "용띠";
		} else if (Integer.parseInt(lastYear) % 12 == 9) {
			zodiac = "뱀띠";
		} else if (Integer.parseInt(lastYear) % 12 == 10) {
			zodiac = "양띠";
		}
		return zodiac;
	}

	// 입력된 주민번호에서 띠를 구해서 문자열로 반환하는 method를 작성

	public static void main(String[] args) {
		String boneNum = "991011-2345678";
		Work0622 uw = new Work0622(boneNum);
		if (uw.numCheck()) {
			if (uw.checkDash()) {
				System.out.println("입력주민번호 : " + uw.getBoneNum());
				System.out.println("생년월일 : " + uw.birthCode());
				System.out.println("나이 : " + uw.inputAge());
				System.out.println("성별 : " + uw.sex());
				System.out.println("띠 : " + uw.inputZodiac());

			} else {
				System.out.println("'-'이 정상적인 위치에 없습니다");
			} // endfor

		} else {
			System.out.println("주민번호의 글자수가 맞지 않습니다");
		} // endforr

		// instance 변수 값할당. 객체명.변수명=값;
//	      uw.snn="991011-2345678";
//	      

	}// class
}// main