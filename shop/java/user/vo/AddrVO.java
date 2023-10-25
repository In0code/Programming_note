package user.vo;

public class AddrVO {
	
	private String zipcode, sido, addr;

	public AddrVO() {
	}

	public AddrVO(String zipcode, String sido, String addr) {
		this.zipcode = zipcode;
		this.sido = sido;
		this.addr = addr;
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
		return "AddrVO [zipcode=" + zipcode + ", sido=" + sido + ", addr=" + addr + "]";
	}
}