package self_practice_course_prj;

public class ProfVO {

	private  String name, phone, email, image, major, dpt ;
	private int empno;
	private char usercode;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getDpt() {
		return dpt;
	}
	public void setDpt(String dpt) {
		this.dpt = dpt;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public char getUsercode() {
		return usercode;
	}
	public void setUsercode(char usercode) {
		this.usercode = usercode;
	}
	@Override
	public String toString() {
		return "ProfVO [name=" + name + ", phone=" + phone + ", email=" + email + ", image=" + image + ", major="
				+ major + ", dpt=" + dpt + ", empno=" + empno + ", usercode=" + usercode + "]";
	}
	public ProfVO(String name, String phone, String email, String image, String major, String dpt, int empno,
			char usercode) {
		super();
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.image = image;
		this.major = major;
		this.dpt = dpt;
		this.empno = empno;
		this.usercode = usercode;
	}
	public ProfVO() {
		super();
	}
	
	
	
}
