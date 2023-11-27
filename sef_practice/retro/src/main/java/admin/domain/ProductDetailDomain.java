package admin.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductDetailDomain {
	private String img,id,nickname,category,pname,pcode,status;
	private int price;
	private Date input_date;
	private boolean cancle;
}
