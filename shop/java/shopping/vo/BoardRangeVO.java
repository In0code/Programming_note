package shopping.vo;

public class BoardRangeVO {

	private int startNum, endNum;
	private String field, keyword, tableName;

	public BoardRangeVO() {
	}

	public BoardRangeVO(int startNum, int endNum, String field, String keyword, String tableName) {
		super();
		this.startNum = startNum;
		this.endNum = endNum;
		this.field = field;
		this.keyword = keyword;
		this.tableName = tableName;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	@Override
	public String toString() {
		return "BoardRangeVO [startNum=" + startNum + ", endNum=" + endNum + ", field=" + field + ", keyword=" + keyword
				+ ", tableName=" + tableName + "]";
	}

	
	
	
	
}
