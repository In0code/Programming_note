package day0616;

/**
 * method의 4가지 형태
 * @author user
 *
 */
public class MethodTypes {
	
	/**
	 * 반환 값 없고, 매개변수 없는 형 (instance method)
	 * 객체화 해야함
	 */
	public void typeA() {
		System.out.println("고정적인 일");
	}//typeA
	
	
	/**
	 * 반환 값 없고, 매개변수 없는 형 - 가변적인 일
	 * @param i 매개변수
	 */
	public void typeB(int i) {
		System.out.println("가변적인 일"+ i);
	}//typeB
	
	
	/**
	 * 반환형 있고, 매개변수 없는 형 - 고정 값 
	 * @return 정수형의 값
	 */
	public int typeC() {  //반드시 return이 필요하다. return 안쓰면 error
		return 6;
	}
	
	
	/**
	 * 반환형 있고, 매개변수 있는 형 - 가변 값
	 * @param d 입력값
	 * @return 반환값
	 */
	public int typeD( double d) {
		
		return (int)d;  //casting 필요
	}
	
	public static void main(String[] args) {
		//객체화: 클래스명 객체명=new 클래스명;
		MethodTypes mt = new MethodTypes();
		for (int i=0; i<10; i++) {
		mt.typeA(); //밖에서의 값을 받지도 않고 내보내지도 않는다. 고정적이다. 어떤 값을 넣어도 값이 고정적이다.
		mt.typeB(i);
		}
		
		mt.typeB(6);
		mt.typeB(16);// 부를때마다 다른 값이 들어간다.
		mt.typeB(26);
		 
		int i=mt.typeC();  //변수에 할당 가능
		System.out.println("고정값 : "+i);
		System.out.println("고정값 : "+(mt.typeC()+5));  //연산에 참여 가능. 그 자체로 값이기 때문에
		
		
		i=mt.typeD(6.16);
		System.out.println("가변 값 : "+i);
		
		//i=mt.typeD(2023.6)
		System.out.println("가변 값 : "+mt.typeD(2023.6));  // method가 값이기 때문에 이렇게 바로 넣을 수 있다
		
		
		//method는 4가지. 이 4가지를 빠르게 구분해야 한다. 

	}//main

}//class
