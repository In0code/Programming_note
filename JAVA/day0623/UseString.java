package day0623;

public class UseString {

	public UseString() {
		String csvData = "Java,Oracle,JDBC~HTML,CSS,JavaScript";
		// 배열로 생성
		String[] arr = csvData.split(","); // 꼭 콤마가 아니어도 괜찮다.
		System.out.println(arr.length);
		for (int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);

		} // end for
	}// UseString

	public static void main(String[] args) {
		new UseString();

	}// main

}// class
