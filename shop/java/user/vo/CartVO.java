package user.vo;

public class CartVO {

	private String bcode,img ,gname ;
	private int price ,amount ,gcode;
	public CartVO() {
		super();
	}
	public CartVO(String bcode, String img, String gname, int price, int amount, int gcode) {
		super();
		this.bcode = bcode;
		this.img = img;
		this.gname = gname;
		this.price = price;
		this.amount = amount;
		this.gcode = gcode;
	}
	public String getBcode() {
		return bcode;
	}
	public void setBcode(String bcode) {
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
	public int getGcode() {
		return gcode;
	}
	public void setGcode(int gcode) {
		this.gcode = gcode;
	}
	@Override
	public String toString() {
		return "CartVO [bcode=" + bcode + ", img=" + img + ", gname=" + gname + ", price=" + price + ", amount="
				+ amount + ", gcode=" + gcode + "]";
	}
	
	
	
}
