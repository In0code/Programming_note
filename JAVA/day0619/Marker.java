package day0619;

/**
 * 마카펜의 기능을 구현한 클래스
 * 마카펜 ┬ 명사적 : 뚜껑, 몸체, 색
 *      └ 동사적 : 쓴다
 * @author user
 *
 */
public class Marker {
	private int cap;   //instance variable
	private int body;
	private String color;
	
	public void setCap (int cap) {
		this.cap=cap;
	}
	public void setBody (int body) {
		this.body=body;
	}
	public void setColor (String color) {
		this.color=color;
	}
	

	public int getCap() {    //고정값   - 반환값 있고, 매개변수 없는 형
		return cap;
	}
	public int getBody() {   
		return body;
	}
	public String getColor() {    
		return color;
	}
	
	
	/**
	 * 마카펜의 동사적인 특징을 구현한 method
	 * 입력받은 메시지를 칠판에 쓰는 일
	 * @param msg 칠판에 쓸 메시지
	 * @return 행동
	 */
	public String write(String msg) {   //매개변수와 반환값이 있으니깐 가변값
		return color+"색인 마카펜으로 칠판에 "+msg+"를 쓴다.";
	}//write

}//class
