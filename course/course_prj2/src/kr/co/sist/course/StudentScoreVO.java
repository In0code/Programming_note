package kr.co.sist.course;

public class StudentScoreVO {
	
	private String majorName;
	private String lectureName;
	private int credit;
	private String grade;
	private String subType;
	
	public StudentScoreVO() {
	}
	
	public StudentScoreVO(String majorName, String lectureName, int credit, String grade, String subType) {
		super();
		this.majorName = majorName;
		this.lectureName = lectureName;
		this.credit = credit;
		this.grade = grade;
		this.subType = subType;
	}
	
	@Override
	public String toString() {
		return "StudentScoreVO [majorName=" + majorName + ", LectureName=" + lectureName + ", credit=" + credit
				+ ", grade=" + grade + ", subType=" + subType + "]";
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

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getSubType() {
		return subType;
	}

	public void setSubType(String subType) {
		this.subType = subType;
	}
	
}
