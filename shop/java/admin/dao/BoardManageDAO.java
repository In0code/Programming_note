package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.vo.BoardManageVO;
import admin.vo.BoardRangeVO;
import common.dao.DbConnection;

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
	 * 카테고리 이름 반환
	 * @return
	 * @throws SQLException
	 */
	public List<String> selectCategory() throws SQLException {
		List<String> list = new ArrayList<String>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			pstmt = con.prepareStatement(" select cat_name from category ");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString("cat_name"));
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
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
		String category = "전체";
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder selectReview = new StringBuilder();
			selectReview
			.append("	select no, rcode, cat_name, gname, id, rev_date, star		")
			.append("	from (select row_number() over(order by rev_date desc) no,  ")
			.append(" 	r.rcode, c.cat_name, g.gname, r.id, r.rev_date, r.star		")
			.append("	from review r, goods g, category c 							")
			.append("	where r.gcode = g.gcode and g.cat_code = c.cat_code			");
			
			if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
				String field = "id";
				if("2".equals(brVO.getField())) {
					field = "gname";
				}
				if("3".equals(brVO.getField())) {
					field = "cat_name";
				}
				
				
				if("2".equals(brVO.getCategory())) {
					category = "바디케어";
				}else if("3".equals(brVO.getCategory())) {
					category = "핸드케어";
				}else if("4".equals(brVO.getCategory())) {
					category = "홈프래그런스";
				}else if("5".equals(brVO.getCategory())) {
					category = "향수";
				}
				
				selectReview.append("and ").append(field).append(" like '%'||?||'%'	");
				
				if(!"전체".equals(category)) {
					selectReview.append("and c.cat_name").append(" like '%'||?||'%' ");
				}
			}
			
			selectReview
			.append("	) where no between ? and ?									");
			
			pstmt = con.prepareStatement(selectReview.toString());
			
			int bindCnt = 1;
			
			if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
				pstmt.setString(bindCnt++, keyword);
				if(!"전체".equals(category)) {
					pstmt.setString(bindCnt++, category);
				}
			}
			
			pstmt.setInt(bindCnt++, brVO.getStartNum());
			pstmt.setInt(bindCnt++, brVO.getEndNum());
			
			rs = pstmt.executeQuery();
			
			BoardManageVO bmVO = null;
			
			while(rs.next()) {
				bmVO = new BoardManageVO(rs.getInt("rcode"), rs.getString("cat_name"),
										 rs.getString("gname"), rs.getString("id"), 
										 rs.getString("rev_date"), rs.getInt("star"));
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
