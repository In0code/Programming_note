package kr.co.sist.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import lombok.Getter;

/**
 * 다양한 데이터의 의존성 주입
 * @author user
 *
 */
@Getter
public class ServiceImpl3 {
	private int num;
	private String name;
	private List<String> listName;
	private Set<String> setName;
	private Map<String, String> map;
	
	public ServiceImpl3(int num) {
		this.num=num;
		System.out.println("int를 매개변수로 받는 생성자 : "+num);
		
	}
	public ServiceImpl3(String name) {
	this.name=name;
	System.out.println("String를 매개변수로 받는 생성자 : "+name);
	
}
	
	public ServiceImpl3(List<String> listName) {
		this.listName=listName;
		System.out.println("List를 매개변수로 받는 생성자 : "+listName);
	}
	
	public ServiceImpl3(Set<String> setName) {
		this.setName=setName;
		System.out.println("Set을 매개변수로 받는 생성자 : "+setName);
	}
	
	public ServiceImpl3(Map<String,String> map) {
		this.map=map;
		System.out.println("map를 매개변수로 받는 생성자 : "+map);
	}
}//class
