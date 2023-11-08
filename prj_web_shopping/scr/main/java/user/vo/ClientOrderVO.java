package user.vo;


public class ClientOrderVO {
	
	private String gcode, orderDate, orderNum, orddno, img, productName, onProcess;
	private int amount, price;
	
	public ClientOrderVO() {
	}

	public ClientOrderVO(String gcode, String orderDate, String orderNum, String orddno, String img, String productName,
			String onProcess, int amount, int price) {
		this.gcode = gcode;
		this.orderDate = orderDate;
		this.orderNum = orderNum;
		this.orddno = orddno;
		this.img = img;
		this.productName = productName;
		this.onProcess = onProcess;
		this.amount = amount;
		this.price = price;
	}

	public String getGcode() {
		return gcode;
	}

	public void setGcode(String gcode) {
		this.gcode = gcode;
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

	public String getOrddno() {
		return orddno;
	}

	public void setOrddno(String orddno) {
		this.orddno = orddno;
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

	public String getOnProcess() {
		return onProcess;
	}

	public void setOnProcess(String onProcess) {
		this.onProcess = onProcess;
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
		return "ClientOrderVO [gcode=" + gcode + ", orderDate=" + orderDate + ", orderNum=" + orderNum + ", orddno="
				+ orddno + ", img=" + img + ", productName=" + productName + ", onProcess=" + onProcess + ", amount="
				+ amount + ", price=" + price + "]";
	}
}