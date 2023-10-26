package member.vo;

import java.sql.Date;

public class UserVO {
	private String id, name, email;
	private Date sign_date;
	
	public UserVO(){
		
	}

	public UserVO(String id, String name, String email, Date sign_date) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.sign_date = sign_date;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getSign_date() {
		return sign_date;
	}

	public void setSign_date(Date sign_date) {
		this.sign_date = sign_date;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", name=" + name + ", email=" + email + ", sign_date=" + sign_date + "]";
	}


	
}
