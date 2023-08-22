/**
산술 연산자
+, -, *, /, %(나눈 나머지 : 큰수를 지정한 몇 가지의 수로 만들때 사용)
*/

package day0609;
class Operator2 {
	public static void main(String[] args) {
		int num=10;
		System.out.println(num+ "를 2가지의 수 : " + num % 2);  //0, 1중 하나가 나온다.          //0
		System.out.println(num+ "를 3가지의 수 : " + num % 3);  //0, 1, 2 중 하나가 나온다.      //1
		System.out.println(num+ "를 4가지의 수 : " + num % 4);  // 0, 1, 2, 3 중 하나가 나온다.  //2

		int birth=1999;

		System.out.println(birth + "년 " +birth%12);   //0,1,2,3,4,5,6,7,8,9,10,11

		 
	}//main
}//class
