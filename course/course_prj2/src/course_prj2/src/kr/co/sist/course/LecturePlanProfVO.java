package kr.co.sist.course;

public class LecturePlanProfVO {
	private String subCode;
	private String subName;
	private String subGoal;
	private String lectureInfo;
	
	public LecturePlanProfVO() {
		super();
	}

	public LecturePlanProfVO(String subCode, String subName, String subGoal, String lectureInfo) {
		super();
		this.subCode = subCode;
		this.subName = subName;
		this.subGoal = subGoal;
		this.lectureInfo = lectureInfo;
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

	public String getSubGoal() {
		return subGoal;
	}

	public void setSubGoal(String subGoal) {
		this.subGoal = subGoal;
	}

	public String getLectureInfo() {
		return lectureInfo;
	}

	public void setLectureInfo(String lectureInfo) {
		this.lectureInfo = lectureInfo;
	}

	@Override
	public String toString() {
		return "LecturePlanProfVO [subCode=" + subCode + ", subName=" + subName + ", subGoal=" + subGoal
				+ ", lectureInfo=" + lectureInfo + "]";
	}
	
	
}//class
