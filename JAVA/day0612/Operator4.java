/**
관계연산자
>, < >=, <=, ==, !=
*/
package day0612;
class Operator4{

	public static void main(String[] args) {
	// == 같니? 같을 때 true, 다르면 false
	int i=6, j=12, k=6;

	System.out.println(i+ " == "+k + " = "+ (i == k));  //error  //문자에 + 가 붙어서 i가 문자가 되는데, 문자에는 연산을 사용할 수 없으니깐 괄호를 써줘야함
	boolean flag=i==j;  //관계가 먼저 되고, 대입이 된다.
	System.out.println(i+ " == "+j + " = "+ flag);   

	// != 다르니? 다르면 true, 같으면 false

	
	System.out.println(i+ " != " +k + " = "+ (i != k));  //error  //문자에 + 가 붙어서 i가 문자가 되는데, 문자에는 연산을 사용할 수 없으니깐 괄호를 써줘야함
	flag=i != j;  //관계가 먼저 되고, 대입이 된다.
	System.out.println(i+ " != "+j + " = "+ flag);   

	//default(initial) value = 초기화 값, 기본값 .  같은 영역에서는 같은 이름의 변수는 하나만 선언할 수 있다.

	}//main
}//class
