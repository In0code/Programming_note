package kr.co.sist.user.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BuyGoodsDomain {
	private String name,pcode,img,safety_pay,buyReceiptCode,payment;
	private Date payment_date;
	private int price;
}

