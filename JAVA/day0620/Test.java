package day0620;

public class Test {

	public int age;   //외부에서 직접 접근 가능
	private int day;   //외부에서 직접 접근 불 가능
	
	public void setDay(int day) {
		//날짜는 1~31일까지이다
		if (!(day > 0 && day < 32))	{//잘못된 날짜가 입력되면 1일로 설정
			day=1;
			}

		this.day=day;
		
	}
	public int getDay() {
		return day;
	}
	
}
