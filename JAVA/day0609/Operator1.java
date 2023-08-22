/**
단항 연산자
~ , ! , + , - , ++ , --
*/
package day0609;
public class Operator1 {
	public static void main(String[] args) {
		int i= 6;
		int j= -9;
		
		// ~ : 1의 보수 연산 
		System.out.println("~"+ i+" = " + ~i );   //  ~6 => -7
		System.out.println("~"+ j+" = " + ~j );   // ~ -9 => 8
		
		//i는 6이 할당되어 있다. ~를 사용하여 -6으로 만들어 출력해보세요
		
		System.out.println(~i+1);

		// ! : NOT  //  tru <=> false
		//!은 true나 false앞에만 사용할 수 있다
		// System.out.println( !3 );
		System.out.println( !true );
	//	System.out.println( ! 3 < 4 );  // error => 연산의 우선 순위때문에 낫(!)이 먼저 계산 되는데, 낫 3은 안됨.
		System.out.println( ! (3 < 4) );
		boolean flag=6>9;
		System.out.println( !flag );

    	// ~ : 2의 보수 연산 , 부호바꿈연산
		System.out.println("-"+ i+" = " + -i );   //  -6 => -6
		System.out.println("-"+ j+" = " + -j );   // - -9 => 9

		// + : 형식적 제공
		System.out.println("+"+ i+" = " + +i );   //  +6 => 6
		System.out.println("+"+ j+" = " + +j );   // + -9 => -9

		// ++, --
		i= 10;
		j=5;
	System.out.println("설정된 값 i : " + i + ", j : "+j);

		// 전위 연산 : 연산자 대상체
		--i;   //10 -> 9
		++j;  // 5-> 6      //한 번 쓸때마다 1씩 감소
		// 후위 연산 : 대산체 연산자
		i--;   //9 -> 8
		j++;;  //6 ->7     //한 번 쓸때마다 1씩 증가

		//대상체가 가지고 있는 값을 변경하고 유지한다.
		System.out.println("연산 이후 값 i : " + i + ", j : "+j);

		// ++ : 대상체의 값을 1씩 증가시킨다
		// -- : 대상체의 값을 1씩 감소시킨다.
		//++, --는 전위와 후위가 다른 값을 대입 시킨다.

		// 전위 : 내 것 먼저 => 증가, 감소 후 대입 수행
		i=6;
		int result=0;
		result= ++i;

		System.out.println("전위 연산 후 i : " +i+ ", result: "+result);  // i=7 , result=7

		// 후위 : 남의 것 먼저 : 대입을 수행 한 후 증가, 감소를 수행
		i=6;
		result=0;
		result= i++;

		System.out.println("후위 연산 후 i : " +i+ ", result: "+result);  // i=7 , result=6
		
		

		i=10;
		j=5;
		//method에 값으로 사용될 때에도 동일한 동작을 수행
		System.out.println("i : "+ ++i +", j : "+ j++);  //값을 더하기 전에 이미 출력됨
		System.out.println(i+" / "+j);  //값이 더해지고 출력 되서 6

		//int k=10++;  // 상수는 값을 변경할 수 없기 때문에 ++, --를 사용할 수 없다.

	}//main
}//class
