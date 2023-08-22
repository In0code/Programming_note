package day0609;
class Work0609 {

	public static final int MONTH_MONEY=300000;
	public static final int DAY=20;
	
	public static void main(String[] args) {

	/*출력.
	1. 한달 용돈은 xxxx원 하루 용돈은 20일 기준으로  xxx 원입니다.
	하루 사용 비용은 편도 교통비 xxx원  왕복교통비 xx원 점심식대 xxx원으로
	 총 xxx 원 입니다.
	한달이 지나면 남은 금액 xx원 입니다. */

	int oneDayMoney=MONTH_MONEY/DAY;
	int oneWayTransCoast=1350;
	int twoWayTransCoast=oneWayTransCoast*2;
	int lunchCoast=5000;
	int oneDayCoast=twoWayTransCoast+lunchCoast;
	int remainingAmount= (oneDayMoney-oneDayCoast)*DAY;

	System.out.println("한달 용돈은 "+MONTH_MONEY+"원 하루 용돈은 "+
		DAY+"일 기준으로 "+oneDayMoney+"원 입니다.\n"+
		"하루 사용 비용은 편도 교통비 "+oneWayTransCoast+"원 왕복 교통비 "+
		twoWayTransCoast+"원 점심식대 "+lunchCoast+"원으로 총 "+
		oneDayCoast+"원 입니다.\n\n한달이 지나면 남는 금액"+
		remainingAmount+"원 입니다.");


	/*2. API에서 기본형 데이터 형에 대한 Wrapper class를 찾아보고,
   최대값과 최소값을 가지고 있는 Constant가 존재한다면
   아래와 같이 출력해 보세요.*/
   
	System.out.println("\nbyte의 최소값 "+Byte.MIN_VALUE+" 최대값 "+Byte.MAX_VALUE+" \nshort의 최소값 " +Short.MIN_VALUE+" 최대값 "+Short.MAX_VALUE);

	/*출력 예)
    byte의 최소값 -128  최대값 127
    short의 최소값 -32768 최대값 32767*/





		
	}
}
