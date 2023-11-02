package user.vo;

public class CartVO {

	private String img ,gname,gcode ;
	private int price ,amount,bcode ;
	public CartVO() {
		super();
	}
	public CartVO(String img, String gname, String gcode, int price, int amount, int bcode) {
		super();
		this.img = img;
		this.gname = gname;
		this.gcode = gcode;
		this.price = price;
		this.amount = amount;
		this.bcode = bcode;
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
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	@Override
	public String toString() {
		return "CartVO [img=" + img + ", gname=" + gname + ", gcode=" + gcode + ", price=" + price + ", amount="
				+ amount + ", bcode=" + bcode + "]";
	}
	
	
	
}
