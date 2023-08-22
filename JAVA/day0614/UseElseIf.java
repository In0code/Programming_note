package day0614;

/**
 * else~if (다중 if) <br>
 * 연관된 여러 조건을 비교해야할 때 사용.
 * 
 * @author user
 *
 */
public class UseElseIf {

	public static void main(String[] args) {
		//점수의 판정: 0보다 작은지? 100보다 큰지, 범위 안에 있는지?
		int score = 101;
		
		System.out.print(score + " 점은");
		
		if (score < 0) {
			System.out.println(" 0보다 작을 수 없습니다");
		}else if (score > 100){
			System.out.println(" 100보다 클 수 없습니다");
		}		

		
		//arguments로 자바, C, Python이 입력 되었을 때에면 동작하는 코드 작성.
		//입력값이 자바라면 1995를 int형에 변수에 넣고, c라면 1972년, 그렇지 않다면 1971년을 변수에 넣고
		// 변수값을 출력
		
		if(args[0].equals("java") || args[0].equals("C") || args[0].equals("Python")) {
			int year;
		
			if (args[0].equals("java"))  {
			year=1995;
			}else if (args[0].equals("C")){
			year=1972;
			}else {
			year=1991;
			}
			System.out.println(args[0]+"의 출시 년도는 "+ year);
		
		}
		
		
		//태어난 해를 입력받아 띠를 출력하는 코드 작성
		//int sodiacFlag=year%12 로 변수를 설정해 줘도 되고 그냥 안에다가 넣어줘도 됨.
		//flag변수 : 어떤 일을 하는데 기준 점이 되는. 코드를 실행하는 기준 값을 설정하는 변수
		//단일 if를 써도 되는데, 띠라는 것이 서로 연관되어 있기때문에 단일 if보다는 else if쓰는 것이 더 적합하다.
		
		
		int year=1999;
		if (year % 12 ==0){
			System.out.println(year+"년도는 원숭이띠");
		}else if (year % 12 ==1){
			System.out.println(year+"년도는 닭띠");
		}else if (year % 12 ==2){
			System.out.println(year+"년도는 개띠");
		}else if (year % 12 ==3){
			System.out.println(year+"년도는 돼지띠");
		}else if (year % 12 ==4){
			System.out.println(year+"년도는 쥐띠");
		}else if (year % 12 ==5){
			System.out.println(year+"년도는 소띠");
		}else if (year % 12 ==6){
			System.out.println(year+"년도는 호랑이띠");
		}else if (year % 12 ==7){
			System.out.println(year+"년도는 토끼띠");
		}else if (year % 12 ==8){
			System.out.println(year+"년도는 용띠");
		}else if (year % 12 ==9){
			System.out.println(year+"년도는 뱀띠");
		}else if (year % 12 ==10){
			System.out.println(year+"년도는 말띠");
		}else if (year % 12 ==11){
			System.out.println(year+"년도는 양띠");
		}
		
		
		
	}// main

}// class
