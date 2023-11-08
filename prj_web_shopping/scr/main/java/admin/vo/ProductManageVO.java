package admin.vo;

public class ProductManageVO {

	private String mainImg, img1,img2,img3,goodsCode,goodsName,categoryName,inputDate,
	cancle, tmi, totalBuy, categoryCode, engTmi, top, heart, base, ing, detailImg;
	private int price, quantity;
	
	public ProductManageVO() {
		
	}
	
	public ProductManageVO(String mainImg, String goodsCode, String goodsName, String categoryName, String inputDate,
			String cancle, int price, int quantity) {
		super();
		this.mainImg = mainImg;
		this.goodsCode = goodsCode;
		this.goodsName = goodsName;
		this.categoryName = categoryName;
		this.inputDate = inputDate;
		this.cancle = cancle;
		this.price = price;
		this.quantity = quantity;
	}

	public String getCancle() {
		return cancle;
	}

	public void setCancle(String cancle) {
		this.cancle = cancle;
	}

	public String getTmi() {
		return tmi;
	}

	public void setTmi(String tmi) {
		this.tmi = tmi;
	}

	public String getTotalBuy() {
		return totalBuy;
	}

	public void setTotalBuy(String totalBuy) {
		this.totalBuy = totalBuy;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getEngTmi() {
		return engTmi;
	}

	public void setEngTmi(String engTmi) {
		this.engTmi = engTmi;
	}

	public String getTop() {
		return top;
	}

	public void setTop(String top) {
		this.top = top;
	}

	public String getHeart() {
		return heart;
	}

	public void setHeart(String heart) {
		this.heart = heart;
	}

	public String getBase() {
		return base;
	}

	public void setBase(String base) {
		this.base = base;
	}

	public String getIng() {
		return ing;
	}

	public void setIng(String ing) {
		this.ing = ing;
	}

	public String getDetailImg() {
		return detailImg;
	}

	public void setDetailImg(String detailImg) {
		this.detailImg = detailImg;
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
