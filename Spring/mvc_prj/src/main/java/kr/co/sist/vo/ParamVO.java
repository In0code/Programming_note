package kr.co.sist.vo;

import org.springframework.web.bind.annotation.RequestParam;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ParamVO {
	private String name;
	private int age;
	private String[] hobby;
	
	public void setAge(@RequestParam(required=false, defaultValue = "0") int age) {
		this.age = age;
	}
	
	
	
}
