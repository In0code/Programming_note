package day0717;

@SuppressWarnings("serial")
public class TabaccoException extends Exception {

	public TabaccoException() {
		super("지나친 건강은 흡연에 해롭습니다람쥐");
		
	}// TabaccoException
	
	public TabaccoException(String msg) {
		
		super(msg);
		
	}// TabaccoException

}// class
