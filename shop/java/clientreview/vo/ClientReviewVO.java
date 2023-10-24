package clientreview.vo;


public class ClientReviewVO {
	
	private String  productName,name ,tmi,title;
	private int star;;
	String inputDate;

	


	




	public ClientReviewVO(String productName, String name, String tmi, String title, int star, String inputDate) {
		super();
		this.productName = productName;
		this.name = name;
		this.tmi = tmi;
		this.title = title;
		this.star = star;
		this.inputDate = inputDate;
	}









	@Override
	public String toString() {
		return "ClientReviewVO [productName=" + productName + ", name=" + name + ", tmi=" + tmi + ", title=" + title
				+ ", star=" + star + ", inputDate=" + inputDate + "]";
	}









	public String getProductName() {
		return productName;
	}









	public void setProductName(String productName) {
		this.productName = productName;
	}









	public String getName() {
		return name;
	}









	public void setName(String name) {
		this.name = name;
	}









	public String getTmi() {
		return tmi;
	}









	public void setTmi(String tmi) {
		this.tmi = tmi;
	}









	public String getTitle() {
		return title;
	}









	public void setTitle(String title) {
		this.title = title;
	}









	public int getStar() {
		return star;
	}









	public void setStar(int star) {
		this.star = star;
	}









	public String getInputDate() {
		return inputDate;
	}









	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}









	public ClientReviewVO() {
		
	}
}
