package kr.co.sist.user.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductDomain {
	private String category, category2, category3, ccode,c2code,c3code, pcode, pname, context, img, img2, img3, img4, img5 ;
	private int price;
	private Date input_date;
}//class
