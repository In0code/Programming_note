package user.vo;

public class DetailInfoVO {

	private String orderNum, orderDate, name, onProcess, img, productName, zipcode, sido, addr, phone;
	private int totalPrice, amount, price;
	
	public DetailInfoVO() {
	}

	public DetailInfoVO(String orderNum, String orderDate, String name, String onProcess, String img,
			String productName, String zipcode, String sido, String addr, String phone, int totalPrice, int amount,
			int price) {
		this.orderNum = orderNum;
		this.orderDate = orderDate;
		this.name = name;
		this.onProcess = onProcess;
		this.img = img;
		this.productName = productName;
		this.zipcode = zipcode;
		this.sido = sido;
		this.addr = addr;
		this.phone = phone;
		this.totalPrice = totalPrice;
		this.amount = amount;
		this.price = price;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOnProcess() {
		return onProcess;
	}

	public void setOnProcess(String onProcess) {
		this.onProcess = onProcess;
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

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
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
		return "DetailInfoVO [orderNum=" + orderNum + ", orderDate=" + orderDate + ", name=" + name + ", onProcess="
				+ onProcess + ", img=" + img + ", productName=" + productName + ", zipcode=" + zipcode + ", sido="
				+ sido + ", addr=" + addr + ", phone=" + phone + ", totalPrice=" + totalPrice + ", amount=" + amount
				+ ", price=" + price + "]";
	}
}
