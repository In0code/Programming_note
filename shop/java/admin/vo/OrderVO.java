package admin.vo;

public class OrderVO {

	private String date,productName,userName,orderStatus;
	private int orderNo,amount,price; 
	public OrderVO() {
		super();
	}
	public OrderVO(String date, String productName, String userName, String orderStatus, int orderNo, int amount,
			int price) {
		super();
		this.date = date;
		this.productName = productName;
		this.userName = userName;
		this.orderStatus = orderStatus;
		this.orderNo = orderNo;
		this.amount = amount;
		this.price = price;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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
		return "OrderVO [date=" + date + ", productName=" + productName + ", userName=" + userName + ", orderStatus="
				+ orderStatus + ", orderNo=" + orderNo + ", amount=" + amount + ", price=" + price + "]";
	}
	
	
	
}
