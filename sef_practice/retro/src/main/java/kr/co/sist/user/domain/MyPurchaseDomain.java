package kr.co.sist.user.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyPurchaseDomain {
	private String pcode, buyreceiptcode, pname, img, payment_date, 
	seller, phone, buyer, select1, select2, context, safecode, buy_date, nickname, code, payment, commentcode;
	private int price;
}
