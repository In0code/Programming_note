package day1004;

public class testVO {
	private String img,info,url;

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public testVO(String img, String info, String url) {
		super();
		this.img = img;
		this.info = info;
		this.url = url;
	}

	public testVO() {
		super();
	}

	@Override
	public String toString() {
		return "testVO [img=" + img + ", info=" + info + ", url=" + url + "]";
	}

	
}
