/**
대입연산자
 = (순수대입)
 +=, -=, *=, /=, %= (산술대입- 연산된 결과로 변수의 값을 변경)
 <<=, >>=, >>>= (쉬프트대입)
 &=, |=, ^= (비트논리대입)
*/
package day0612;
class Operator7{
	public static void main(String[] args) {
		int i=2;  //순수대입
		//산술대입
		i += 21;  // i = i + 21;
		i -= 10;  // i = i - 10;
		i *= 2;  // i = i * 2;
		i /= 5;  // i = i / 5;  //  정수/정수=정수 // 자바에서 정수 나누기 정수는 정수임. 실수로 안나옴
		i %= 2; // i = i % 2; 
		
		// 쉬프트 대입
		i <<= 5; // i = i << 5;  // 0000 0001 << 5  0010 0000  => 32
		i >>= 2; // i = i >> 2; // 0010 0000 >> 2  0000 1000 => 8
		i >>>=1; // i = i >>>1; // 0000 1000 >>>1  0000 0100 => 4

		//비트논리대입
		i &= 12; // i = i & 12; // 0000 0100 & 0000 1100  =>  0000 0100  =>  4
		i |= 20; // i = i | 20; // 0000 0100 | 0001 0100  =>  0001 0100  =>  20
		i ^= 15; // i = i ^ 15; // 0001 0100 ^ 0000 1111  =>  0001 1011  => 27

		System.out.println( i );

		// integer 클래스의 기능(method)사용
		//클래스명.method명(값)  // 값은 arguments
		int j=25;
		System.out.println( j+"를 2진수로 "+Integer.toBinaryString( j ) );  //0001 1001  //콘솔에는 1인 부분부터 나온다.
		System.out.println( j+"를 8진수로 "+Integer.toOctalString( j ) );  
		System.out.println( j+"를 16진수로 "+Integer.toHexString( j ) );  


	}//main
}//class
