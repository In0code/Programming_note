package day0817work;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConn;

public class WorkDAO {

	public ArrayList<String> selectTableNames() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> tname = new ArrayList<String>();

		DbConn db = DbConn.getInstance();

		try {
			con = db.getConnection("localhost", "scott", "tiger");
			String selectTable = "select tname from tab ";
			pstmt = con.prepareStatement(selectTable);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				tname.add(rs.getString("tname"));
			} // end while

		} finally {
			db.dbClose(rs, pstmt, con);
		} // end finally

		return tname;
	}// tableName

	public List<WorkVO> selectTableInfo(String tableName) throws SQLException {
		WorkVO wVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<WorkVO> list = new ArrayList<WorkVO>();

		DbConn db = DbConn.getInstance();

		try {
			con = db.getConnection("localhost", "scott", "tiger");

			StringBuilder selectTable = new StringBuilder();
			selectTable.append("  select column_name, data_type, data_length, data_precision, nullable, data_default ")
					.append(" 	 from 	user_tab_cols  	  		 ").append("  where table_name=?	 		 	 ");

			pstmt = con.prepareStatement(selectTable.toString());
			pstmt.setString(1, tableName);
			rs = pstmt.executeQuery(); // PreparedStatemet에서 제공하는 method

			// 주의 : Statement에서 제공하는 method : 문법에는 문제가 없으나 실행 중에 문제가 발생
//			rs = pstmt.executeQuery(selectTable.toString()); 

			while (rs.next()) {
				wVO = new WorkVO(rs.getString("column_name"), rs.getString("data_type"), rs.getString("data_length"),
						rs.getString("nullable"), rs.getString("data_precision"), rs.getString("data_default"));

				list.add(wVO);
			} // end while

		} finally {
			db.dbClose(rs, pstmt, con);
		} // end finally
		return list;

	}// selectTable

}// class
