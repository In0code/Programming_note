package user.vo;

public class WishListPageVO {

	private int startNum, endNum;
	private String id;
	public WishListPageVO() {
		super();
	}
	public WishListPageVO(int startNum, int endNum, String id) {
		super();
		this.startNum = startNum;
		this.endNum = endNum;
		this.id = id;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "WishListPageVO [startNum=" + startNum + ", endNum=" + endNum + ", id=" + id + "]";
	}
	
	
	
	
}
