package admin.vo;

public class NoticeVO {
	
	private String noticeTitle, noticeText, noticeDate, editDate, image;
	private int ncode, viewNum;
	
	public NoticeVO() {
	}

	public NoticeVO(String noticeTitle, String noticeText, String noticeDate, String editDate, String image, int ncode,
			int viewNum) {
		this.noticeTitle = noticeTitle;
		this.noticeText = noticeText;
		this.noticeDate = noticeDate;
		this.editDate = editDate;
		this.image = image;
		this.ncode = ncode;
		this.viewNum = viewNum;
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

	public String getEditDate() {
		return editDate;
	}

	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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
		return "NoticeVO [noticeTitle=" + noticeTitle + ", noticeText=" + noticeText + ", noticeDate=" + noticeDate
				+ ", editDate=" + editDate + ", image=" + image + ", ncode=" + ncode + ", viewNum=" + viewNum + "]";
	}
}
