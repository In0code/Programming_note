package day1017;

import java.util.Date;

public class ProductVO {
	private String img,prdName,info;
	private int prdNum,price;
	private Date inputDate;
	
	public ProductVO() {
		super();
	}

	public ProductVO(String img, String prdName, String info, int prdNum, int price, Date inputDate) {
		super();
		this.img = img;
		this.prdName = prdName;
		this.info = info;
		this.prdNum = prdNum;
		this.price = price;
		this.inputDate = inputDate;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPrdName() {
		return prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getPrdNum() {
		return prdNum;
	}

	public void setPrdNum(int prdNum) {
		this.prdNum = prdNum;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getInputDate() {
		return inputDate;
	}

	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}

	@Override
	public String toString() {
		return "ProductVO [img=" + img + ", prdName=" + prdName + ", info=" + info + ", prdNum=" + prdNum + ", price="
				+ price + ", inputDate=" + inputDate + "]";
	}
	
	
	
	
	
	
}
