package day0630;

/**
 * StringBuilder
 * 
 * @author user
 *
 */
public class UseStringBuilder {

	public void useStringBuilder() {
		// 1. 생성
		StringBuilder sb = new StringBuilder();
		// 2. 값 붙이기)
		sb.append(2023);
		sb.append("년"); // 처음에는 어떤 문자열을 가지고 있었는지 모른다
		sb.append("6월 30일");
		sb.append(6.30); // 실수
		// 3. 기존의 값 사이에 추가
		sb.insert(5, "인천시의 자랑 김선경");
		// 4. 삭제
		sb.delete(9, 12);
		// 인천시 앞에 "마계"추가
		sb.insert(5, " 마계 ");

		System.out.println(sb + " / " + sb.length());
	}// useStringBuilder

	public void useStringBuffer() {
		// 1. 생성
		StringBuffer sb = new StringBuffer();
		// 2. 값 붙이기)
		sb.append(2023);
		sb.append("년"); // 처음에는 어떤 문자열을 가지고 있었는지 모른다
		sb.append("6월 30일");
		sb.append(6.30); // 실수
		// 3. 기존의 값 사이에 추가
		sb.insert(5, "인천시의 자랑 김선경");
		// 4. 삭제
		sb.delete(9, 12);
		// 인천시 앞에 "마계"추가
		sb.insert(5, " 마계 ");

		System.out.println(sb + " / " + sb.length());

	}// useStringBuffer

	public static void main(String[] args) {

		UseStringBuilder usb = new UseStringBuilder();
		usb.useStringBuilder();
		System.out.println("---------------------------------");
		usb.useStringBuffer();

	}// main

}// class
