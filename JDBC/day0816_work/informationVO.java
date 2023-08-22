package day0816_work;

public class informationVO {
	private String name;
	private int age;
	private int num;
	private int image;

	public informationVO() {

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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getImage() {
		return image;
	}

	public void setImage(int image) {
		this.image = image;
	}

	public informationVO(String name, int age, int num, int image) {
		super();
		this.name = name;
		this.age = age;
		this.num = num;
		this.image = image;
	}

	@Override
	public String toString() {
		return "ImforVO [name=" + name + ", age=" + age + ", num=" + num + ", image=" + image + ", getName()="
				+ getName() + ", getAge()=" + getAge() + ", getNum()=" + getNum() + ", getImage()=" + getImage();
	}

}
