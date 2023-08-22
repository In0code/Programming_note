package day0814;

public class Singleton {
	private static Singleton single;

	private Singleton() {
		System.out.println("생성자");

	}// Singleton

	public static Singleton getInstance() {
		if (single == null) { // 객체가 죽었니?
			single = new Singleton();
		} // end if
		return single;
	}// getInstance


}// class
