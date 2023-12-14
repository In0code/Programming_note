package kr.co.sist.user.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WishDomain {

	private String img, pname, wcode, pcode, id;
	private int price;
	private Date input_date;
	
}
