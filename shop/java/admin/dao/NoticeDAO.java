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
			selectNotice.append("	SELECT NCODE, NOT_TITLE, NOT_TEXT, TO_CHAR(NOT_DATE, 'YYYY-MM-DD HH24:MI') INPUT_DATE, VIEW_NUM, EDIT_DATE	")
			.append("	FROM (SELECT (ROW_NUMBER() OVER(ORDER BY NOT_DATE DESC)) RNUM,	")
			.append("	NCODE, ID, NOT_TITLE, NOT_TEXT, NOT_DATE, VIEW_NUM, EDIT_DATE	")
			.append("	FROM NOTICE WHERE DEL_FLAG='N')	")
			.append("	WHERE RNUM BETWEEN ? AND ?	");
			
			pstmt = con.prepareStatement(selectNotice.toString());
			pstmt.setInt(1, brVO.getStartNum());
			pstmt.setInt(2, brVO.getEndNum());
			
			rs = pstmt.executeQuery();
			NoticeVO nVO = null;
			while(rs.next()) {
				nVO = new NoticeVO(rs.getString("NOT_TITLE"), rs.getString("NOT_TEXT"), rs.getString("INPUT_DATE"), rs.getString("EDIT_DATE"),
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
			String selectNotice = "SELECT NOT_TITLE, NOT_TEXT,TO_CHAR(NOT_DATE, 'YYYY-MM-DD HH24:MI') INPUT_DATE, VIEW_NUM, EDIT_DATE  FROM NOTICE WHERE NCODE = ?";
			
			pstmt = con.prepareStatement(selectNotice);
			pstmt.setInt(1, code);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				nVO = new NoticeVO();
				nVO.setNoticeTitle(rs.getString("NOT_TITLE"));
				nVO.setNoticeText(rs.getString("NOT_TEXT"));
				nVO.setNoticeDate(rs.getString("INPUT_DATE"));
				nVO.setViewNum(rs.getInt("VIEW_NUM"));
				nVO.setEditDate(rs.getString("EDIT_DATE"));
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
			int seq = getNextProfSeq();
			
			con = db.getConn("jdbc/dbcp");
			String insertNotice = "INSERT INTO NOTICE(NCODE, NOT_TITLE, NOT_TEXT, VIEW_NUM) VALUES(?, ?, ?, 0)";
			
			pstmt = con.prepareStatement(insertNotice);
			pstmt.setInt(1, seq);
			pstmt.setString(2, nVO.getNoticeTitle());
			pstmt.setString(3, nVO.getNoticeText());
			
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
			String updateNotice = "UPDATE NOTICE SET NOT_TITLE=?, NOT_TEXT=?, EDIT_DATE=SYSDATE WHERE NCODE=?";
			
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
	
	public int getNextProfSeq() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String seq = null;

		DbConnection db = DbConnection.getInstance();
		try {
			con = db.getConn("jdbc/dbcp");
			con.setAutoCommit(false);

			String getSeq = "select notice_seq.nextval from dual";

			pstmt = con.prepareStatement(getSeq);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				seq = rs.getString(1);
			} // end if

		} finally {
			db.dbClose(rs, pstmt, con);
		} // end finally
		return Integer.parseInt(seq);
	}// getNextProfSeq
	
	public boolean updateDelete(int ncode) throws SQLException {
		boolean result = false;
		int temp = 0;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String updateDelete = "UPDATE NOTICE SET DEL_FLAG='Y' WHERE NCODE=?";
			
			pstmt = con.prepareStatement(updateDelete);
			pstmt.setInt(1, ncode);
			
			temp = pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		
		if(temp == 1) {
			result = true;
		}
		
		return result;
	}
}
