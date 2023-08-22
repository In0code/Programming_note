package day0817_work;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConn;

public class TableInfoDAO {

	private static TableInfoDAO ti;

	 TableInfoDAO() {
	}// TableInfoDAO

	public static TableInfoDAO getInstance() {
		if (ti == null) {
			ti = new TableInfoDAO();
		} // end if
		return ti;
	}// getInstance

	public List<TableinfoVO> selectInfo(String tableName) throws SQLException {
		
		List<TableinfoVO> list= new ArrayList<TableinfoVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();
		try {

			// 1. 드라이버로딩

			// 2. 커넥션 얻기
			con = db.getConnection("localhost", "scott", "tiger");
			StringBuilder selectTable = new StringBuilder();
			selectTable.append("	select column_name, data_type, data_length, nullable, data_default 	")
					.append("	 from user_tab_cols	").append("	where table_name = ?	");

			pstmt = con.prepareStatement(selectTable.toString());
			// 3. 쿼리문 실행 객체 얻기

			// 4. 바인드 변수 값 설정
			pstmt.setString(1, tableName);
			
			// 5. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
			}
				
		} finally {
			db.dbClose(rs, pstmt, con);
			// 6. 연결 끊기
		} // end finally
		return list;
	}// selectInfo
	

}// class
