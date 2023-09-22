package kr.co.sist.course;

import java.util.Date;

public class EmployStuManageVO {
	
	private int stuNo, nowLevel, sLevel, semester;
	private String dptName, majorName, sName, phone, email, addr, img, grade;
	private Date input_date;
	
	public EmployStuManageVO() {
		super();
	}
	
	public EmployStuManageVO(int stuNo, int nowLevel, int sLevel, int semester, String dptName, String majorName,
			String sName, String phone, String email, String addr, String img, String grade, Date input_date) {
		super();
		this.stuNo = stuNo;
		this.nowLevel = nowLevel;
		this.sLevel = sLevel;
		this.semester = semester;
		this.dptName = dptName;
		this.majorName = majorName;
		this.sName = sName;
		this.phone = phone;
		this.email = email;
		this.addr = addr;
		this.img = img;
		this.grade = grade;
		this.input_date = input_date;
	}
	
	public EmployStuManageVO(int stuNo, int nowLevel, String dptName, String majorName,
			String sName, String phone, String email, String addr, String img, Date input_date) {
		super();
		this.stuNo = stuNo;
		this.nowLevel = nowLevel;
		this.dptName = dptName;
		this.majorName = majorName;
		this.sName = sName;
		this.phone = phone;
		this.email = email;
		this.addr = addr;
		this.img = img;
		this.input_date = input_date;
	}
	
	public EmployStuManageVO(int stuNo, String img, String sName, String dptName, String majorName, 
			int nowLevel, String phone, String email, String addr) {
		super();
		this.stuNo = stuNo;
		this.nowLevel = nowLevel;
		this.dptName = dptName;
		this.majorName = majorName;
		this.sName = sName;
		this.phone = phone;
		this.email = email;
		this.addr = addr;
		this.img = img;
	}

	@Override
	public String toString() {
		return "EmployStuManageVO [stuNo=" + stuNo + ", nowLevel=" + nowLevel + ", sLevel=" + sLevel + ", semester="
				+ semester + ", dptName=" + dptName + ", majorName=" + majorName + ", sName=" + sName + ", phone="
				+ phone + ", email=" + email + ", addr=" + addr + ", img=" + img + ", grade=" + grade + ", input_date="
				+ input_date + "]";
	}

	public int getSemester() {
		return semester;
	}

	public int getStuno() {
		return stuNo;
	}
	
	public void setStuno(int stuNo) {
		this.stuNo = stuNo;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getAddr() {
		return addr;
	}
	
	public String getImg() {
		return img;
	}

	public String getDptName() {
		return dptName;
	}

	public String getMajorName() {
		return majorName;
	}

	public String getGrade() {
		return grade;
	}

	public int getStuNo() {
		return stuNo;
	}

	public int getNowLevel() {
		return nowLevel;
	}

	public int getsLevel() {
		return sLevel;
	}

	public String getsName() {
		return sName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setImg(String img) {
		this.img = img;
	}

}
