package day0717;

import java.util.Random;

public class UseThrow {
	public String jumin() throws Exception {
		String[] grade = "대딩,고딩,중딩,초딩".split(",");
		String result = "";

		String selectGrade = grade[new Random().nextInt(grade.length)];

		if ("초딩".equals(selectGrade)) {
			throw new Exception("초딩님 금연 좀...");
		} // end if

		// 예외가 발생하면 아래 코드는 실행되지 않는다.
		result = selectGrade + "님 이흡연 중 모른척 총총총..('' )( '')";
		return result;
	}// jumin
	public String jumin2() throws TabaccoException {
		String[] grade = "대학생,고등학생,중학생,초등학생".split(",");
		String result = "";
		
		String selectGrade = grade[new Random().nextInt(grade.length)];
		
		if ("초등학생".equals(selectGrade)) {
			throw new TabaccoException(selectGrade+"님 흡연은 좀");
		} // end if
		
		// 예외가 발생하면 아래 코드는 실행되지 않는다.
		result = selectGrade + "님 이흡연 중 모른척 총총총..('' )( '')";
		return result;
	}// jumin2

	public void useJumin() {
		try {
			String result = jumin();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}//end catch
	}//useJumin
	public void useJumin2() {
		try {
			String result = jumin2();
			System.out.println(result);
		} catch (TabaccoException e) {
			e.printStackTrace();
		}//end catch
	}//useJumin

	public static void main(String[] args) {
		UseThrow ut = new UseThrow();
		ut.useJumin();
		System.out.println("----------");
		ut.useJumin2();
	}// main

}// class
