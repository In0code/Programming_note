package day0626;

public class Work0626 {

	public static void main(String[] args) {
		// 학생의 이름과 사는 곳, 나이를 사용자 정의 데이터 형으로 배열을 생성하여 저장
		Work0626VO[] studentList = new Work0626VO[7];
		studentList[0] = new Work0626VO("강다연", "경기도 수원시 영통구 영통동", 26);
		studentList[1] = new Work0626VO("김다영", "서울시 강남구 역삼동\t", 25);
		studentList[2] = new Work0626VO("김선경", "서울시 강남구 서초동\t", 25);
		studentList[3] = new Work0626VO("김주민", "마계인천시 부평구 부편동", 26);
		studentList[4] = new Work0626VO("박상준", "서울시 동대문구 동대문동", 27);
		studentList[5] = new Work0626VO("홍찬영", "수원시 수원동\t", 30);
		studentList[6] = new Work0626VO("장영석", "서울시 구로구 구로동\t", 28);
		System.out.println("이름\t주소\t\t\t나이");

		int youngNameSum = 0;
		// 학생의 이름과 사는 곳, 나이를 출력하는 일
		for (int i = 0; i < studentList.length; i++) {
			System.out.println();
			System.out.println(
					studentList[i].getName() + "\t" + studentList[i].getAddress() + "\t" + studentList[i].getAge());

			// 이름에 "영'이 들어가는 학생의 개수를 출력하는 일
			if (studentList[i].getName().contains("영")) {  
				youngNameSum += 1;
			} // end if
		} // end for

		String soulLiveName = null;
		int allPlusAge = 0;
		System.out.println("----------------------------------------");
		System.out.println("이름에 \"영\"이 들어가는 학생 : " + youngNameSum + "명");
		System.out.print("서울시에 살고있는 사람 : ");

		// 서울시에 살고 있는 학생의 이름을 출력하는 일
		for (int i = 0; i < studentList.length; i++) {
			if (studentList[i].getAddress().startsWith("서울시")) { //startWith로 써야함
				soulLiveName = studentList[i].getName();
				System.out.print(soulLiveName + ", ");
			} // end if

			// 모든 학생의 나이를 합산하여 출력하는 일
			allPlusAge += studentList[i].getAge();
		} // end for
		System.out.println();
		System.out.println("전체 학생 나이의 합 : " + allPlusAge + "살");
	}// main

}// class