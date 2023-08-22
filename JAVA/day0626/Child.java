package day0626;

public class Child extends Parent {
	int p_i;
	int c_i;
//	(기본생성자와 super가 숨어있다)
	
	

	public void printPI() {
		// instance 영역에서는 this가 생략되어 있다.
		// 부모와 자식이 같은 이름의 변수를 가지고 있으면
		this.p_i = 10; // 자식의 변수 사용
		super.p_i = 100; // 자식의 시작주소를 건너 뛰고 부모의 시작주소 부터 변수를 찾는다.
		System.out.println("자식의 method p_i : " + p_i + " / c_i : " + c_i);
		// 부모에만 있는 변수나 method는 this로 사용할 수 있따
		this.p_j = 300;
		System.out.println("부모의 변수 super.p_j : " + super.p_j + ", this.p_j : " + this.p_j);
		// printPI(); //재귀호출. 내가 나를불러~ 무한 loop
		super.printPI(); // 나는 내꺼말고 내 부모꺼 부르고 싶어.-> super
		System.out.println(this);
//		System.out.println(super); //super는 출력되지 않는다. 
	}// printPI

	public static void main(String[] args) {
		Child c = new Child();
		System.out.println(c); //super는 this와 다르게 출력 안된다
		c.printPI(); // 부모랑 자식이랑 같으면 자식의 method를 부른다.
		
//		Integer in=new Integer(100);

	}// main

}// class
