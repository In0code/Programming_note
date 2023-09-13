package self_practice_course_prj;

public class MajorManageVO {

	private String dptName;
	private String mahorCode;
	private String majorName;

	public String getDptName() {
		return dptName;
	}

	public void setDptName(String dptName) {
		this.dptName = dptName;
	}

	public String getMahorCode() {
		return mahorCode;
	}

	public void setMahorCode(String mahorCode) {
		this.mahorCode = mahorCode;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	@Override
	public String toString() {
		return "MajorManageVO [dptName=" + dptName + ", mahorCode=" + mahorCode + ", majorName=" + majorName + "]";
	}

	public MajorManageVO(String dptName, String mahorCode, String majorName) {
		super();
		this.dptName = dptName;
		this.mahorCode = mahorCode;
		this.majorName = majorName;
	}

	public MajorManageVO() {
		super();
	}

}