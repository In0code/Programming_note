package user.vo;

public class BuyingCartVO {
	
	private String gcode;
	private int amount, price;
	
	public BuyingCartVO() {
	}

	public BuyingCartVO(String gcode, int amount, int price) {
		this.gcode = gcode;
		this.amount = amount;
		this.price = price;
	}

	public String getGcode() {
		return gcode;
	}

	public void setGcode(String gcode) {
		this.gcode = gcode;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "BuyingCartVO [gcode=" + gcode + ", amount=" + amount + ", price=" + price + "]";
	}
}