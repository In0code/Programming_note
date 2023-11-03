package user.vo;

public class FillOrderInfoVO {
	
	private String name, zipcode, sido, addr, email;

	public FillOrderInfoVO() {
	}

	public FillOrderInfoVO(String name, String zipcode, String sido, String addr, String email) {
		this.name = name;
		this.zipcode = zipcode;
		this.sido = sido;
		this.addr = addr;
		this.email = email;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "FillOrderInfoVO [name=" + name + ", zipcode=" + zipcode + ", sido=" + sido + ", addr=" + addr
				+ ", email=" + email + "]";
	}
}
