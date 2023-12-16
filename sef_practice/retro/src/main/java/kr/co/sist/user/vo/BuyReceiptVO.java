package kr.co.sist.user.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BuyReceiptVO {

	private String id, pcode, payment;
	private Date payment_date;
	
}
