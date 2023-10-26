package user.vo;

public class ClientOrderVO {
	
	private String orderDate, orderNum, img, productName, productInfo, onProcess, purchaseStatus;
	private int amount, price;
	
	public ClientOrderVO() {
	}

	public ClientOrderVO(String orderDate, String orderNum, String img, String productName, String productInfo,
			String onProcess, String purchaseStatus, int amount, int price) {
		this.orderDate = orderDate;
		this.orderNum = orderNum;
		this.img = img;
		this.productName = productName;
		this.productInfo = productInfo;
		this.onProcess = onProcess;
		this.purchaseStatus = purchaseStatus;
		this.amount = amount;
		this.price = price;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public String getOnProcess() {
		return onProcess;
	}

	public void setOnProcess(String onProcess) {
		this.onProcess = onProcess;
	}

	public String getPurchaseStatus() {
		return purchaseStatus;
	}

	public void setPurchaseStatus(String purchaseStatus) {
		this.purchaseStatus = purchaseStatus;
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
		return "ClientOrderVO [orderDate=" + orderDate + ", orderNum=" + orderNum + ", img=" + img + ", productName="
				+ productName + ", productInfo=" + productInfo + ", onProcess=" + onProcess + ", purchaseStatus="
				+ purchaseStatus + ", amount=" + amount + ", price=" + price + "]";
	}
}