package shop_prj;

public class OrderVO {

	private String date,productName,userName;
	private int orderNum,quantity,price,totalPrice; 
	private char orderStatus ;
	public OrderVO() {
		super();
	}
	public OrderVO(String date, String productName, String userName, int orderNum, int quantity, int price,
			int totalPrice, char orderStatus) {
		super();
		this.date = date;
		this.productName = productName;
		this.userName = userName;
		this.orderNum = orderNum;
		this.quantity = quantity;
		this.price = price;
		this.totalPrice = totalPrice;
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
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public char getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(char orderStatus) {
		this.orderStatus = orderStatus;
	}
	@Override
	public String toString() {
		return "OrderVO [date=" + date + ", productName=" + productName + ", userName=" + userName + ", orderNum="
				+ orderNum + ", quantity=" + quantity + ", price=" + price + ", totalPrice=" + totalPrice
				+ ", orderStatus=" + orderStatus + "]";
	}
	
	
	
}
