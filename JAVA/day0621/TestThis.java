package day0621;

//import day0620.Test;

/**
 * this keyword형식 : <br>
 * instance 영역에서 사용되며, 
 * @author user
 *
 */
public class TestThis {
	int temp;
	int foo;
	
	/**
	 * this를 사용하지 않고 인스턴스 변수와 지역변수를 식별하려면 <br>
	 * 객체를 받아서, 객체.변수명으로 식별한다.
	 * @param temp 같은 이름의 변수
	 * @param tt 식별하기 위한 객체의 주소
	 */
	public void setTemp(int temp, TestThis tt) {
		
		tt.temp=temp;
		System.out.println(this);
	}//setTemp
	public int getTemp() {
		return temp;
	}
	
	/**
	 * this는 method를 호출한 객체의 주소로 변경된다. <br>
	 * tt.setFoo()를 부르면 this는 tt가 된다 <br>
	 * tt.setFoo()를 부르면 this는 tt1이 된다.
	 * @param foo
	 */
	public void setFoo (int foo) {
		this.foo=foo;
	}
	public int getFoo() {
		return foo;
	}
	public static void main(String[] args) {
		TestThis tt= new TestThis();
		TestThis tt1= new TestThis();
		tt.setTemp(200,tt);
		tt1.setTemp(200,tt);
		System.out.println(tt.getTemp());
		System.out.println("--------------------");
		tt.setFoo(100);
		System.out.println(tt.getFoo());
	}//main

}//class
