package user.vo;

public class BuyGoodsVO {
	
	private String product, payment;
	int amount;
	
	public BuyGoodsVO() {
	}

	public BuyGoodsVO(String product, String payment, int amount) {
		this.product = product;
		this.payment = payment;
		this.amount = amount;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "BuyGoodsVO [product=" + product + ", payment=" + payment + ", amount=" + amount + "]";
	}
}