package common.util;

public class BoardUtilVO {
	private String url,  keyword, field, category;
	private int currentPage, totalPage;
	
	public BoardUtilVO(String url, String keyword, String field, int currentPage, int totalPage) {
		super();
		this.url = url;
		this.keyword = keyword;
		this.field = field;
		this.currentPage = currentPage;
		this.totalPage = totalPage;
	}
	
	public BoardUtilVO(String url, String keyword, String field, int currentPage, int totalPage, String category) {
		super();
		this.url = url;
		this.keyword = keyword;
		this.field = field;
		this.currentPage = currentPage;
		this.totalPage = totalPage;
		this.category = category;
	}

	public BoardUtilVO() {
		super();
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}


	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	@Override
	public String toString() {
		return "BoardUtilVO [url=" + url + ", keyword=" + keyword + ", field=" + field
				+ ", totalPage=" + totalPage + ", currentPage=" + currentPage + ", getUrl()=" + getUrl()
				 + ", getKeyword()=" + getKeyword() + ", getField()=" + getField()
				+ ", getTotalPage()=" + getTotalPage() + ", getCurrentPage()=" + getCurrentPage() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

}
