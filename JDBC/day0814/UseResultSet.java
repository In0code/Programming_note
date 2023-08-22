package day0814;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import kr.co.sist.statement.DbConnection;

public class UseResultSet {

	public UseResultSet() throws SQLException {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		DbConnection db = new DbConnection();
		try {
			// 1. 드라이버 로딩

			// 2. 커넥션 얻기
			con = db.getConn();
			// 3. 쿼리문 생성 객체 얻기
			stmt = con.createStatement();
			// 4. 쿼리문 수행 후 결과 얻기
			String select = "select empno,ename,hiredate,2023.08 temp, to_char(hiredate,'mm-dd-yyyy') hire  from emp";
			rs = stmt.executeQuery(select);

			// 조회 결과가 있다면 반복시켜 모두 가져온다
			int empno = 0;
			String ename = null;
			Date date = null;
			double temp = 0.0;
			String hire = "";
			
			SimpleDateFormat sdf=new SimpleDateFormat("MM-dd-yyyy");
			while (rs.next()) { // 있는지 없는지 모르지만, 있다면 끝까지 가져온다
//				empno=rs.getInt(1); //컬럼인덱스는 어떤 컬럼의 값을 얻는지 알 수 없다. 
				empno = rs.getInt("empno"); // 컬럼명은 어떤 컬럼의 값을 얻는지 알 수 있다.
				ename = rs.getString("ename");
				date = rs.getDate("hiredate");  // 내가 원하는 날짜형식으로 출력하고 싶으면? SimpleDateFormat 쓰면 됨
				temp = rs.getDouble("temp");
				hire = rs.getString("hire");
				System.out.println(empno + " / " + ename + " / " + sdf.format(date) + " / " + temp + " / " + hire);

			} // end while

		} finally {
			// 5. 연결 끊기
			db.closeDB(rs, stmt, con);
		} // end finally

	}// UseResultSet

	public static void main(String[] args) {
		try {
			new UseResultSet();
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

	}// main
}// class
