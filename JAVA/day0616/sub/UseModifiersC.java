package day0616.sub;

import day0616.ModifiersA;

public class UseModifiersC {

	public static void main(String[] args) {
	//다른패키지(day0616)의 클래스를 사용 : public만 사용가능
		ModifiersA ma=new ModifiersA();
		
		System.out.println("public a "+ma.a);  //public만 사용 가능
//		System.out.println("protected b "+ma.b);
//		System.out.println(" c "+ma.c);
//		System.out.println("private d "+ma.d);
		
		
		
	}//main

}//class
