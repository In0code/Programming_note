package kr.co.sist.course;

public class SubjectManageVO {
	private String subCode;
	private String subName;
	private int credit;
	private char subType;
	private String empno;
	private String majorCode;
	private String dptCode;
	
	public SubjectManageVO() {
		super();
	}

	public SubjectManageVO(String subCode, String subName, int credit, char subType, String empno, String majorCode,
			String dptCode) {
		super();
		this.subCode = subCode;
		this.subName = subName;
		this.credit = credit;
		this.subType = subType;
		this.empno = empno;
		this.majorCode = majorCode;
		this.dptCode = dptCode;
	}

	public String getSubCode() {
		return subCode;
	}

	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public char getSubType() {
		return subType;
	}

	public void setSubType(char subType) {
		this.subType = subType;
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public String getMajorCode() {
		return majorCode;
	}

	public void setMajorCode(String majorCode) {
		this.majorCode = majorCode;
	}

	public String getDptCode() {
		return dptCode;
	}

	public void setDptCode(String dptCode) {
		this.dptCode = dptCode;
	}

	@Override
	public String toString() {
		return "SubjectManageVO [subCode=" + subCode + ", subName=" + subName + ", credit=" + credit + ", subType="
				+ subType + ", empno=" + empno + ", majorCode=" + majorCode + ", dptCode=" + dptCode + "]";
	}
	
}//class


