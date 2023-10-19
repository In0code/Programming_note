package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbConnection {
	private static DbConnection db;

	private DbConnection() {
	}// DbConnection

	public static DbConnection getInstance() {
		if (db == null) {
			db = new DbConnection();
		} // end if
		return db;
	}// getInstance

	public Connection getConn(String jndiName) throws SQLException {
		Connection con = null;
		// 1. JNDI사용 객체 생성
		try {
			Context ctx = new InitialContext();
			// 2. DataSource 얻기
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/" + jndiName);
			// 3. Connection 얻기
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		}//end catch

		return con;
	}// getConn
	
	public void dbClose(ResultSet rs, Statement stmt, Connection con)throws SQLException{
		if(rs != null) { rs.close(); }//end if
		if(stmt != null) { stmt.close(); }//end if
		if(con != null) { con.close(); }//end if
		
	}//dbClose

}// class
