package day0818;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import kr.co.sist.dao.DbConn;

public class UseInsertProc {

	public UseInsertProc(CpDeptVO cdVO) throws SQLException {
		Connection con = null;
		CallableStatement cstmt = null;

		DbConn db = DbConn.getInstance();

		try {
			// 1.
			// 2.
			con = db.getConnection("localhost", "scott", "tiger");
			// 3.
			cstmt = con.prepareCall("{ call insert_proc(?,?,?, ?,?) }");
			// 4. bind 변수 값 설정
			// in parameter
			cstmt.setInt(1, cdVO.getDeptno());
			cstmt.setString(2, cdVO.getDname());
			cstmt.setString(3, cdVO.getLoc());

			// out parameter
			cstmt.registerOutParameter(4, Types.NUMERIC);
			cstmt.registerOutParameter(5, Types.VARCHAR);

			// 5.
			cstmt.execute();
			// 6. registerOutParameter에 할당된 값 얻기
			int cnt = cstmt.getInt(4);
			String msg = cstmt.getString(5);
			System.out.println(cnt + " / " + msg);

		} finally {

			// 7. 연결 끊기
			db.dbClose(null, cstmt, con);
		} // end finally

	}// UseInsertProc

	public static void main(String[] args) {
		try {
			CpDeptVO cdVO = new CpDeptVO(2, "SI", "서울");
			new UseInsertProc(cdVO);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
	}// mian

}// class
