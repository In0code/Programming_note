package member.vo;

public class FindIdPwVO {
	private String id, name, phone;

	public FindIdPwVO() {
	}

	public FindIdPwVO(String id, String name, String phone) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "FindIdPwVO [id=" + id + ", name=" + name + ", phone=" + phone + "]";
	}
	
	
}
