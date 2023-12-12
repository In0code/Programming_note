package kr.co.sist.user.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	private String c3code, id, pcode, pname, context, img, img2, img3, 
		img4, img5, status, loc, deliver;
	private int price;
}//class
