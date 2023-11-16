package kr.co.sist.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class WebMemberDomain {
	private String id,name, birth, tel, email, gender, zipcode,
	addr1, addr2, info, input_date, ip;
}
