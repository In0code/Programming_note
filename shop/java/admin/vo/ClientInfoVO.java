package admin.vo;

public class ClientInfoVO {
	private String id,name,phone,email,zipcode,
				addr,detailAddr,joinDate,membership;
	private int totalPurchase,totalPrice;
	
	public ClientInfoVO() {
	}

	public ClientInfoVO(String id, String name, String phone, String email, String zipcode, String addr,
			String detailAddr, String joinDate, String membership, int totalPurchase, int totalPrice) {
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.zipcode = zipcode;
		this.addr = addr;
		this.detailAddr = detailAddr;
		this.joinDate = joinDate;
		this.membership = membership;
		this.totalPurchase = totalPurchase;
		this.totalPrice = totalPrice;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getMembership() {
		return membership;
	}

	public void setMembership(String membership) {
		this.membership = membership;
	}

	public int getTotalPurchase() {
		return totalPurchase;
	}

	public void setTotalPurchase(int totalPurchase) {
		this.totalPurchase = totalPurchase;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "ClientInfoVO [id=" + id + ", name=" + name + ", phone=" + phone + ", email=" + email + ", zipcode="
				+ zipcode + ", addr=" + addr + ", detailAddr=" + detailAddr + ", joinDate=" + joinDate + ", membership="
				+ membership + ", totalPurchase=" + totalPurchase + ", totalPrice=" + totalPrice + "]";
	}
	
	
}
