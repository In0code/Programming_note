package day0821;

public class LoginVO {

	private String id,password;

	public LoginVO(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}

	public LoginVO() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", password=" + password + "]";
	}
	
	
	
}
