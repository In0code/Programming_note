package day1013;

public class TestUseBeanVO {
	private String name;
	private int age;
	
	public TestUseBeanVO() {
		System.out.println("TestUseBeanVO의 기본 생성자");
	}
	
	public TestUseBeanVO(String name, int age) {
		System.out.println("TestUseBeanVO의");
		this.name = name;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	
	
}
