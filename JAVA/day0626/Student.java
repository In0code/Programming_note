package day0626;

/**
 * 사용자 정의 자료형 : 자바에서 제공하는 데이터형을 조합하여 <br>
 * 새로운 이름(클래스명)의 데이터형을 만드는 것.
 * 
 * @author user
 *
 */
public class Student {
	private String name;
	private int age;
	private double height;
	private double weight;
	private String email;

	public Student() {

	}// Student

	public Student(String name, int age, double height, double weight, String email) {
		this.name = name;
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.email = email;
	}// Student

	public String getName() {
		return name;
	}// getName

	public void setName(String name) {
		this.name = name;
	}// setName

	public int getAge() {
		return age;
	}// getAge

	public void setAge(int age) {
		this.age = age;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}// class
