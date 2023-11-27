package admin.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductDomain {
	private String img, nickname, category, pname, status;
	private int price;
	private Date input_date;
}
