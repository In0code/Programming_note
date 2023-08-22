package day0615;

/**
 * 다중 for문의 사용. (바깥 for가 한 번 실행될때 안쪽 for는 몇번 실행되는가?)
 * @author user
 *
 */
public class UseFor2 {

	public static void main(String[] args) {

		for (int i= 0; i<5; i++) {  //같은 영역 안에서는 같은 이름의 변수명은 하나만 만들 수 있다.
			for(int j=1; j <6; j++) {
				System.out.println("i= " +i+ " /j = " +j);//다중 for
				
			} //end for
			System.out.println("----------------------------");
		}//end for
		System.out.println("-------------2단------------");
		for (int i=2; i < 10; i++) {  //단은 2단에서부터 시작하여 9단까지 반복
			for(int j=1; j<10; j++) {  //곱해지는 수는 1에서부터 9까지 반복
				System.out.println(i + " * "+j+" = "+i*j);
			}//end for
			System.out.println("-------------"+(i+1)+"단------------");
		}//end for
		
		//i j i j i j i j
		//0 0
		//1 0 1 1
		//2 0 2 1 2 2
		//3 0 3 2 3 2 3 3
		
		//j가 i까지 간다 => for문에 조건식을 건드려야 한다.
		for(int i=0; i<4; i++) {
			for(int j=0; j<=i; j++) {
				System.out.print(i+" "+j+" ");
				
			}//end for
			System.out.println();
		}//end for
		System.out.println();
		
		// 0 0 0 1 0 2 0 3
		// 1 1 1 2 1 3
		// 2 2 2 3
		// 3 3
		
		
		for (int i=0; i<4; i++) {  
			for( int j=i; j<4; j++) {
				
				System.out.print(i+" "+j+" ");
			}
			System.out.println();
		}
		
		
		
		// 1 1 1 1 1
		// 1 0 0 0 1
		// 1 0 0 0 1
		// 1 0 0 0 1
		// 1 1 1 1 1

		System.out.println();
		int k =0;
		for(int i =0; i<5; i++) {  //행을 돌리기 위한 for
			for(int j=0; j<5; j++) {  //열을 돌리기 위한 for	
				k=i==0|| i==4 || j==0 || j==4?1:0;
				//i가 처음행이거나, i가 마지막 행이거나, j이가 처음행이거나, j가 마지막 행이면 1일 출력한다.
				//처음 행이거나 마지막 행이거나 처음 열이거나 마지막 열이라면 1을 그렇지 않다면 0을 넣어준다
				//k변수에 할당하고 출력한다.    
				System.out.print(k+" ");
				
			}//end for
			System.out.println();
		}//end for
		
		
		
		
	}//main

}//class
