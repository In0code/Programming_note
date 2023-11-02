package kr.co.sist.course;

public class StudentSubjectVO {
	private String subjectCode ; 
	private String subjectname ;  
	private String ProfName ; 
	private char subType ; 
	private int credit ;
	
	public StudentSubjectVO() {
		
	}
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getSubjectname() {
		return subjectname;
	}
	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}
	public String getProfName() {
		return ProfName;
	}
	public void setProfName(String profName) {
		ProfName = profName;
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
		return "StudentSubjectVO [subjectCode=" + subjectCode + ", subjectname=" + subjectname + ", ProfName="
				+ ProfName + ", subType=" + subType + ", credit=" + credit + "]";
	}
	public StudentSubjectVO(String subjectCode, String subjectname, String profName, char subType, int credit) {
		super();
		this.subjectCode = subjectCode;
		this.subjectname = subjectname;
		this.ProfName = profName;
		this.subType = subType;
		this.credit = credit;
	}
	
	
}