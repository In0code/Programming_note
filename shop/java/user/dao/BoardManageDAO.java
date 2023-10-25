package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.vo.BoardRangeVO;
import common.dao.DbConnection;
import user.vo.BoardManageVO;

public class BoardManageDAO {
	
	private static BoardManageDAO bmDAO;
	
	private BoardManageDAO() {
		
	}
	
	public static BoardManageDAO getInstance() {
		if(bmDAO==null) {
			bmDAO = new BoardManageDAO();
		}
		return bmDAO;
	}
	
	
	/**
	 * 리뷰 리스트 전체
	 * @param brVO
	 * @return
	 * @throws SQLException 
	 */
	public List<BoardManageVO> selectAllReview(BoardRangeVO brVO) throws SQLException{
		List<BoardManageVO> list = new ArrayList<BoardManageVO>();
		String keyword = brVO.getKeyword();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder selectReview = new StringBuilder();
			selectReview
			.append("	select rcode, gname, id, rev_date, star						")
			.append("	from (select row_number() over(order by rev_date desc) no,  ")
			.append(" 	r.rcode, g.gname, r.id, r.rev_date, r.star					")
			.append("	from review r, goods g 										")
			.append("	where r.gcode = g.gcode										");
			
			if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
				String field = brVO.getField().equals("1") ? "id" : "gname";
				
				selectReview.append("and ").append(field).append(" like '%'||?||'%'	");
			}
			
			selectReview
			.append("	) where no between ? and ?									");
			
			pstmt = con.prepareStatement(selectReview.toString());
			
			int bindCnt = 1;
			
			if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
				pstmt.setString(bindCnt++, keyword);
			}
			
			pstmt.setInt(bindCnt++, brVO.getStartNum());
			pstmt.setInt(bindCnt++, brVO.getEndNum());
			
			rs = pstmt.executeQuery();
			
			BoardManageVO bmVO = null;
			
			while(rs.next()) {
				bmVO = new BoardManageVO(rs.getInt("rcode"), rs.getString("gname"),
										 rs.getString("id"), rs.getString("rev_date"), 
										 rs.getInt("star"));
				list.add(bmVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
	
	/**
	 * 선택한 리뷰 디테일
	 * @param rcode
	 * @return
	 */
	public BoardManageVO selectReview(String rcode) {
		BoardManageVO bmVO = null;
		
		return bmVO;
	}

}
