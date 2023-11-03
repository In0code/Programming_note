package user.vo;

public class BuyingCartVO {
	
	private String productCode;
	private int amount, price;
	
	public BuyingCartVO() {
	}

	public BuyingCartVO(String productCode, int amount, int price) {
		this.productCode = productCode;
		this.amount = amount;
		this.price = price;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
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
		return "BuyingCartVO [productCode=" + productCode + ", amount=" + amount + ", price=" + price + "]";
	}
}