package day0616;

public class UseModifiersA {

	public static void main(String[] args) {
	//같은 패키지의 다른 클래스에서는 private을 제외한 모든 자원을 사용할 수 있다.
		ModifiersA ma= new ModifiersA();
		
		
		System.out.println("public a "+ma.a);
		System.out.println("protected b "+ma.b);
		System.out.println(" c "+ma.c);
//		System.out.println("private d "+ma.d); //private이라서 밖에서 안보인다! 사용할 수X
		
		
	}//main

}//class
