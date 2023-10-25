package admin.vo;

public class UserReviewVO {
	private String productName,review,img;
	
	private int star;

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	@Override
	public String toString() {
		return "UserReviewVO [productName=" + productName + ", review=" + review + ", img=" + img + ", star=" + star
				+ "]";
	}

	public UserReviewVO(String productName, String review, String img, int star) {
		super();
		this.productName = productName;
		this.review = review;
		this.img = img;
		this.star = star;
	}
	
	
}
