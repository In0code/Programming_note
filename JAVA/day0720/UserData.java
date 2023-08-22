package day0720;

import java.io.Serializable;

@SuppressWarnings("serial")
public class UserData implements Serializable {

	
	private static final long serialVersionUID=-54351354651343L; 
	
	// transient가 선언되면 직렬화를 방지할 수 있다.
	private /* transient */ String name;
	private double height;
	private /* transient */ double weight; // 숨기고싶은 데이터 앞에는 transient를 걸어주면 된다.

	public UserData(String name, double height, double weight) {// 임자있는 생성자
		super();
		this.name = name;
		this.height = height;
		this.weight = weight;
	}

	@Override
	public String toString() {
		return "UserData [name=" + name + ", height=" + height + ", weight=" + weight + "]";
	}// toString

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	}// setWeight

}
