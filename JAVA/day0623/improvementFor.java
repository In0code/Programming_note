package day0623;

/**
 * 배열, java.util.List, java.util.Set의 값을 인덱스를 사용하지 않고 <br>
 * 처음 부터 끝까지 간단한 코드로 출력할 때.<br>
 * for ( 데이터형 변수명 : 배열명){ <br>
 * 변수명 <br>
 * }
 * 
 * @author user
 *
 */
public class improvementFor {

	public improvementFor() {
		int[] arr = new int[] { 2023, 6, 23, 16, 3 };
		for (int value : arr) { // 인덱스를 사용하지 않고, 처음방부터 끝 방까지 출력.
			System.out.print(value + " ");
		} // end for
		System.out.println();

		String[] strArr = "Java,Oracle,JDBC,HTML,CSS".split(",");
		for (String value : strArr) {
			System.out.print(value + " ");
		} // end for
		System.out.println("----------------------------------------");
		int[][] arr2 = { { 1, 2, 3 }, { 4, 5, 6 } };

		// 이차원 배열의 한 행은 일차원 배열로 이루어져 있다.
		for (int[] arr1 : arr2) {// 행
			// 일차원 배열의 각 방은 단일형으로 이루어져 있다.
			for (int value : arr1) { // 열
				System.out.println(value + " ");
			} // end for
			System.out.println();
		} // end for
		System.out.println("---------------------------");
		int[][][] arr3 = { { { 1, 2, 3 }, { 4, 5, 6 } }, { { 7, 8, 9 }, { 10, 11, 12 } } };

		// 삼차원 배열의 한 면은 이차원 배열로 이루어져 있다.
		for (int[][] intArr2 : arr3) { // 면
			// 이차원 배열의 한 행은 일차원 배열로 이루어져 있다.
			for (int[] intArr1 : intArr2) { // 행
				// 일차원 배열은 단일형으로 이루어져 있다.
				for (int value : intArr1) {// 열
					System.out.print(value + " ");
				} // end for
				System.out.println();

			} // end for
			System.out.println();
		} // end for

	} // improvementFor

	public static void main(String[] args) {
		new improvementFor();

	}// main

}// class
