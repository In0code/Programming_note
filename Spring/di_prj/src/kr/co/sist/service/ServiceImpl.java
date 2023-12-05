package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.sist.dao.DAO;

public class ServiceImpl implements Service {
	private DAO dao;
	
	/**
	 * DAO의 의존성 주입
	 * @param dao
	 */
	public ServiceImpl(DAO dao) {
		System.out.println("ServiceImpl의 의존성 주입 받는 생성자");
		this.dao=dao;
	}//ServiceImpl
	
	@Override
	public void addName(String name) {
		try {
			dao.insert(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
	}//addName

	@Override
	public List<String> searchName() {
		List<String> list=null;
		try {
			list = dao.selectAllNames();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return list;
	}//searchName

}//class
