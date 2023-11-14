package kr.co.sist.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CarDomain2 {

	private String model, car_img,car_option, maker;
	private int cc,price, car_year;
	private Date hiredate;
	
}
