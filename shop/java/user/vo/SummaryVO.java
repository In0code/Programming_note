package user.vo;

public class SummaryVO {

		private String category,review, name,reviewDate;
		
		private int view, rcode, star;
		
		
		public SummaryVO () {
			
		}
		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public String getReview() {
			return review;
		}

		public void setReview(String review) {
			this.review = review;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getReviewDate() {
			return reviewDate;
		}

		public void setReviewDate(String reviewDate) {
			this.reviewDate = reviewDate;
		}

		public int getView() {
			return view;
		}

		public void setView(int view) {
			this.view = view;
		}

		public int getRcode() {
			return rcode;
		}

		public void setRcode(int rcode) {
			this.rcode = rcode;
		}

		public int getStar() {
			return star;
		}

		public void setStar(int star) {
			this.star = star;
		}

		@Override
		public String toString() {
			return "SummaryVO [category=" + category + ", review=" + review + ", name=" + name + ", reviewDate="
					+ reviewDate + ", view=" + view + ", rcode=" + rcode + ", star=" + star + "]";
		}

		public SummaryVO(String category, String review, String name, String reviewDate, int view, int rcode,
				int star) {
			super();
			this.category = category;
			this.review = review;
			this.name = name;
			this.reviewDate = reviewDate;
			this.view = view;
			this.rcode = rcode;
			this.star = star;
		}
		
		
		
		
		
}
