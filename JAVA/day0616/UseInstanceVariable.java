package day0616;

/**
 * instance(member)variable의 사용
 * -특정 객체의 속해(member)있는 변수
 * -같은 이름의 변수를 여러 객체에서 가지고 있고, 객체마다 따로 사용한다.
 * -객체화 후 사용.
 * @author user
 */
public class UseInstanceVariable {
//1. 선언: 
	
	private int age;  //instance 변수
//	private int time;  //쓰지도 않을 변수는 만들지도 않는게 기본.
	//변수가 가지고 있는 중요도를 생각해서 public을 주든 private를 주든 하면 됨
	//모르겠으면 그냥 private를 줘라!
	
	public static void main(String[] args) {
//		age=10; //static 영역에서는 instance 변수를 직접 사용할 수 없다.
		//2. 겍체 생성) instance 변수를 사용하기 위해서
		//클래서명 객체명 = new 클랙스명();
		UseInstanceVariable uiv = new UseInstanceVariable(); 
		UseInstanceVariable uiv2 = new UseInstanceVariable();  
		
		//Static은 하나의 객체를 바꾸면 전체가 바꼈는데, 얘는 안그럼. 공용변수와는 다르다.
		//instance변수는 객체가 각각 쓴다.
		//uiv객체가 가진 변수를 수정하면 uiv만 변경된다. 다른 객체에 영향을 주지 않는다
		uiv.age=25;
		System.out.println("uiv객체가 가진 age : "+uiv.age);
		System.out.println("uiv2객체가 가진 age : "+uiv2.age);
		
		//변수들의 각각 특징을 알아야 한다. 암기!!
		
//instance variable은 특정 객체마다 생성되고 사용되는 변수
	//집 안에 엄마, 아빠, 나 라는 객체가 있는데 그 객체들은 각자의 개인 휴대폰을 가지고 있는 것처럼.
	//공용이 아니다. 공유가 안된다.
		
	//instance variable에서는 static을 붙이면 안된다.
		
	}//main

}//class
