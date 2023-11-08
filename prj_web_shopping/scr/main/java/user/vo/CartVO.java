package user.vo;

public class CartVO {

	private String img ,gname,gcode,bcode ;
	private int price ,amount ;
	public CartVO() {
		super();
	}
	public CartVO(String img, String gname, String gcode, String bcode, int price, int amount) {
		super();
		this.img = img;
		this.gname = gname;
		this.gcode = gcode;
		this.bcode = bcode;
		this.price = price;
		this.amount = amount;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getBcode() {
		return bcode;
	}
	public void setBcode(String bcode) {
		this.bcode = bcode;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "CartVO [img=" + img + ", gname=" + gname + ", gcode=" + gcode + ", bcode=" + bcode + ", price=" + price
				+ ", amount=" + amount + "]";
	}
	
	
}
