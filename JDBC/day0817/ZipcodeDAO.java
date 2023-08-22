package day0817;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConn;

public class ZipcodeDAO {

	private static ZipcodeDAO zipDAO;

	private ZipcodeDAO() {

	}// ZipcodeDAO

	public static ZipcodeDAO getInstance() {
		if (zipDAO == null) {
			zipDAO = new ZipcodeDAO();

		} // end if
		return zipDAO;
	}// getInstance

	public List<ZipcodeVO> selectZipcode(String dong) throws SQLException {

		List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();
		try {
			// 1.

			// 2.
			con = db.getConnection("127.0.0.1", "scott", "tiger");

			StringBuilder selectZipCode = new StringBuilder();
			selectZipCode.append("	select Zipcode,sido, gugun, dong, nvl(bunji,' ')bunji	")
					.append("	from zipcode	").append("	where dong like ?||'%'	");
			pstmt = con.prepareStatement(selectZipCode.toString());

			// 3.
			// 4.
			pstmt.setString(1, dong);
			// 5.
			rs = pstmt.executeQuery();

			ZipcodeVO zVO = null;
			while (rs.next()) {
				zVO = new ZipcodeVO(rs.getString("zipcode"), rs.getString("sido"), rs.getString("gugun"),
						rs.getString("dong"), rs.getString("bunji"));

				list.add(zVO);
			} // end while
		} finally {
			// 6.
			db.dbClose(rs, pstmt, con);
		} // end finally
		return list;

	}// selectZipcode

	public List<ZipcodeVO> selectStatementZipcode(String dong) throws SQLException {

		List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();
		try {
			// 1.

			// 2.
			con = db.getConnection("127.0.0.1", "scott", "tiger");

			// 3.
			stmt = con.createStatement();

			StringBuilder selectZipCode = new StringBuilder();
			selectZipCode.append("	select Zipcode,sido, gugun, dong, nvl(bunji,' ')bunji	")
					.append("	from zipcode	").append("	where dong like '").append(dong).append("%'");

			// 4.
			rs = stmt.executeQuery(selectZipCode.toString());

			ZipcodeVO zVO = null;
			while (rs.next()) {
				zVO = new ZipcodeVO(rs.getString("zipcode"), rs.getString("sido"), rs.getString("gugun"),
						rs.getString("dong"), rs.getString("bunji"));

				list.add(zVO);
			} // end while
				// 5.
		} finally {
			// 6.
			db.dbClose(rs, stmt, con);
		} // end finally
		return list;

	}// selectStatementZipcode

}// class
