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
		int totalCnt = 0;
		String keyword = brVO.getKeyword();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");

			StringBuilder selectCount = new StringBuilder();
			selectCount.append("SELECT COUNT(*) CNT FROM  "+ brVO.getTableName());
			
			if(!"".equals(keyword) && !"null".equals(keyword) && keyword != null) {
				String field = "not_title";
				if("content".equals(brVO.getField())) field = "not_text";
				selectCount.append(" where ").append(field).append(" like '%'||?||'%' ");
			}
			
			pstmt = con.prepareStatement(selectCount.toString());
			
			if(!"".equals("keyword") && !"null".equals("keyword") && keyword != null) {
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
	
	public int totalCountNotice(BoardRangeVO brVO) throws SQLException {
		int totalCnt = 0;
		String keyword = brVO.getKeyword();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectCount = new StringBuilder();
			selectCount.append("SELECT COUNT(*) CNT FROM NOTICE where del_flag != 'Y' ");
			
			if(!"".equals(keyword) && !"null".equals(keyword) && keyword != null) {
				String field = "not_title";
				if("content".equals(brVO.getField())) field = "not_text";
				selectCount.append(" and ").append(field).append(" like '%'||?||'%' ");
			}
			
			pstmt = con.prepareStatement(selectCount.toString());
			
			if(!"".equals(keyword) && !"null".equals(keyword) && keyword != null) {
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
