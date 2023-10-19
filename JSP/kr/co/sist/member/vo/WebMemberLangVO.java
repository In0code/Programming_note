package kr.co.sist.member.vo;

public class WebMemberLangVO {

	private String id,lang;

	public WebMemberLangVO() {
		super();
	}

	public WebMemberLangVO(String id, String lang) {
		super();
		this.id = id;
		this.lang = lang;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	@Override
	public String toString() {
		return "WebMemberLangVO [id=" + id + ", lang=" + lang + "]";
	}
	
	
	
	
}
