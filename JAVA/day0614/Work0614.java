package day0614;

public class Work0614 {
		public static final int VIREGE_BUS_COST=800;
		public static final int BUS_COST=1250;
		public static final int SUBWAY=1300;
		public static final int FIFTEEN_KM=15;
		public static final int TWENTY_KM=20;
		public static final int TWENTYFIVE_KM=25;
		public static final int THIRTY_KM=30;
		public static final int THIRTYFIVE_KM=35;
		public static final int FORTY_KM=40;
		
	public static void main(String[] args) {
//		제시된 요금표를 사용하여 아래 출력코드를 작성.
//		 
//		  교통수단과 이동거리를 입력받아 프로그램을 작성한다.
//
//		  출력형식) 
//		  입력한 교통수단 마을버스,버스,지하철 인 경우에는 아래와 같이 출력하고
//		  그렇지 않다면 “대중교통수단이 아닙니다.”를 출력
//
//		 아래
//		 입력하신 교통수단  XX 이고, 이동거리는 XXkm이다.
//		 교통수단의 기본요금은 XX입니다.
//		 편도요금 XX원, 왕복요금 XX원 한달 20일 기준이용 총 이용요금 XX입니다. 
//		10km까지는 기본 요금이고,
//		이동거리가 10km를 초과하면
//		 매 5km마다  100원이 가산된다.
		
		int basiccost = 0;
		//int onewaycost =0;
		int onewaycoast=0;
		
		if (args[0].equals("마을버스") || args[0].equals("버스") || args[0].equals("지하철" )){
			System.out.println("입력하신 교통수단은 "+args[0]+"이고, 이동거리는 "+args[1]+"km 이다." );
			if (args[0].equals("마을버스")) {
				basiccost=VIREGE_BUS_COST;
				System.out.println("교통수단의 기본요금은은 "+basiccost+"입니다.");
				}
			}else if (args[0].equals("버스")) {
				basiccost=BUS_COST;
				System.out.println("교통수단의 기본요금은은 "+basiccost+"입니다.");
			}else if (args[0].equals("지하철" )) {
				basiccost=SUBWAY;
				System.out.println("교통수단의 기본요금은은 "+basiccost+"입니다.");
			}
			
			else {
			System.out.println("대중교통수단이 아닙니다.");
		}
		
		//int i=Integer.parseInt(args[1]);
//		for (int i=Integer.parseInt(args[1]); i >10 && i % 5 ==0; i++ ) {
//			onewaycost= basiccost + 100;
		
	
		if (Integer.parseInt(args[1]) > 10) {
			if(Integer.parseInt(args[1]) ==FIFTEEN_KM) {
//				onewaycost=basiccost+100;
			}
			if(Integer.parseInt(args[1]) ==TWENTY_KM) {
//				onewaycost=basiccost+200;
			}  
			if(Integer.parseInt(args[1]) ==TWENTYFIVE_KM) {
//				onewaycost=basiccost+300;
			}
			if(Integer.parseInt(args[1]) ==THIRTY_KM) {
//				onewaycost=basiccost+400;
			}
			if(Integer.parseInt(args[1]) ==THIRTYFIVE_KM) {
//				onewaycost=basiccost+500;
			}
			if(Integer.parseInt(args[1]) ==FIFTEEN_KM) {
//				onewaycost=basiccost+100;
			}
		
		}
//	
//		for (int i=11; i>10 && i % 5 == 0; i++) {
//			onewaycost= 
//		}
//		
//		 if (Integer.parseInt(args[1]) == 15 ) {
//			 num=  basiccoast += 100
//					 
			 
		 


	}

}
