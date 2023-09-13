package self_practice_course_prj;

public class ProfManageVO {

	private String majorcode;

	public String getMajorcode() {
		return majorcode;
	}

	public void setMajorcode(String majorcode) {
		this.majorcode = majorcode;
	}

	@Override
	public String toString() {
		return "ProfManageVO [majorcode=" + majorcode + "]";
	}

	public ProfManageVO(String majorcode) {
		super();
		this.majorcode = majorcode;
	}

	public ProfManageVO() {
		super();
	}
	
	
	
}
