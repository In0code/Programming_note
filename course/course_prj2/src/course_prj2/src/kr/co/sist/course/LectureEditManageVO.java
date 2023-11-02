package kr.co.sist.course;

public class LectureEditManageVO {
	private String dptcode;
	private String dptName;
	private String majorName;
	private String lectureName;
	private String profName;
	private String empno;
	private int credit;
	private String subType;
	private String subcode;
	
	public LectureEditManageVO() {
		super();
	}

	public LectureEditManageVO(String dptcode, String dptName, String majorName, String lectureName, String profName,
			String empno, int credit, String subType, String subcode) {
		super();
		this.dptcode = dptcode;
		this.dptName = dptName;
		this.majorName = majorName;
		this.lectureName = lectureName;
		this.profName = profName;
		this.empno = empno;
		this.credit = credit;
		this.subType = subType;
		this.subcode = subcode;
	}

	public String getDptcode() {
		return dptcode;
	}

	public void setDptcode(String dptcode) {
		this.dptcode = dptcode;
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

	public String getLectureName() {
		return lectureName;
	}

	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}

	public String getProfName() {
		return profName;
	}

	public void setProfName(String profName) {
		this.profName = profName;
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public String getSubType() {
		return subType;
	}

	public void setSubType(String subType) {
		this.subType = subType;
	}

	public String getSubcode() {
		return subcode;
	}

	public void setSubcode(String subcode) {
		this.subcode = subcode;
	}

	@Override
	public String toString() {
		return "LectureEditManageVO [dptcode=" + dptcode + ", dptName=" + dptName + ", majorName=" + majorName
				+ ", lectureName=" + lectureName + ", profName=" + profName + ", empno=" + empno + ", credit=" + credit
				+ ", subType=" + subType + ", subcode=" + subcode + "]";
	}

	
	
}//LectureEditManageVO

