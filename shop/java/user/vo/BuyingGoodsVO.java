package user.vo;

public class BuyingGoodsVO {
	
	private String gname, img;
	private int price, amount;
	
	public BuyingGoodsVO() {
	}

	public BuyingGoodsVO(String gname, String img, int price, int amount) {
		this.gname = gname;
		this.img = img;
		this.price = price;
		this.amount = amount;
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
		return "BuyingGoodsVO [gname=" + gname + ", img=" + img + ", price=" + price + ", amount=" + amount + "]";
	}
}
