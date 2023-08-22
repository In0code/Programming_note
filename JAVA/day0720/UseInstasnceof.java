package day0720;

import java.io.Serializable;

import day0627.Clark;
import day0627.Person;

/**
 * instance of <br>
 * 객체가 어떤 클래스에서 생성되었는지 비교하는 연산자
 * 
 * @author user
 *
 */
public class UseInstasnceof {

	public void usePerson(Object obj) {
		if (obj instanceof Person) {
			System.out.println("Person으로 생성된 객체");
		} else {
			System.out.println("Person과는 상관 없는 객체");
		} // end else

	}// usePerson

	public void useSerializable(Object obj) {
		if (obj instanceof Serializable) {
			System.out.println("객체 직렬화 가능");
		} else {
			System.out.println("객체 직렬화 불가능");
		} // end else

	}// useSerializable

	public static void main(String[] args) {
		UseInstasnceof ui = new UseInstasnceof();
		Clark cl = new Clark();
		ui.usePerson(cl);
		day0629.Clark cl2 = new day0629.Clark();
		ui.usePerson(cl2);
		
		String str="오늘 점심은 뭐 먹지?";
		ui.useSerializable(str);
		Object obj=new Object();
		ui.useSerializable(obj);
		
	}// main
}// class
