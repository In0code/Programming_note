package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.vo.BoardRangeVO;
import admin.vo.NoticeVO;
import common.dao.DbConnection;

public class NoticeDAO {
	
	private static NoticeDAO nDAO;
	
	private NoticeDAO() {
	}
	
	public static NoticeDAO getInstance() {
		if(nDAO == null) {
			nDAO = new NoticeDAO();
		}
		
		return nDAO;
	}
	
	public List<NoticeVO> selectNotice(BoardRangeVO brVO) throws SQLException {
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectNotice = new StringBuilder();
			selectNotice.append("	SELECT NCODE, NOT_TITLE, NOT_TEXT, TO_CHAR(NOT_DATE, 'YYYY-MM-DD HH24:MI') DATE, VIEW_NUM	")
			.append("	FROM (SELECT ROW_NUMBER() OVER(ORDER BY NOT_DATE DESC) RNUM,	")
			.append("	NCODE, ID, NOT_TITLE, NOT_TEXT, NOT_DATE, VIEW_NUM	")
			.append("	FROM NOTICE)	")
			.append("	WHERE RNUM BETWEEN ? AND ?	");
			
			pstmt = con.prepareStatement(selectNotice.toString());
			pstmt.setInt(1, brVO.getStartNum());
			pstmt.setInt(2, brVO.getStartNum());
			
			rs = pstmt.executeQuery();
			NoticeVO nVO = null;
			while(rs.next()) {
				nVO = new NoticeVO(rs.getString("NOT_TITLE"), rs.getString("NOT_TEXT"), rs.getString("DATE"),
						rs.getInt("NCODE"), rs.getInt("VIEW_NUM"));
				
				list.add(nVO);
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
	
	public NoticeVO selectOneNotice(int code) throws SQLException {
		NoticeVO nVO = null;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String selectNotice = "SELECT NOT_TITLE, NOT_TEXT FROM NOTICE WHERE NCODE = ?";
			
			pstmt = con.prepareStatement(selectNotice);
			pstmt.setInt(1, code);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				nVO = new NoticeVO();
				nVO.setNoticeTitle(rs.getString("NOT_TITLE"));
				nVO.setNoticeText("NOT_TEXT");
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return nVO;
	}
	
	public void insertNotice(NoticeVO nVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder insertNotice = new StringBuilder();
			insertNotice
			.append("INSERT INTO NOTICE(NCODE, ID, NOT_TITLE, NOT_TEXT, VIEW_NUM")
			.append("VALUES(NCODE, ID, ?, ?, 0)");
			
			pstmt = con.prepareStatement(insertNotice.toString());
			pstmt.setString(1, nVO.getNoticeTitle());
			pstmt.setString(2, nVO.getNoticeText());
			
			pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
	}
	
	public int updateNotice(NoticeVO nVO) throws SQLException {
		int result = 0;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String updateNotice = "UPDATE NOTICE SET NOT_TITLE=?, NOT_TEXT=? WHERE NCODE=?";
			
			pstmt = con.prepareStatement(updateNotice);
			pstmt.setString(1, nVO.getNoticeTitle());
			pstmt.setString(2, nVO.getNoticeText());
			pstmt.setInt(3, nVO.getNcode());
			
			result = pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		
		
		return result;
	}
}
