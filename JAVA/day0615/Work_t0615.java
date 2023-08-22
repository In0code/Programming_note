
package day0615;

/**
 * 제시된 요금표를 사용하여 아래 출력코드를 작성.
		 
		  교통수단과 이동거리를 입력받아 프로그램을 작성한다.

		  출력형식) 
		  입력한 교통수단 마을버스,버스,지하철 인 경우에는 아래와 같이 출력하고
		  그렇지 않다면 “대중교통수단이 아닙니다.”를 출력

		 아래
		 입력하신 교통수단  XX 이고, 이동거리는 XXkm이다.
		 교통수단의 기본요금은 XX입니다.
		 편도요금 XX원, 왕복요금 XX원 한달 20일 기준이용 총 이용요금 XX입니다. 
		10km까지는 기본 요금이고,
		이동거리가 10km를 초과하면
		 매 5km마다  100원이 가산된다.
 * @author user
 *
 */
public class Work_t0615 {
	//기준값으로 사용할 Constant
	public static final int TOWN_BUS=800;
	public static final int BUS=1250;
	public static final int SUBWAY=1300;
	
	public static void main(String[] args) {
	 if(args[0].equals("마을버스") || args[0].equals("버스") || args[0].equals("지하철")) {
		 int fare=0; // 대중교통인 경우에만 변수를 만들자
		 int distance=Integer.parseInt(args[1]); // 입력된 이동 거리를 저장한 변수
		 int overFare=0;
		 
		 
		 //입력된 대중 교통의 기본 요금을 구하자.
		 if (args[0].equals("마을버스")) {
			 fare=TOWN_BUS;
		 }else if(args[0].equals("버스")) {
			 fare=BUS;
		 }else {
			 fare=SUBWAY;
		 }
		 overFare=fare;
		 //초과요금을 구하기 위한 코드 작성
		 //10km까지는 기본요금, 이동거리가 10km를 초과하면, 매 5km마다 100원 초과
		 if(distance > 10) { //10km를 초과했을 때에만 초과요금을 계산한다.
			 overFare=overFare+(((distance-10)/5)+1)*100;
			 
		 }//end if
		 
		 
		 //출력하는 부분  //출력하는 부분과 업무를 처리하는 부분을 분할하자
		 System.out.println("입력하신 교통수단 "+args[0]+ " 이고. 이동거리는 "+distance+"km이다.");
		 System.out.println(" 교통수단의 기본요금은 "+fare+ " 원 입니다. 초과요금 "+overFare+"원");
		 System.out.println(" 편도요금은 "+fare+ " 원, 왕복요금 "+overFare*2+
				 "원 한달 20일 기준이용 총 이용요금 "+overFare*40+"입니다.");
		 
	 }else {
		 System.out.println(args[0]+"는 대중교통 수단이 아닙니다.");
	 }
	 
 }
}