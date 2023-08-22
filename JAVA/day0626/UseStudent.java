package day0626;

public class UseStudent {

	public static void main(String[] args) {

		// 학생 한 명의 정보를 저장
		Student stu = new Student("김인영", 25, 165.6, 51.0, "1011kiy@naver.com");
		System.out.printf("학생명 : %s 나이 : %d, 키 : %.1f, 몸무게 : %.1f, 이메일 : %s\n", stu.getName(), stu.getAge(),
				stu.getHeight(), stu.getWeight(), stu.getEmail());

		// 학생 여러명의 정보를 저장 => 일괄처리 => 배열
		// 1. 배열선언
		Student[] strList = new Student[3]; // 모든 방의 값이 null로 초기화

		// 2. 모든 방의 값이 null로 초기화
		for (int i = 0; i < strList.length; i++) {
			System.out.println(strList[i]); // null
		} // end for

		// 3. 배열의 각 방의 값을 설정
		strList[0] = new Student("김영재", 29, 166.6, 59.2, "aholic@naver.com");
		strList[1] = new Student("김아영", 27, 162.6, 49.2, "kay0319@naver.com");
		strList[2] = new Student("김동준", 30, 171.6, 61.2, "0607@naver.com");

		System.out.println("이름\t나이");
		for (int i = 0; i < strList.length; i++) {
			System.out.println(strList[i].getName() + "\t" + strList[i].getAge()); // null
		} // end for

		// 위에 거 보다 조금 더 간단하게
		System.out.println("이름\t나이\t키");
		Student temp = null;
		for (int i = 0; i < strList.length; i++) {
			temp = strList[i];
			System.out.println(temp.getName() + "\t" + temp.getAge() + "\t" + temp.getHeight()); // null
		} // end for

	}// main

}// class
