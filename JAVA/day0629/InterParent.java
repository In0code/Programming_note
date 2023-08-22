package day0629;

/**
 * interface는 상수(변할 수 없는 것)와 abstract(추상) method로 이루어져 있다.
 * 
 * @author user
 *
 */
public interface InterParent {
// instance variable를 선언할 수 없음. 
//	int i; 

// interface는 생서자를 선언할 수 없음. => 객체화도 안됨.
//	public InterParent() {    
//	}

// 일반 method를 가질 수 없음. => 일을 할 수 없음
//	public void test() {
//	}

	public static final int VALUE = 10; // constant

	// interface에서는 추상method를 만드는데, abstract가 있든 없든 상관 없음
	// abstract이 없어도 추상 method임
	public /* abstract */ void test();
	public abstract int test(String str);

	
	// default method도 override 됨
	//default는 JDK1.8에서부터 추가된 method
	public default String msg() {
		String msg = "오늘은 목요일";
		return msg;
	}// msg

}// interface
