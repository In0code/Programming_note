package summary.vo;

public class SummaryVO {

		private String category,review, name,reviewDate;
		
		private int view;
		
		public SummaryVO() {
			
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

		@Override
		public String toString() {
			return "SummaryVO [category=" + category + ", review=" + review + ", name=" + name + ", reviewDate="
					+ reviewDate + ", view=" + view + "]";
		}

		public SummaryVO(String category, String review, String name, String reviewDate, int view) {
			super();
			this.category = category;
			this.review = review;
			this.name = name;
			this.reviewDate = reviewDate;
			this.view = view;
		}
		
		
}
