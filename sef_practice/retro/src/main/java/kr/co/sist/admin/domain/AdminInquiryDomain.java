package kr.co.sist.admin.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class AdminInquiryDomain {
	
	private String inquiryCode,type,context,askDate,id,nickname,answer,status;

}
