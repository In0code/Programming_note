package kr.co.sist.course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConn;

public class StudentDAO {
	
	private static StudentDAO sDAO;
	
	private StudentDAO() {
	}
	
	public static StudentDAO getInstance() {
		if(sDAO == null) {
			sDAO = new StudentDAO();
		}
		
		return sDAO;
	}
	
	/**
	 * StudentVO를 로그인한 학생에 맞춰서 데이터베이스 정보를 가져와 설정하는 작업이다.
	 * @param stuNum 학번
	 * @return StudentVO 학생 정보가 있는 클래스
	 * @throws SQLException
	 */
	public StudentVO selectMyProfile(int stuNum) throws SQLException {
		StudentVO sVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConn db  = DbConn.getInstance();
		
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			String selectVO = "SELECT * FROM STUDENT WHERE STUNO=?";
			
			pstmt = con.prepareStatement(selectVO);
			pstmt.setInt(1, stuNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sVO = new StudentVO(
						rs.getInt("STUNO"),
						rs.getString("SNAME"),
						rs.getString("EMAIL"),
						rs.getString("DPTCODE"),
						rs.getString("MAJORCODE"),
						rs.getString("PHONE"),
						rs.getString("ADDR"),
						rs.getString("IMG"),
						rs.getInt("NOWLEVEL")
				);
						
			}
			
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return sVO;
	}
	
	/**
	 * 수정된 정보를 데이터베이스에 업데이트(수정)하는 작업이다.
	 * @param updateVO 변경된 정보가 담긴 StudentVO를 매개변수로 받는다.
	 * @return 업데이트에 성공하면 1을 반환하고 업데이트를 안 했으면 0을 반환한다.
	 * @throws SQLException
	 */
	public int updateMyInfo(StudentVO updateVO) throws SQLException {
		int result = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConn db = DbConn.getInstance();
		
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			StringBuilder updateProfile = new StringBuilder();
			updateProfile
			.append("	UPDATE STUDENT	")
			.append("	SET EMAIL=?, PHONE=?, ADDR=?, IMG=? 	")
			.append("	WHERE STUNO=?	");
			
			pstmt = con.prepareStatement(updateProfile.toString());
			pstmt.setString(1, updateVO.getEmail());
			pstmt.setString(2, updateVO.getPhone());
			pstmt.setString(3, updateVO.getAddr());
			pstmt.setString(4, updateVO.getImg());
			pstmt.setInt(5, StudentMainFrame.sVO.getId());
			
			result = pstmt.executeUpdate();
			
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		
		
		return result;
	}
	
	/**
	 * 변경된 새 비밀번호를 업데이트하는 작업이다.
	 * @param stuNum 학번
	 * @param pw 새 비밀번호
	 * @return 업데이트에 성공하면 1을 반환하고 업데이트를 안 했으면 0을 반환한다.
	 * @throws SQLException
	 */
	public int updatePw(int stuNum, String pw) throws SQLException {
		int result = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConn db = DbConn.getInstance();
		
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			String updatePw = "UPDATE STUDENT SET PASS=? WHERE STUNO=? ";
			
			pstmt = con.prepareStatement(updatePw);
			pstmt.setString(1, pw);
			pstmt.setInt(2, stuNum);
			
			result = pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		
		return result;
	}
	
}
