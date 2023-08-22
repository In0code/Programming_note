package day0821;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.co.sist.dao.DbConn;

/**
 * Transaction 처리
 * 
 * @author user
 *
 */
public class TestTransaction {

	private Connection con;

	public int insertTest() throws SQLException {
		int cnt = 0;

		DbConn db = DbConn.getInstance();

		con = db.getConnection("localhost", "scott", "tiger");
		con.setAutoCommit(false); // autocommit 해제

		// try catch로 끊으면 안됨. 끊는 순간 commit 됨
		PreparedStatement pstmt = null;

		String name = "홍찬영1";
		String addr = "서울시강남구역삼동한독";
		String sql = "insert into transaction1 (name,addr) values(?,?)";
		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, name);
		pstmt.setString(2, addr);

		int cnt1 = pstmt.executeUpdate();
		pstmt.close();

		//////////////////////////////////////////////////////

		sql = "insert into transaction2 (name,addr) values(?,?)";
		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, name);
		pstmt.setString(2, addr);

		int cnt2 = pstmt.executeUpdate();
		pstmt.close();

//		if (cnt1 == 1 && cnt2 == 1) {
//			con.commit();
//		} // end if

		cnt = cnt1 + cnt2;

		return cnt;
	}// insertTest

	public void useInsertTest() {

		try {
			int cnt = insertTest();
			if (cnt == 2) {
				System.out.println("추가성공");
				con.commit();
			} // end if
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			} // end catch
			e.printStackTrace();
		} // end catch

	}// useInsertTest

	public static void main(String[] args) {
		TestTransaction tt = new TestTransaction();
		tt.useInsertTest();
	}// main

}// class
