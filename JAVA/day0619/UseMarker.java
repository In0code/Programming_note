package day0619;


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
		Marker black=new Marker();
		//black마카펜 객체에 "검은색"을 넣어라 
//		black.setColor("검은");    //color을 쓸려고 했는데, private으로 되어있어서 안됨.
		
		// 생성된 마카펜 객체에 값을 설정하는 일  => setter method
		black.setBody(1);
		black.setCap(1);
		black.setColor("검정");

		//생성된 마카펜 객체가 가지고 있는 값을 얻는 일  => getter method
		System.out.println("뚜껑의 수 : "+ black.getCap()+", 몸체의 수 : "+
		black.getBody()+", 색 : "+black.getColor());
		
	
		//2. 객체가 제공하는 기능 사용
		System.out.println(black.write("잘하셨습니다^0^"));   //가변값
		
		
		String wr=black.write("잘하셨습니다^0^");
		System.out.println(wr);
		
		
	}

}
