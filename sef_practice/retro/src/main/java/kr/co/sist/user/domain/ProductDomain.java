package kr.co.sist.user.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductDomain {
	private String c3code, pcode, pname, context, img, img2, img3, img4, img5, status, loc, 
	deliver, saleok,pcancel, cname, c2name,c3name;
	private int price;
	private Date input_date;
}//class
