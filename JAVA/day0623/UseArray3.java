package day0623;

/**
 * 삼차원 배열
 * 
 * @author user
 *
 */
public class UseArray3 {

	public void arrayUse1() {
		// 1.선언) 데이터형[][][]배열명=null;
		int[][][] arr = null;
		// 2.생성) 배열명=new 데이터형[면의수][행의수][열의수];
		arr = new int[3][2][3];
		// 3.값할당) 배열명[면][행][열]=값;
		arr[0][0][0] = 10;
		arr[1][0][0] = 20;
		arr[2][1][2] = 30;
		// 4.값사용) 배열명[면][행][열]
		// 일괄처리
		System.out.println(arr[0][0][0] + " / " + arr[0][0][1]);
		for (int i = 0; i < arr.length; i++) { // 면
			for (int j = 0; j < arr[i].length; j++) { // 행
				for (int k = 0; k < arr[i][j].length; k++) { // 열
					System.out.printf("arr[%d][%d][%d]=%d\t", i, j, k, arr[i][j][k]);

				} // end for
				System.out.println();
			} // end for
			System.out.println();

		} // end for
	}// arrayUse1

	public void arrayUse2() {
		// 기본형 형식의 사용
		// 값을 면구분 괄호와 행구분 괄호로 구분한다.
		int[][][] arr = { { { 1, 2 }, { 3, 4 }, { 5, 6 } }, { { 7, 8 }, { 9, 10 }, { 11, 12 } } };
		System.out.println("면의 수 : " + arr.length);
		System.out.println("행의 수 : " + arr[0].length);
		System.out.println("열의 수 : " + arr[0][0].length);

		for (int i = 0; i < arr.length; i++) { // 면
			for (int j = 0; j < arr[i].length; j++) { // 행
				for (int k = 0; k < arr[i][j].length; k++) { // 열
					System.out.printf("arr[%d][%d][%d]=%d\t", i, j, k, arr[i][j][k]);
				} // end for
				System.out.println();
			} // end for
			System.out.println();
		} // end for
	}// arrayUse2

	public static void main(String[] args) {
		UseArray3 ua3 = new UseArray3(); // 객체는 하나만 만들고 method를 부른다
		ua3.arrayUse1();
		System.out.println("--------------------------------------------------");
		ua3.arrayUse2();

	}// main

}// class
