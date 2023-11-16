package kr.co.sist.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WebMemberVO {
	private String id, password, name, birthday, cell, email, email1, email2, gender, area, 
	zipcode, addr1, addr2, info, ip;
	private String[] lang;
	private Date inputDate;
	
	
}
