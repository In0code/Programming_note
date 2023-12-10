package kr.co.sist.admin.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminProductDetailDomain {
	private String img,id,nickname,category,category2,category3,pname,pcode,status,pcancel;
	private int price;
	private Date input_date;
}
