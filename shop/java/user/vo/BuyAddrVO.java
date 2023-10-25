package user.vo;

public class BuyAddrVO {

	private String name, zipcode, sido, addr, phone, email, msg;

	public BuyAddrVO() {
	}

	public BuyAddrVO(String name, String zipcode, String sido, String addr, String phone, String email, String msg) {
		this.name = name;
		this.zipcode = zipcode;
		this.sido = sido;
		this.addr = addr;
		this.phone = phone;
		this.email = email;
		this.msg = msg;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Override
	public String toString() {
		return "BuyAddrVO [name=" + name + ", zipcode=" + zipcode + ", sido=" + sido + ", addr=" + addr + ", phone="
				+ phone + ", email=" + email + ", msg=" + msg + "]";
	}
}