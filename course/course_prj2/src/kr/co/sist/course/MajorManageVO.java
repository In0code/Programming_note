package kr.co.sist.course;

/**
 * 인영 학과관리 VO
 * ㄴ
 * 
 * @author user
 *
 */
public class MajorManageVO {
	private String dptName;
	private String majorCode;
	private String majorName;

	public String getDptName() {
		return dptName;
	}

	public void setDptName(String dptName) {
		this.dptName = dptName;
	}

	public String getmajorCode() {
		return majorCode;
	}

	public void setmajorCode(String majorCode) {
		this.majorCode = majorCode;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	@Override
	public String toString() {
		return "MajorManageVO [dptName=" + dptName + ", majorCode=" + majorCode + ", majorName=" + majorName + "]";
	}

	public MajorManageVO(String dptName, String majorCode, String majorName) {
		super();
		this.dptName = dptName;
		this.majorCode = majorCode;
		this.majorName = majorName;
	}

	public MajorManageVO() {
		super();
	}

}// class