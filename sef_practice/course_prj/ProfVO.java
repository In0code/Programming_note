package self_practice_course_prj;

/**
 * 인영
 * 교수 VO
 * @author user
 *
 */
public class ProfVO {
	private  String ename, phone, email, majorname, dptname, empno ;

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

	public String getMajorname() {
		return majorname;
	}

	public void setMajorname(String majorname) {
		this.majorname = majorname;
	}

	public String getDptname() {
		return dptname;
	}

	public void setDptname(String dptname) {
		this.dptname = dptname;
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	@Override
	public String toString() {
		return "ProfVO [ename=" + ename + ", phone=" + phone + ", email=" + email + ", majorname=" + majorname
				+ ", dptname=" + dptname + ", empno=" + empno + "]";
	}

	public ProfVO(String ename, String phone, String email, String majorname, String dptname, String empno) {
		super();
		this.ename = ename;
		this.phone = phone;
		this.email = email;
		this.majorname = majorname;
		this.dptname = dptname;
		this.empno = empno;
	}

	public ProfVO() {
		super();
	}
	
}//class
