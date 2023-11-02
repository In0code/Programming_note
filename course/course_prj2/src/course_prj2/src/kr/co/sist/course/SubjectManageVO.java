package kr.co.sist.course;

public class SubjectManageVO {
	private String subCode;
	private String subName;
	private String dptName;
	private String majorName;
	private String eName;
	private int credit;
	private String subType;
	
	public SubjectManageVO() {
		super();
	}

	public SubjectManageVO(String subCode, String subName, String dptName, String majorName, String eName, int credit,
			String subType) {
		super();
		this.subCode = subCode;
		this.subName = subName;
		this.dptName = dptName;
		this.majorName = majorName;
		this.eName = eName;
		this.credit = credit;
		this.subType = subType;
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

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
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

	@Override
	public String toString() {
		return "SubjectManageVO [subCode=" + subCode + ", subName=" + subName + ", dptName=" + dptName + ", majorName="
				+ majorName + ", eName=" + eName + ", credit=" + credit + ", subType=" + subType + "]";
	}
	
	
}//class


