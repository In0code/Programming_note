package day0623;

public class UseArray2 {

	public UseArray2() { // 생성자
		System.out.println("생성자");

	}// UseArray2

	public void arrayUse2() { // method
		// 이차원 배열의 한 행은 일차원 배열로 이루어져 있다
		int[][] arr2 = { { 1, 2, 3, 4, 5 }, { 6, 7, 8, 9, 10 } }; // 2행 5열짜리 배열

		int[] arrTemp = arr2[0]; // 2차원배열의 한 행은 1차원 배열로 이루어져있기때문에
		// 특정 행을 일차원 배열에 할당 할 수 있다
		for (int i = 0; i < arrTemp.length; i++) {
			System.out.print(arrTemp[i]); // 행에는 값은 안들어가는데 배열은 들어간다.
		} // end for
		System.out.println("\n---------------------------------");

		// 일차원 배열을 이차원 배열에 행에 넣을 수 있다.
		// 그러나 주소가 유일하기 때문에 메모리가 살아있어서 굳이 좋은 코드는 아니다
		// 이런코드가 많아지면 많아질수록 메모리가 낭비됨
		int[] arr = { 100, 200, 300, 400, 500 };
		arr2[1] = arr;

		for (int i = 0; i < arr2.length; i++) { // 행
			for (int j = 0; j < arr2[i].length; j++) { // 열
				System.out.print(arr2[i][j] + "\t");
			} // end for
			System.out.println();
		} // end for

	}// arrayUse2

	public static void main(String[] args) {
//		UseArray2 ua2=new UseArray2();
//		ua2.arrayUse2();
		new UseArray2().arrayUse2(); // 객체화 3번

	}// main

}// class
