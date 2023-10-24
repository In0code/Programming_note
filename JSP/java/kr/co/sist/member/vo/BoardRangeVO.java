package kr.co.sist.member.vo;

public class BoardRangeVO {

	private int startNum, endNum;
	private String field, keyword;

	public BoardRangeVO() {
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

	@Override
	public String toString() {
		return "BoardRangeVO [startNum=" + startNum + ", endNum=" + endNum + ", field=" + field + ", keyword=" + keyword
				+ "]";
	}

	
	
	
}
