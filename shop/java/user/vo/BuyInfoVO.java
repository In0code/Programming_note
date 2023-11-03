package user.vo;

public class BuyInfoVO {

	private String id, receiver, zipcode, sido, addr, phone, msg, email;
	private String[] gcode;
	private int[] amount;
	
	public BuyInfoVO() {
	}

	public BuyInfoVO(String id, String receiver, String zipcode, String sido, String addr, String phone, String msg,
			String email, String[] gcode, int[] amount) {
		this.id = id;
		this.receiver = receiver;
		this.zipcode = zipcode;
		this.sido = sido;
		this.addr = addr;
		this.phone = phone;
		this.msg = msg;
		this.email = email;
		this.gcode = gcode;
		this.amount = amount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String[] getGcode() {
		return gcode;
	}

	public void setGcode(String[] gcode) {
		this.gcode = gcode;
	}

	public int[] getAmount() {
		return amount;
	}

	public void setAmount(int[] amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "BuyInfoVO [id=" + id + ", receiver=" + receiver + ", zipcode=" + zipcode + ", sido=" + sido + ", addr="
				+ addr + ", phone=" + phone + ", msg=" + msg + ", email=" + email + ", gcode=" + gcode + ", amount="
				+ amount + "]";
	}
}