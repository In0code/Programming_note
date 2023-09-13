package self_practice_course_prj;

public class EmployVO {

	private String empno;
	private char usercode;
	private String name;
	private String email;
	private String image;
	private String dptName;
	private String majorName;
	private String phone;
	
	public EmployVO() {
	}

	public EmployVO(String empno, char usercode, String name, String email, String image, String dptName,
			String majorName, String phone) {
		this.empno = empno;
		this.usercode = usercode;
		this.name = name;
		this.email = email;
		this.image = image;
		this.dptName = dptName;
		this.majorName = majorName;
		this.phone = phone;
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public char getUsercode() {
		return usercode;
	}

	public void setUsercode(char usercode) {
		this.usercode = usercode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getDptName() {
		return dptName;
	}

	public void setDptName(String dptName) {
		this.dptName = dptName;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "EmployVO [empno=" + empno + ", usercode=" + usercode + ", name=" + name + ", email=" + email
				+ ", image=" + image + ", dptName=" + dptName + ", majorName=" + majorName + ", phone=" + phone + "]";
	}
	
}
