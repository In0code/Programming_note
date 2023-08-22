package day0814;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class TestSQLException {

	public TestSQLException() throws SQLException {

		// 1.드라이버로딩
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} // end catch

		Connection con = null;
		Statement stmt = null;

		try {
			// 2.커넥션얻기
			String url = "jdbc:oracle:thin:@192.168.10.137:1521:orcl";
			String id = "scott";
			String pass = "tiger";

			con = DriverManager.getConnection(url, id, pass);
			// 3.쿼리문 생성객체 얻기
			stmt = con.createStatement();
			// 4. 쿼리문 수행 후 결과 얻기
			int empno = 4323;
			String ename = "장용석";
			int sal = 555555;
			String sql1 = "insert into cp_emp3(empno,ename,sal,hiredate) values (" + empno + ",'" + ename + "'," + sal
					+ ",sysdate)";
//			String sql=
//					"insert into cp_emp3(empno,ename,hiredate) values (1234,'홍찬영',sysdate)";
//			int rowCnt=stmt.executeUpdate(sql);
			int rowCnt1 = stmt.executeUpdate(sql1);
			System.out.println(rowCnt1 + "건 추가되었습니다");

		} finally {
			// 5. 연결끊기 ( 중요 )
			if (stmt != null) {
				stmt.close();
			} // end if
			if (con != null) {
				con.close();
			} // end if
		} // end finally
	}// testQuery

	public static void main(String[] args) {
		try {
			new TestSQLException();
		} catch (SQLException e) {
			e.printStackTrace();
			switch (e.getErrorCode()) {
			case 1:
				System.out.println("사원번호가 중복됨");
				break;
			case 12899:
				System.out.println("사원명의 값이 너무 큼");
				break;
			case 1438:
				System.out.println("연봉에 입력된 값이 너무 큼");
				break;
			}// end switch
		} // end catch
	}// main
}// class
