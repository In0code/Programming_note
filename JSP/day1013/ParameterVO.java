package day1013;

import java.util.Arrays;

public class ParameterVO {
	//주의 : form control명과 instance명과 instance variable명이 같을 것 !!!
	private String id,password,name,birthday,tel,cell,email1,email2,gender,area,zipcode,addr0,addr1;
	
	private String[] lang;	//이름이 같으면 배열로 처리한다 

	public ParameterVO() {
	}

	public ParameterVO(String id, String password, String name, String birthday, String tel, String cell, String email1,
			String email2, String gender, String area, String zipcode, String addr0, String addr1, String[] lang) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		this.tel = tel;
		this.cell = cell;
		this.email1 = email1;
		this.email2 = email2;
		this.gender = gender;
		this.area = area;
		this.zipcode = zipcode;
		this.addr0 = addr0;
		this.addr1 = addr1;
		this.lang = lang;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCell() {
		return cell;
	}

	public void setCell(String cell) {
		this.cell = cell;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr0() {
		return addr0;
	}

	public void setAddr0(String addr0) {
		this.addr0 = addr0;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String[] getLang() {
		return lang;
	}

	public void setLang(String[] lang) {
		this.lang = lang;
	}

	@Override
	public String toString() {
		return "ParameterVO [id=" + id + ", password=" + password + ", name=" + name + ", birthday=" + birthday
				+ ", tel=" + tel + ", cell=" + cell + ", email1=" + email1 + ", email2=" + email2 + ", gender=" + gender
				+ ", area=" + area + ", zipcode=" + zipcode + ", addr0=" + addr0 + ", addr1=" + addr1 + ", lang="
				+ Arrays.toString(lang) + "]";
	}   
	
	
	
}
