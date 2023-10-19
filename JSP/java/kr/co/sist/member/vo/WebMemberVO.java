package kr.co.sist.member.vo;

import java.util.Arrays;

public class WebMemberVO {
	private String id, password, name, birthday, cell, email, email1, email2, gender, area, 
	zipcode, addr1, addr2, info, ip;
	private String[] lang;

	public WebMemberVO() {

	}

	public WebMemberVO(String id, String password, String name, String birthday, String cell, String email,
			String email1, String email2, String gender, String area, String zipcode, String addr1, String addr2,
			String info, String ip, String[] lang) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		this.cell = cell;
		this.email = email;
		this.email1 = email1;
		this.email2 = email2;
		this.gender = gender;
		this.area = area;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.info = info;
		this.ip = ip;
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

	public String getCell() {
		return cell;
	}

	public void setCell(String cell) {
		this.cell = cell;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String[] getLang() {
		return lang;
	}

	public void setLang(String[] lang) {
		this.lang = lang;
	}

	@Override
	public String toString() {
		return "WebMemberVO [id=" + id + ", password=" + password + ", name=" + name + ", birthday=" + birthday
				+ ", cell=" + cell + ", email=" + email + ", email1=" + email1 + ", email2=" + email2 + ", gender="
				+ gender + ", area=" + area + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", info=" + info + ", ip=" + ip + ", lang=" + Arrays.toString(lang) + "]";
	}
	
	
}
