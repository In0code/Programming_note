package kr.co.sist.user.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class GoodsDomain {
	public String c_code,c2_Code,c3_Code,img,img2,img3,img4,img5,pname,pcode,
	input_date,deliver,status,loc,context,id;
	public int price,pview,wish,credit_level;
	public boolean isWish;
}

