package productManage.vo;

public class ProductManageVO {

	
	
	private String mainImg, img1,img2,img3,goodsCode,goodsName,categoryName,inputDate;
	private int price,quantity;
	
	public ProductManageVO() {
		
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getInputDate() {
		return inputDate;
	}

	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "ProductManageVO [mainImg=" + mainImg + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3
				+ ", goodsCode=" + goodsCode + ", goodsName=" + goodsName + ", categoryName=" + categoryName
				+ ", inputDate=" + inputDate + ", price=" + price + ", quantity=" + quantity + "]";
	}

	public ProductManageVO(String mainImg, String img1, String img2, String img3, String goodsCode, String goodsName,
			String categoryName, String inputDate, int price, int quantity) {
		super();
		this.mainImg = mainImg;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.goodsCode = goodsCode;
		this.goodsName = goodsName;
		this.categoryName = categoryName;
		this.inputDate = inputDate;
		this.price = price;
		this.quantity = quantity;
	}

	


		
	
	

	 
}
