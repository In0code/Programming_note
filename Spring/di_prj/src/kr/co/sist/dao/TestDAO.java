package kr.co.sist.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class TestDAO implements DAO{

	@Override
	public void insertName(String name) throws SQLException {
		System.out.println("TestDAO에서 추가 "+name);
	}//insert

	@Override
	public List<String> selectAllNames() throws SQLException {
		List<String> list=new ArrayList<String>();
		list.add("홍지성-조장");
		list.add("정민교-조원");
		list.add("차준식-실세");
		list.add("김다영-조원");
		list.add("김주민-주민");
		
		return list;
	}//selectAllNames
	
}//class
