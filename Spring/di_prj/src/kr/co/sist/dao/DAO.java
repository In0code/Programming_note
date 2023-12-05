package kr.co.sist.dao;

import java.sql.SQLException;
import java.util.List;

public interface DAO {
	
	public void insert(String name)throws SQLException;
	public List<String> selectAllNames() throws SQLException;
		
	
}//interface
