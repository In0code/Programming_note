package self_practice_course_prj;

/**
 * 인영 교수 VO
 * 
 * @author user
 *
 */
public class ProfVO {
	private String ename, phone, email, majorName, dptName, empno;

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
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

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getDptName() {
		return dptName;
	}

	public void setDptName(String dptName) {
		this.dptName = dptName;
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	@Override
	public String toString() {
		return "ProfVO [ename=" + ename + ", phone=" + phone + ", email=" + email + ", majorName=" + majorName
				+ ", dptName=" + dptName + ", empno=" + empno + "]";
	}

	public ProfVO(String ename, String phone, String email, String majorName, String dptName, String empno) {
		super();
		this.ename = ename;
		this.phone = phone;
		this.email = email;
		this.majorName = majorName;
		this.dptName = dptName;
		this.empno = empno;
	}

	public ProfVO() {
		super();
	}

}// class
