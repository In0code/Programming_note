package day0704;

import java.util.Random;

/**
 * 난수를 사용할 목적으로 만들어진 클래스
 * 
 * @author user
 *
 */
public class UseRandom {
	public UseRandom() {
		// 1. 생성)
		Random random = new Random();
		// 왜 주소가 나왔을까? toString을 overriding하지 않았기 때문에
		System.out.println(random);
		
		// 2.method호출
		// 정수의 난수
		int num = random.nextInt(); // -21억 ~ +21억 사이의 수 중 하나가 나온다
		System.out.println(Math.abs(num % 10)); // %범위의수

		num = random.nextInt(10); // nextInt(범위의수)
		System.out.println(num);

		// 실수의 난수
		System.out.println(random.nextDouble());
		System.out.println(random.nextFloat());
		// (casing)(nextDouble()*발생할 수)
		System.out.println((int) (random.nextDouble() * 10));

		// 블린난수
		boolean flag = random.nextBoolean();
		System.out.println(flag);
		
		//1~45의 수 중 하나를 출력
		num=random.nextInt();
		System.out.println(Math.abs(num%45)+1);
		
		
	}// UseRandom

	public static void main(String[] args) {
		new UseRandom();

	}// main

}// class
