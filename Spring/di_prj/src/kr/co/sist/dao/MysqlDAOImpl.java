package kr.co.sist.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MysqlDAOImpl implements DAO {

	public MysqlDAOImpl() {
		System.out.println("MysqlDAOImpl의 기본생성자");
	}
	
	@Override
	public void insertName(String name) throws SQLException {
		System.out.println(name+" 추가");
	}//insert

	@Override
	public List<String> selectAllNames() throws SQLException {
		
		List<String> list=new ArrayList<String>();
		list.add("홍찬영-조장");
		list.add("박상준-실제조장");
		list.add("강다연-실세");
		list.add("송지하-지하");
		
		return list;
	}//selectAllNames

}//class
