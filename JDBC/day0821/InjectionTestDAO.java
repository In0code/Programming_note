package day0821;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import kr.co.sist.dao.DbConn;

public class InjectionTestDAO {

	private static InjectionTestDAO itDAO;

	private InjectionTestDAO() { // singleton

	}// InjectionTestDAO

	public static InjectionTestDAO getInstance() {
		if (itDAO == null) {
			itDAO = new InjectionTestDAO();
		} // end if
		return itDAO;
	}// getInstance

	public LoginResultVO useStatementLogin(LoginVO lVO) throws SQLException {
		LoginResultVO lrVO = null;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();
		try {

			// 1.
			// 2.
			con = db.getConnection("localhost", "scott", "tiger");

			// 3.
			stmt = con.createStatement();
			// 4.
			StringBuilder selectLogin = new StringBuilder();
			selectLogin.append("	select name, input_date	").append("	from test_login	").append("	where id= '")
					.append(lVO.getId()).append("' and pass='").append(lVO.getPassword()).append("'");

			rs = stmt.executeQuery(selectLogin.toString());

			if (rs.next()) {
				lrVO = new LoginResultVO(rs.getString("name"), rs.getDate("input_date"));
			} // end if
		} finally {
			db.dbClose(rs, stmt, con);
			// 5.
		} // end finally

		return lrVO;
	}// useStatementLogin

	public LoginResultVO usePreparedStatementLogin(LoginVO lVO) throws SQLException {
		LoginResultVO lrVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();
		try {

			// 1.
			// 2.
			con = db.getConnection("localhost", "scott", "tiger");

			// 3.
			StringBuilder selectLogin = new StringBuilder();
			selectLogin.append("	select name, input_date	").append("	from test_login	")
					.append("	where id= ? and pass= ? ");

			pstmt = con.prepareStatement(selectLogin.toString());
			// 4.

			pstmt.setString(1, lVO.getId());
			pstmt.setString(2, lVO.getPassword());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				lrVO = new LoginResultVO(rs.getString("name"), rs.getDate("input_date"));
			} // end if
		} finally {
			db.dbClose(rs, pstmt, con);
			// 5.
		} // end finally

		return lrVO;
	}// usePreparedStatementLogin

}// class
