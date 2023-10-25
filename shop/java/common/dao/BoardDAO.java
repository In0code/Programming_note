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
	
	public int bmTotalCnt(BoardRangeVO brVO) throws SQLException {
		int totalCnt = 0;
		String keyword = brVO.getKeyword();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");

			
			StringBuilder selectCount = new StringBuilder();
			selectCount
			.append("	SELECT COUNT(*) CNT FROM 	")
			.append(brVO.getTableName());
			
			if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
				String field = "1".equals(brVO.getField()) ? "id" : "gname";
				
				selectCount.append("where ").append(field).append(" like '%'||?||'%'");
			}
			
			pstmt = con.prepareStatement(selectCount.toString());
			
			if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
				pstmt.setString(1, keyword);
			}
			
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
