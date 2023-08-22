package day0623;

public class VariableArray {
	
	public VariableArray() {

		// 1. 선언) 데이터형[][]배열명=null;
		int[][]arr=null;
		// 2. 생성) -열을 설정하지 않는  배열명=new 데이터형[행의수][];
		arr=new int[5][];
		// 3. 행마다 열을 생성) 배열명[행의번호]=new 데이터형[열의수]
		arr[0]=new int[5];
		arr[1]=new int[3];
		arr[2]=new int[] {1,2,3,4,5,6,7,8,9};  //값을 집어넣을 때에는 열의 크기를 설정하지 않는다
		arr[3]=new int[2];
		arr[4]=new int[4];
		
		for(int i=0; i<arr.length; i++) {
			System.out.printf("arr[%d]행의 열의 수 %d 개\n",i,arr[i].length);
		}//end for
		// 4. 값할당) 배열명[행의번호][열의번호]=값;
		arr[0][0]=10;
//		arr[4][4]=20;  //4행은 있는데 4열은 없다 -> error
		arr[4][3]=20;
		
		// 5. 값사용) 배열명[행의번호][열의번호];
		System.out.println(arr[0][0]+" / "+arr[0][1]);
		
		//모든 방의 값을 개선된 for loop 출력
		for(int[] arr1: arr) {
			
			for(int value : arr1) {
				System.out.print(value+" ");
			}
			System.out.println();
		}

	}// VariableArray

	public static void main(String[] args) {
		new VariableArray();

	}// main

}// class
