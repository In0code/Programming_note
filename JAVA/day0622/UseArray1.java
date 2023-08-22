package day0622;

//import java.util.Arrays;
//import java.util.Iterator;

/**
 * 일차원 배열의 사용
 * 
 * @author user
 *
 */
public class UseArray1 {
	public void arrayUse1() {
		// 1. 선언) 데이터형[] 배열명=null;
		int[] arr = null;
		int arr1[] = null;
		// 2. 생성) 배열명=new 데이터형[방의 수];
		arr = new int[5]; // heap에 생성이 되면서 모든 방의 값이 초기화 된다.
		System.out.println(arr + " 배열의 방의 개수 : " + arr.length); // 참조형 데이터형은 실행하면 주소가 나온다
		// 3. 값할당) 배열명[방의 번호]=값;
		arr[0] = 10;
		arr[4] = 2023;
		// 4. 값사용) 배열명[방의번호]
		System.out.println(arr[0] + " / " + arr[1]);

//		System.out.println(arr[0]);
//		System.out.println(arr[1]);
//		System.out.println(arr[2]);
//		System.out.println(arr[3]);
//		System.out.println(arr[4]);  
		// 이코드를 봤을때 index만 다르다. 그러니깐 돌리면 됨

		for (int i = 0; i > arr.length; i++) {
			System.out.printf("arr[%d]=%d\t", i, arr[i]);
		}

		System.out.println();

	}// arrayUse1

	public static final int FLAG_SCORE = 83;

	public void arrayUse2() {
//		int[] score= {83,99,77,64,93,70};   
		int[] score = /* new int[]가 생략 */ { 83, 99, 77, 64, 93, 70 };
		System.out.printf("시험 응시자 [%d]명\n", score.length);
		// 일괄처리
		System.out.println("번호\t점수");
		System.out.println("===========");
		for (int i = 0; i < score.length; i++) {
			System.out.printf("%d\t%d\n", i + 1, score[i]);
		}
		int sum = 0;
		System.out.println("===========");
		for (int i = 0; i < score.length; i++) {
			sum += score[i];

		}
		double d = (double) sum / score.length;
		System.out.printf("총점[%d]\n", sum);
		System.out.printf("평균[%.2f]\n", d);
		System.out.println("===========");
//		System.out.println("[%d]",j);

		// score배열의 마지막 방부터 처음 방까지 출력
		for (int i = score.length - 1; i > -1; i--) {
			System.out.print(score[i] + " ");
		}
		System.out.println();
		// 점수중에 최고 점수
		int top = score[0];
		for (int i = 1; i < score.length; i++) {
			if (top < score[i]) {
				top = score[i];
			}

		}
		System.out.println("최고점은 " + top);
		// score배열의
		int[] score1 = { 83, 99, 77, 64, 93, 70, 83, 78, 83, 20 };
		// 83점과 같은 점수를 받은 학생의 수를 몇 명인지 출력
		// 최고점과 최저점 차이 출력 99-20
//		int total=0;
//		for (int i=0; i<score1.length; i++) {
//			if (score1[i]==score1[0]) {
//				total+=1;
//			}
//		}
//		System.out.println("학생수 : "+total);

		int cnt = 0;
		for (int i = 0; i < score1.length; i++) {// 배열의 시작부터 끝까지 반복 시키기 위해서
			switch (score1[i]) {// 반복중인 배열 방의 점수를 비교
			case FLAG_SCORE:
				cnt++;
			}
		}
		System.out.println(FLAG_SCORE + "점과 같은 점수를 받은 학생의 수" + cnt);

//		int top1=score1[0];
		int low = score1[0];
		for (int i = 1; i < score1.length; i++) {
			if (top < score1[i]) {
				top = score1[i];

			}
			if (low > score1[i]) {
				low = score1[i];
			}

		}
		System.out.println("최고점 " + top + "점과 최저점 " + low + "점의 차이는 " + (top - low));

		int[] score2 = { 83, 99, 77, 64, 93, 70 };
		// score배열의 값을 99,93,83,77,70,64의 형태로 바꾼 후 출력 (내림 차순)
		int temp = 0; // 배열 방의 값을 임시로 저장
		for (int i = 0; i < score2.length; i++) { // 현재 방의 값을 반복
			for (int j = i + 1; j < score2.length; j++) {// 현재방부터 뒤에 존재하는 방의 값을 반
//				System.out.println(i+""+j+"");
				if (score2[i] < score2[j]) {// 앞방이 (i) 뒤방보다(j) 작다면
					temp = score2[i]; // 앞방의 값을 임시 변수에 넣고
					score2[i] = score2[j]; // 뒷방의 값을 앞방에 넣고
					score2[j] = temp; // 임시변수의 값을 앞방에 넣는다
				}
			}
			System.out.print(score2[i] + " ");
		}
//		System.out.println(Arrays.toString(score2));
//		for (int i=0; i<score2.length; i++) {
//			System.out.print(score2[i]+" ");
//		}

//		for(i=0; i<score2.length; i++) {
//			int j=i+1;
//			for (j=0; j<score.length; j++) {
//				if (score[i]<score[j]) {
//					temp=score[i];
//					score
//				}
//			}

//		}
//		for(int i=0; i<score.length; i++) {
//			score[i];
//		}
//		for
//		i<score.length;
//		int j=i+1;
//		j<score2.length

	}// arrayUse2

	public static void main(String[] args) {

		UseArray1 ua1 = new UseArray1();

		ua1.arrayUse1();
		System.out.println("----------------");
		ua1.arrayUse2();

	}// main
}// class
