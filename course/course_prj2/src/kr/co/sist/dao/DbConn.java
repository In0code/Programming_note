package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//돼라
public class DbConn {
	private static DbConn dbConn;
	
	private DbConn() {}
	
	public static DbConn getInstance() {
		if(dbConn == null) {
			dbConn = new DbConn();
		}
		
		return dbConn;
	}
	
	/**
	 * DB 연결을 얻는 일
	 * @param ip -서버 주소
	 * @param id -아이디
	 * @param pass -비번
	 * @return
	 * @throws SQLException
	 */
	public Connection getConnection(String ip, String id, String pass) throws SQLException {
		Connection con = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String url = "jdbc:oracle:thin:@"+ip+":1521:orcl";
		con = DriverManager.getConnection(url,id,pass);
		
		return con;
	}
	
	/**
	 * 연결 끊기
	 * @param rs ResultSet
	 * @param stmt Statement
	 * @param con Connection
	 * @throws SQLException
	 */
	public void dbClose(ResultSet rs, Statement stmt, Connection con) throws SQLException {
		if(rs != null) { rs.close(); }
		if(stmt != null) { stmt.close(); }
		if(con != null) { con.close(); }
	}
}
