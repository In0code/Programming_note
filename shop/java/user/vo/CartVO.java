package user.vo;

public class CartVO {

	private String bucketNum,img ,productName ,productInfo ;
	private int price ,amount ,productNo;
	public CartVO() {
		super();
	}
	public CartVO(String bucketNum, String img, String productName, String productInfo, int price, int amount,
			int productNo) {
		super();
		this.bucketNum = bucketNum;
		this.img = img;
		this.productName = productName;
		this.productInfo = productInfo;
		this.price = price;
		this.amount = amount;
		this.productNo = productNo;
	}
	public String getBucketNum() {
		return bucketNum;
	}
	public void setBucketNum(String bucketNum) {
		this.bucketNum = bucketNum;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	@Override
	public String toString() {
		return "BucketVO [bucketNum=" + bucketNum + ", img=" + img + ", productName=" + productName + ", productInfo="
				+ productInfo + ", price=" + price + ", amount=" + amount + ", productNo=" + productNo + "]";
	}
	
	
	
	
	
}
