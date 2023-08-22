package day0817;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConn;

public class UseClob {

	public UseClob() throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();

		try {
			// 1.
			// 2.
			con = db.getConnection("localhost", "scott", "tiger");
			// 3.
			StringBuilder selectClob = new StringBuilder();
			selectClob.append("	select subject, content, writer	").append("	from test_clob	");
			pstmt = con.prepareStatement(selectClob.toString());
			// 4.
			// 5.
			rs = pstmt.executeQuery();

			String subject = "";
			String content = "";
			BufferedReader br = null;
			StringBuilder contentData = new StringBuilder();

			while (rs.next()) {
				subject = rs.getString("subject");
				System.out.println("제목 : " + subject);
				// clob : getString으로 값을 얻을 수 있으나, Linux에서는 동작하지 않는다
//				content = rs.getString("content");
				try {
					br = new BufferedReader(rs.getClob("content").getCharacterStream());
					while ((content = br.readLine()) != null) {
						contentData.append(content).append("\n");
					} // end while
					if (br != null) {
						br.close();
					} // end if
				} catch (IOException ie) {
					ie.printStackTrace();
				} // end catch
				System.out.println("내용 : " + contentData);
				contentData.delete(0, contentData.length());
			} // end while

		} finally {
			// 6.
			db.dbClose(rs, pstmt, con);

		} // end finally

	}// UseClob

	public static void main(String[] args) {
		try {
			new UseClob();
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
	}// main

}// class
