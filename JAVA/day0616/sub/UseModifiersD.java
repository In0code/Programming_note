package day0616.sub;

import day0616.ModifiersA;

/**
 * ModifiersA의 자식 클래스
 * @author user
 *
 */
public class UseModifiersD extends ModifiersA {

	public static void main(String[] args) {
		//자식클래스(UseModifiersD)는 자신(UseModifiersD)을 생성하여 
		//부모(ModifiersA)의 기능을 사용한다.
		UseModifiersD umd= new UseModifiersD(); //public과 protected를 사용할 수 있다.
		
		System.out.println("public a "+umd.a); //부모의 public과
		System.out.println("protected b "+umd.b); //protected 기능을 사용함
//		System.out.println(" c "+umd.c);  //그러나 자식일지라도 default와
//		System.out.println("private d "+umd.d);  //private은 사용 못함 
		
		
	}//main

}//class
