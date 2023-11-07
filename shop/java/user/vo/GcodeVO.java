package user.vo;

public class GcodeVO {

	private String gcode;

	public GcodeVO() {
		super();
	}

	public GcodeVO(String gcode) {
		super();
		this.gcode = gcode;
	}

	public String getGcode() {
		return gcode;
	}

	public void setGcode(String gcode) {
		this.gcode = gcode;
	}

	@Override
	public String toString() {
		return "GcodeVO [gcode=" + gcode + "]";
	}
	
	
}
