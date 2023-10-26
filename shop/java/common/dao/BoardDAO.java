package common.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import admin.vo.BoardRangeVO;

public class BoardDAO {
	
	private static BoardDAO bDAO;
	
	private BoardDAO() {
	}
	
	public static BoardDAO getInstance() {
		if(bDAO == null) {
			bDAO = new BoardDAO();
		}
		
		return bDAO;
	}
	
	
	/**
	 * @param tableName 찾고자 하는 table명
	 * @return 테이블 전체 걸럼의 개수를 구해준다. 아무런 결과가 없으면 -1 반환
	 * @throws SQLException
	 */
	public int totalCount(BoardRangeVO brVO) throws SQLException {
		int totalCnt = -1;
		String keyword = brVO.getKeyword();
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");

			String selectCount = "SELECT COUNT(*) CNT FROM  "+ brVO.getTableName();
			
			pstmt = con.prepareStatement(selectCount);
			
			/*
			 * StringBuilder selectCount = new StringBuilder();
			 * selectCount.append("SELECT COUNT(*) CNT FROM ?");
			 * 
			 * pstmt = con.prepareStatement(selectCount.toString());
			 * pstmt.setString(1, tableName);
			 */
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCnt = rs.getInt("CNT");
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return totalCnt;
	}
	
}
