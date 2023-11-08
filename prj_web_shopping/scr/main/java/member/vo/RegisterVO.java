package member.vo;

public class RegisterVO {
	
	private String id,pass,name,membership, phone, zipcode, addr, 
	detailAddr, email, date;
	
	public RegisterVO() {
	}

	public RegisterVO(String id, String pass, String name, String membership, String phone, String zipcode, String addr,
			String detailAddr, String email, String date) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.membership = membership;
		this.phone = phone;
		this.zipcode = zipcode;
		this.addr = addr;
		this.detailAddr = detailAddr;
		this.email = email;
		this.date = date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMembership() {
		return "WELCOME";
	}

	public void setMembership(String membership) {
		this.membership = membership;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "RegisterVO [id=" + id + ", pass=" + pass + ", name=" + name + ", membership=" + membership + ", phone="
				+ phone + ", zipcode=" + zipcode + ", addr=" + addr + ", detailAddr=" + detailAddr + ", email=" + email
				+ ", date=" + date + "]";
	}

	
	
}
