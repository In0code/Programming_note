package shopping.vo;

public class OrderVO {

	private String date,productName,userName;
	private int orderNo,amount,price; 
	private char orderStatus ;
	public OrderVO() {
		super();
	}
	public OrderVO(String date, String productName, String userName, int orderNo, int amount, int price,
			char orderStatus) {
		super();
		this.date = date;
		this.productName = productName;
		this.userName = userName;
		this.orderNo = orderNo;
		this.amount = amount;
		this.price = price;
		this.orderStatus = orderStatus;
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
	public char getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(char orderStatus) {
		this.orderStatus = orderStatus;
	}
	@Override
	public String toString() {
		return "OrderVO [date=" + date + ", productName=" + productName + ", userName=" + userName + ", orderNo="
				+ orderNo + ", amount=" + amount + ", price=" + price + ", orderStatus=" + orderStatus + "]";
	}
	
	
	
	
}
