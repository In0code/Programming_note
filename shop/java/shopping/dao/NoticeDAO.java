package shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shopping.vo.NoticeVO;

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
	
	public List<NoticeVO> selectNotice(int start, int end) throws SQLException {
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectNotice = new StringBuilder();
			selectNotice.append("	SELECT NCODE, ID, NOT_TITLE, NOT_TEXT, TO_CHAR(NOT_DATE, 'YYYY-MM-DD HH24:MI') DATE, VIEW_NUM	")
			.append("	FROM (SELECT ROW_NUMBER() OVER(ORDER BY NOT_DATE DESC) RNUM,	")
			.append("	NCODE, ID, NOT_TITLE, NOT_TEXT, NOT_DATE, VIEW_NUM	")
			.append("	FROM NOTICE)	")
			.append("	WHERE RNUM BETWEEN ? AND ?	");
			
			pstmt = con.prepareStatement(selectNotice.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			NoticeVO nVO = null;
			while(rs.next()) {
				nVO = new NoticeVO(rs.getString("ID"), rs.getString("NOT_TITLE"), rs.getString("NOT_TEXT"), rs.getString("DATE"),
						rs.getInt("NCODE"), rs.getInt("VIEW_NUM"));
				
				list.add(nVO);
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
}
