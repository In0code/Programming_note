package day0704;

import java.util.Arrays;
import java.util.Random;

public class UseRandom2 {
	// 1. 1~45사이의 수를 6개 발생시켜 배열에 넣고 반환하는 일 method 작성
	public int[] lotto() {
		int[] lotto = new int[6];
		Random ran = new Random();

		int num = 0;
		for (int i = 0; i < lotto.length; i++) {
			lotto[i] = ran.nextInt(45) + 1; // 발생한 난수를 마지막 방에 넣고
			for (int j = 0; j < i; j++) { // 발생된 난수가 이전 방에 들어있는 지 확인
				if (lotto[j] == lotto[i]) {// 같은 값이 있다면
					i--;// 바깥 for에서 사용하는 index를 감소시키고
					break;// 안쪽 for를 빠져나간다
				} // end if
			} // end for
		} // end for
		return lotto;
	}// lotto
	
		// 2. 위의 일을 호출하여 오름차순으로 정렬하여 출력하는 method를 작성
	public void printLotto() {
		int[] lotto = lotto();
		Arrays.sort(lotto);//배열 정렬
		System.out.println(Arrays.toString(lotto));//출력
//		for (int value : lotto) {
//			System.out.print(value + " ");
//		} // end for
		
	}// printLotto

	public static void main(String[] args) {

		// 3. 2번 method를 호출하여 로또번호를 출력한다.
		UseRandom2 ur = new UseRandom2();
		ur.printLotto();
	}// main

}// class
