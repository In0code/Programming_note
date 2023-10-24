package shopping.vo;

public class NoticeVO {
	
	private String id, noticeTitle, noticeText, noticeDate;
	private int ncode, viewNum;
	
	public NoticeVO() {
	}

	public NoticeVO(String id, String noticeTitle, String noticeText, String noticeDate, int ncode, int viewNum) {
		this.id = id;
		this.noticeTitle = noticeTitle;
		this.noticeText = noticeText;
		this.noticeDate = noticeDate;
		this.ncode = ncode;
		this.viewNum = viewNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeText() {
		return noticeText;
	}

	public void setNoticeText(String noticeText) {
		this.noticeText = noticeText;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getNcode() {
		return ncode;
	}

	public void setNcode(int ncode) {
		this.ncode = ncode;
	}

	public int getViewNum() {
		return viewNum;
	}

	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
	}

	@Override
	public String toString() {
		return "NoticeVO [id=" + id + ", noticeTitle=" + noticeTitle + ", noticeText=" + noticeText + ", noticeDate="
				+ noticeDate + ", ncode=" + ncode + ", viewNum=" + viewNum + "]";
	}
}
