package day0622;

/**
 * 이차원 배열 : 행과 열로 구성된 배열. <br>
 * 1.선언) 데이터형[][] 배열명=null <br>
 * 2.생성) 배열명=new 데이터형[행의수][열의수]; <br>
 * 3.값할당) 배열명[행의번호][열의번호]=값; <br>
 * 4.값사용) 배열명[행의번호][열의번호]
 * 
 * @author user
 *
 */
public class UseArray2 {

	public void arrayUse1() {
		// 1.선언
		int[][] arr = null;
		// 2.생성
		arr = new int[3][4]; // 3행4열
		System.out.println(arr + "의 행수 : " + arr.length + ",열의 수 : " + arr[0].length);
//		for (int i=0; i< arr.length; i++) {
//			System.out.printf("arr[%d]행 열의 수 %d \n",i,arr[i].length);
//		}//모든 행의 열의 수는 같다.

		// 3.값할당
		// arr[0]=10; //error //이차원 배열은 행에 값을 할당할 수 없다.
		arr[0][0] = 10;
		arr[0][3] = 20;
		arr[2][3] = 50;
		// 4.값사용
		System.out.println("이차원 배열의 한 행은 1차원 배열로 이루어져 있다." + arr[0]); // 이차원 배열의 한 행은 1차원 배열로 이루어져 있다. 그래서 주소가 나옴
		System.out.println(arr[0][0] + " / " + arr[0][1]);

		// 일괄처리
		for (int i = 0; i < arr.length; i++) {// 행을 반복하기 위한 for
			System.out.println(i + "행시작");
			for (int j = 0; j < arr[i].length; j++) { // 열을 반복하기 위한 for
				System.out.printf("arr[%d][%d]=%d \t", i, j, arr[i][j]);
			} // end for
			System.out.println("\n" + i + "행끝");
		} // end for

	}// arrayUse1

	public void arrayUse2() { // 기본형은 new int를 생략할 수 있다.
		// 이차원 배열은 행구분 괄호로 행을 만든다.
		int[][] arr = /* new int[][] */ { { 1, 2, 3, 4, 5, 6 }, { 7, 8, 9, 10, 11, 12 } };

		System.out.println("행 : " + arr.length + ", 열 : " + arr[0].length);

		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				System.out.printf("arr[%d][%d]=%d\t", i, j, arr[i][j]);
			} // end for
			System.out.println();
		} // end for
	}// arrayUse2

	public void arrayUse3() {
		// 10행 7열인 이차원 배열을 생성하고 아래와 같이 값을 넣은 후 출력해보세요
		int[][] arr1 = { { 1, 1, 1, 1, 1, 1, 1 }, { 1, 0, 0, 0, 0, 0, 1 }, { 1, 0, 0, 0, 0, 0, 1 },
				{ 1, 0, 0, 0, 0, 0, 1 }, { 1, 0, 0, 0, 0, 0, 1 }, { 1, 0, 0, 0, 0, 0, 1 }, { 1, 0, 0, 0, 0, 0, 1 },
				{ 1, 0, 0, 0, 0, 0, 1 }, { 1, 0, 0, 0, 0, 0, 1 }, { 1, 1, 1, 1, 1, 1, 1 } };
		for (int i = 0; i < arr1.length; i++) {
			for (int j = 0; j < arr1[i].length; j++) {
				System.out.print(arr1[i][j] + " ");
			}
			System.out.println();
		}
		System.out.println();

		int[][] arr = new int[10][8]; // 배열은 생성이 되면 모든 방이 초기화가 된다.
		for (int i = 0; i < arr.length; i++) { // 행
			for (int j = 0; j < arr[i].length; j++) { // 열
				if (i == 0 || i == arr.length - 1 || j == 0 || j == arr[i].length - 1) {
					arr[i][j] = 1;
				}

				System.out.printf("%-4d", arr[i][j]);
			}
			System.out.println();
		}

//		for(int i=0; )
//		

	}// arrayUse3

	public static void main(String[] args) {
		UseArray2 ua2 = new UseArray2();
		ua2.arrayUse1();
		System.out.println("-------------------");
		ua2.arrayUse2();
		System.out.println("-------------------");
		ua2.arrayUse3();

	}// main

}// class
