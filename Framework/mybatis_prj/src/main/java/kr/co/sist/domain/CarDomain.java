package kr.co.sist.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CarDomain {

	private String model, car_img,car_option;
	private int cc,price;
	private Date hiredate;
	
	
	
}
