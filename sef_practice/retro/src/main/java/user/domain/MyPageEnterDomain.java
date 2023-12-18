package kr.co.sist.user.domain;

import lombok.ToString;
import lombok.Setter;
import lombok.Getter;

@Getter
@Setter
@ToString
public class MyPageEnterDomain {
	
	private String id, nickname, email, pw, phone;

}
