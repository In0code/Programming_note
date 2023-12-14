package kr.co.sist.user.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MyInquiryDomain {
	
	private String inquiryCode,type,context ,answer, status;
	private Date askDate;

}
