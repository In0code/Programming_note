package user.vo;

public class AddrVO {
	
	private String id, zipcode, sido, addr;

	public AddrVO() {
	}

	public AddrVO(String id, String zipcode, String sido, String addr) {
		this.id = id;
		this.zipcode = zipcode;
		this.sido = sido;
		this.addr = addr;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	@Override
	public String toString() {
		return "AddrVO [id=" + id + ", zipcode=" + zipcode + ", sido=" + sido + ", addr=" + addr + "]";
	}
}