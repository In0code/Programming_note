package user.vo;

public class BuyingGoodsVO {
	
	private String gcode, gname, img;
	private int price, amount;
	
	public BuyingGoodsVO() {
	}

	public BuyingGoodsVO(String gcode, String gname, String img, int price, int amount) {
		this.gcode = gcode;
		this.gname = gname;
		this.img = img;
		this.price = price;
		this.amount = amount;
	}

	public String getGcode() {
		return gcode;
	}

	public void setGcode(String gcode) {
		this.gcode = gcode;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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
		return "BuyingGoodsVO [gcode=" + gcode + ", gname=" + gname + ", img=" + img + ", price=" + price + ", amount="
				+ amount + "]";
	}
}
