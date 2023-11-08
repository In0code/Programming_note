package common.dao;

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
	}
 
	
	public static DbConnection getInstance() {
		if(db == null) {
			db = new DbConnection();
		}
		return db;
	}
	
	public Connection getConn(String jndiName) throws SQLException {
		Connection con = null;
		
		//JNDI 사용 객체 생성
		try {
			Context ctx = new InitialContext();
			//데이터 소스 얻기
			DataSource ds = (DataSource)ctx.lookup("java:/comp/env/"+jndiName);
			//connection 얻기
			con = ds.getConnection();
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	public void dbClose(ResultSet rs, Statement stmt, Connection con) throws SQLException {
		if(rs != null) { rs.close(); }
		if(stmt != null) { stmt.close(); }
		if(con != null) { con.close(); }
	}
}
