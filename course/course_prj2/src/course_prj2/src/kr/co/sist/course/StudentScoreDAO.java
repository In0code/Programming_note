package kr.co.sist.course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import kr.co.sist.dao.DbConn;

public class StudentScoreDAO {
	
	private static StudentScoreDAO ssDAO;
	
	private StudentScoreDAO() {
	}
	
	public static StudentScoreDAO getInstance() {
		if(ssDAO == null) {
			ssDAO = new StudentScoreDAO();
		}
		
		return ssDAO;
	}
	
	/**
	 * 학생의 학번으로 학생이 들은 학년, 학기를 가져와서 "n학년 - m학기" 형식으로 List에 저장한다.
	 * @param stuno 학생의 학번
	 * @return List<String> "n학년 - m학기" 형식으로 List에 저장하고 정렬하여 List를 반환
	 * @throws SQLException 데이터베이스에 정보가 없거나 SQLException이 발생하면 예외 발생.
	 */
	public List<String> selectSemester(int stuno) throws SQLException {
		Set<String> set = new HashSet<String>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConn db = DbConn.getInstance();
		
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			String query = "SELECT SLEVEL, SEMESTER FROM COURSE WHERE STUNO=?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, stuno);
			
			rs = pstmt.executeQuery();
			
			StringBuilder sb = null;
			while (rs.next()) {
				sb = new StringBuilder();
				sb.append(rs.getString("SLEVEL")).append("학년 - ")
				.append(rs.getString("SEMESTER")).append("학기");
				
				set.add(sb.toString());
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		List<String> list = new ArrayList<String>(set);
		Collections.sort(list);
		return list;
	}
	
	/**
	 * 선택된 컴보박스에서 학년과 학기를 구하고 데이터베이스에 해당 정보에 맞는 성적을 가져온다.
	 * @param sLevel 학년
	 * @param semester 학기
	 * @return List<StudentScoreVO> 학생의 학과, 강의명, 성적, 평점, 이수구분을 담은 StudentScoreVO를 List로 반환
	 * @throws SQLException 정보가 없거나 SQLException이 발행하면 예외 발생.
	 */
	public List<StudentScoreVO> selectScore(int sLevel, int semester) throws SQLException {
		List<StudentScoreVO> list = new ArrayList<StudentScoreVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConn db = DbConn.getInstance();
		
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			StringBuilder selectQuery = new StringBuilder();
			selectQuery
			.append("	SELECT M.MAJORNAME,S.SUBNAME, S.CREDIT,G.GRADE,S.SUBTYPE					")
			.append("	FROM TGRADE G, SUBJECT S, MAJOR M											")
			.append("	WHERE G.STUNO=? AND G.SLEVEL=? AND G.SEMESTER=? AND							")
			.append("	G.SUBCODE=S.SUBCODE AND S.MAJORCODE=M.MAJORCODE								");
			
			pstmt = con.prepareStatement(selectQuery.toString());
			pstmt.setInt(1, StudentMainFrame.sVO.getId());
			pstmt.setInt(2, sLevel);
			pstmt.setInt(3, semester);
			
			rs = pstmt.executeQuery();
			
			StudentScoreVO ssVO = null;
			while (rs.next()) {
				ssVO = new StudentScoreVO(
					rs.getString("MAJORNAME"),
					rs.getString("SUBNAME"),
					rs.getInt("CREDIT"),
					rs.getString("GRADE"),
					rs.getString("SUBTYPE")
				);
				
				list.add(ssVO);
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}

}
