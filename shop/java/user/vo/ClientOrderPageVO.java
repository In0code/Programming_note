package user.vo;

public class ClientOrderPageVO {
	
	private int startNum, endNum;
	private String id;
	
	public ClientOrderPageVO() {
	}

	public ClientOrderPageVO(int startNum, int endNum, String id) {
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
		return "ClientOrderPageVO [startNum=" + startNum + ", endNum=" + endNum + ", id=" + id + "]";
	}
}
