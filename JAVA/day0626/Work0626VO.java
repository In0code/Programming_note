package day0626;

public class Work0626VO {
	public String name;
	public String address;
	public int age;

	public Work0626VO() {

	}// Work0626VO

	public Work0626VO(String name, String address, int age) {
		this.name = name;
		this.address = address;
		this.age = age;
	}// Work0626VO

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

}// class
