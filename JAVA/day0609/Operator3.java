/**
쉬프트 연산자
 << , >> , >>>
 */
package day0609;
class Operator3{
	public static void main(String[] args) {

		// << : left shift : 비트를 왼쪽으로 밀고, 밀어서 빈칸을 항상 0으로 채운다
		int i =20;

	//	System.out.println(i+ "<< 2 = " + i << 2);  // error 연산의 우선순위 때문에 더하기가 먼저 연산이 되서 문자를 연산하려 함.
		System.out.println(i+ "<< 2 = " + (i << 2));
		
		i=5;
		System.out.println(i+ " << 4 + " + (i<< 4));  //0000 0101 << 4 = 0101 0000

		i=1;
		System.out.println(i+ " << 31 = " + (i<< 31));  // 값이 1일때 31칸 이상 밀지 않는다. (다시 되돌아감)

		i=35;
		System.out.println(i+ " >> 2 = " + (i>> 2));
		
		i=-1;  // 1111 1111 1111 1111 1111 1111 1111 1111
		System.out.println(i+ " >> 100 = " + (i>> 100  )); 

		i=35;
		System.out.println(i+ " >>> 2 = " + (i>>> 2));

		i=40;
		System.out.println(i+ " >>> 1 = " + (i>>> 1));

		i=-1;
		System.out.println(i+ " >>> 1 = " + (i>>> 1));
	
		//문자열은 연산되지 않는다. error
		//	System.out.println("10"*10);    //error
		//문자열은 + 를 사용하여 문자열 앞 뒤에 값을 붙일 수 있다.

	}
}
