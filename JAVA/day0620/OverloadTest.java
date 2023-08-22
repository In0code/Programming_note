package day0620;

public class OverloadTest {

	//호출되면 * (별)을 하나 출력하는 method를 작성
	//method의 이름은 star
	/**
	 * 별을 하나 출력하는 일
	 */
	public void printStar() {
		System.out.print("★");
	}//printStar
	
	//호출되면 * (별)을 입력되는 개수만큼 출력하는 method를 작성
	//class 안에서 같은 이름의 method는 하나만 만들 수 있음
	//그래서 호출될 때 식별되게 만들면 된다. 매개변수를 줘서
	
	/**
	 * 입력하는 수 만큼의 별을 출력하는 일
	 * @param cnt 출력할 별의 개수
	 */
	public void printStar(int cnt) {
		for (int i=0; i<cnt; i++) {
		System.out.print("☆");
		
		}//end for
	}//printStar
//	public void OverloadTest
	
	public static void main(String[] args) {
		OverloadTest ot= new OverloadTest();
		ot.printStar();
		ot.printStar(4);
		
		
		
		
		

	}//main

	
}//class
