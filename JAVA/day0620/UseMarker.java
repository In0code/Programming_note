package day0620;

//import java.awt.Color;

/**
 * Marker클래스를 객체로 생성하여 사용하는 일을 하는 클래스
 * @author user
 *
 */
public class UseMarker {

	public static void main(String[] args) {

		
		
		//마카펜 객체가 제공하는 기능을 사용하기 위해 객체화
		//클래스명 객체명 = new 클래스명();
		//1. 객체생성
		Marker black=new Marker();  //setter method를 부를 필요가 업ㅈㅅ어짐

		//생성된 마카펜 객체가 가지고 있는 값을 얻는 일  => getter method
		System.out.println("뚜껑의 수 : "+ black.getCap()+", 몸체의 수 : "+
		black.getBody()+", 색 : "+black.getColor());
		
	
		//2. 객체가 제공하는 기능 사용
		System.out.println(black.write("잘하셨습니다^0^"));   //가변값
		
		
		String wr=black.write("잘하셨습니다^0^");
		System.out.println(wr);
		
		//빨간색 마카펜을 만들어서 어쩔티비 저쩔티비 뇌절티비 출력
		Marker red=new Marker(1,2,"red");   //생성자의 overloading
//		red.setColor("빨간");
		System.out.println("뚜껑의 수 : "+ red.getCap()+", 몸체의 수 : "+
				red.getBody()+", 색 : "+red.getColor());
		
		System.out.println(red.write("어쩔~저쩔~ 어쩔티비 저쩔티비 뇌절티비"));
	
	}

}
