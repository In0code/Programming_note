package shop_prj;

public class WishListVO {

	private String productCode,img,id,productInfo,productNo,gName ;
	private int price,totalPrice;
	public WishListVO() {
		super();
	}
	public WishListVO(String productCode, String img, String id, String productInfo, String productNo, String gName,
			int price, int totalPrice) {
		super();
		this.productCode = productCode;
		this.img = img;
		this.id = id;
		this.productInfo = productInfo;
		this.productNo = productNo;
		this.gName = gName;
		this.price = price;
		this.totalPrice = totalPrice;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
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
		return "WishListVO [productCode=" + productCode + ", img=" + img + ", id=" + id + ", productInfo=" + productInfo
				+ ", productNo=" + productNo + ", gName=" + gName + ", price=" + price + ", totalPrice=" + totalPrice
				+ "]";
	}
	
	
	
}
