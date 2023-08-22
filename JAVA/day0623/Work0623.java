package day0623;

/**
 * 학생의 점수를 처리하는 프로그램 작성.
 * 
 * @author user
 *
 */
public class Work0623 {
	/**
	 * 학생의 총점을 구하는 일
	 * 
	 * @param score 점수를 저자한 일차원 배열
	 * @return 일차원 배열의 누적합
	 */
	public int studentTotal(int[] score) {
		int totalScore = 0;
		for (int i = 0; i < score.length; i++) {
			totalScore += score[i];
		} // end for
		return totalScore;
	}// studentTotal

	/**
	 * 점수를 구하는 일
	 */
	public void scoreProcess() {
		String[] names = { "김선경", "김주민", "박상준", "서효민", "송지하", "오호수" };
		int[][] score = { { 84, 87, 79 }, { 91, 100, 97 }, { 75, 79, 79 }, { 63, 66, 62 }, { 99, 99, 99 },
				{ 82, 86, 83 } };

		System.out.println("--------------------------------------------------------");
		System.out.println("번호\t이름\t자바\t오라클\tJDBC\t총점\t평균");
		System.out.println("--------------------------------------------------------");
		int total = 0; // 반복문 안에서 변수를 선언하면 안된다. 프로그래밍을 느리게 만든다.
		double studentAverage = 0;
		int javaTotal = 0;
		int oracleTotal = 0;
		int jdbcTotal = 0;
		double javaAverage = 0;
		double oracleAverage = 0;
		double jdbcAverage = 0;
		int topScore = 0;
		String topName = null;
		int topNum = 0;
		topScore = studentTotal(score[0]);
		for (int i = 0; i < score.length; i++) {
			System.out.printf("%d\t%s\t", i + 1, names[i]);

			for (int j = 0; j < score[i].length; j++) {
				System.out.printf("%d\t", score[i][j]);
			} // end for

			javaTotal += score[i][0];
			oracleTotal += score[i][1];
			jdbcTotal += score[i][2];
			total = studentTotal(score[i]); // method해서 총점 구하기
			studentAverage = total / score[0].length;
			javaAverage = javaTotal / names.length;
			oracleAverage = oracleTotal / names.length;
			jdbcAverage = jdbcTotal / names.length;
			System.out.printf("%d\t%.2f\n", total, studentAverage);
			// 최고 점 구하고 1등 학생 번호, 이름 구하기
			if (topScore < studentTotal(score[i])) {
				topScore = studentTotal(score[i]);
				topName = names[i];
				topNum = i + 1;
			} // end if

		} // end for

		System.out.println("--------------------------------------------------------");

		System.out.printf("\t총점");
		System.out.printf("\t%d\t%d\t%d", javaTotal, oracleTotal, jdbcTotal);
		System.out.println();
		// 자바, 오라클, JDBC, 전체 평균
		System.out.printf("\t평균");
		System.out.printf("\t%.2f\t%.2f\t%.2f", javaAverage, oracleAverage, jdbcAverage);
		// 1등 학생의 이름과 번호를 출력
		System.out.println();
		System.out.println("--------------------------------------------------------");
		System.out.printf("1등 총점 : %d점\n1등 학생 : %d번 %s ", topScore, topNum, topName);

		System.out.println();

	}// scoreProcess

	public static void main(String[] args) {
		new Work0623().scoreProcess();

	}// main
}// class