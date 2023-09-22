package kr.co.sist.course;



public class MySubjectVO {
	private String majorName ; 
	private String subName;
	private String subCode;
	private String profname; 
	private char subType; 
	private int credit;
	
	public MySubjectVO () {
		
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getSubCode() {
		return subCode;
	}

	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getProfname() {
		return profname;
	}

	public void setProfname(String profname) {
		this.profname = profname;
	}

	public char getSubType() {
		return subType;
	}

	public void setSubType(char subType) {
		this.subType = subType;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	@Override
	public String toString() {
		return "MySubjectVO [subName=" + subName + ", subCode=" + subCode + ", majorName=" + majorName + ", profname="
				+ profname + ", subType=" + subType + ", credit=" + credit + "]";
	}

	public MySubjectVO(String subName, String subCode, String majorName, String profname, char subType, int credit) {
		super();
		this.subName = subName;
		this.subCode = subCode;
		this.majorName = majorName;
		this.profname = profname;
		this.subType = subType;
		this.credit = credit;
	}
	
}