package admin.vo;

public class RecallVO {

	private String userName,date,recallDate,productName ,orderStatus;
	private int orderNum,quantity,price,totalPrice; 
	public RecallVO() {
		super();
	}
	public RecallVO(String userName, String date, String recallDate, String productName, String orderStatus,
			int orderNum, int quantity, int price, int totalPrice) {
		super();
		this.userName = userName;
		this.date = date;
		this.recallDate = recallDate;
		this.productName = productName;
		this.orderStatus = orderStatus;
		this.orderNum = orderNum;
		this.quantity = quantity;
		this.price = price;
		this.totalPrice = totalPrice;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getRecallDate() {
		return recallDate;
	}
	public void setRecallDate(String recallDate) {
		this.recallDate = recallDate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
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
	@Override
	public String toString() {
		return "RecallVO [userName=" + userName + ", date=" + date + ", recallDate=" + recallDate + ", productName="
				+ productName + ", orderStatus=" + orderStatus + ", orderNum=" + orderNum + ", quantity=" + quantity
				+ ", price=" + price + ", totalPrice=" + totalPrice + "]";
	}

	
	
	
}
