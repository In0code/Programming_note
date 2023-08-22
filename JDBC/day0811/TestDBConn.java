package day0811;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestDBConn {
	public TestDBConn() throws SQLException {
		// 1. 드라이버로딩 ( ojdbc8.jar 안에 존재 => JVM에서는 jar의 위치를 모른다 )
		//eclipse에서는 buildpath로 알게한다
		//DOS에서는 classpath로 알게 한다
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("드라이버로딩 성공!!");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} // end catch

		// 2.로딩된 드라이버를 사용하여 Connection 얻기
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		String id = "scott";
		String pass = "tiger";

		Connection con = DriverManager.getConnection(url, id, pass);
		System.out.println("DB연결성공" + con);

	}// TestDBConn

	public static void main(String[] args) {
		try {
			new TestDBConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch

	}// main
}// class
