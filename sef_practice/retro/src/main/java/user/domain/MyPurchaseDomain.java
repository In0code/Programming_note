package kr.co.sist.user.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyPurchaseDomain {
	private String pcode, buyreceiptcode, pname, img, payment_date, seller, phone, buyer, select1, select2, select2_1, select2_2, select2_3, select2_4,
	context, safecode, buy_date, nickname, code, payment, commentcode;
	private int price;
	
	private List<String> cmlist;
}
