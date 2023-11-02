package kr.co.sist.course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConn;

public class EmployDAO {
	
	private static EmployDAO eDAO;
	
	private EmployDAO() {
	}

	public static EmployDAO getInstance() {
		if(eDAO == null) {
			eDAO = new EmployDAO();
		}
		
		return eDAO;
	}
	
	/**
	 * 로그인한 사원의 EmployVO를 설정하는 작업이다.
	 * @param empno 사번
	 * @return EmployVO
	 * @throws SQLException
	 */
	public EmployVO selectEmp(String empno) throws SQLException {
		EmployVO eVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConn db = DbConn.getInstance();
		
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			
			StringBuilder query = new StringBuilder();
			query
			.append("SELECT E.EMPNO,D.DPTNAME,M.MAJORNAME,E.USERCODE, E.PASS, E.ENAME, E.PHONE, E.EMAIL, E.IMG ")
			.append("FROM EMP E, MAJOR M, DPT D")
			.append("WHERE EMPNO=? AND E.MAJORCODE=M.MAJORCODE AND E.DPTCODE=D.DPTCODE");
			
			pstmt = con.prepareStatement(query.toString());
			pstmt.setString(1, empno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				eVO = new EmployVO(
						empno,
						rs.getString("USERCODE").charAt(0),
						rs.getString("ENAME"),
						rs.getString("EMAIL"),
						rs.getString("IMG"),
						rs.getString("DPTNAME"),
						rs.getString("MAJOR"),
						rs.getString("PHONE")
						);
			}
			
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return eVO;
	}
	
	/**
	 * 사원의 변경된 정보를 데이터베이스에 업데이트하는 작업이다.
	 * @param updateVO 변경된 정보가 들어있는 EmployVO
	 * @return 업데이트에 성공하면 1을 반환하고 업데이트를 안 했으면 0을 반환한다.
	 * @throws SQLException
	 */
	public int updateProfile(EmployVO updateVO) throws SQLException {
		int result = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConn db = DbConn.getInstance();
		
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			StringBuilder updateProfile = new StringBuilder();
			//교수 UI로 만듬
			updateProfile
			.append("	UPDATE EMP	")
			.append("	SET ENAME=?, EMAIL=?, PHONE=?, IMG=? 	")
			.append("	WHERE EMPNO=?	");
			
			pstmt = con.prepareStatement(updateProfile.toString());
			pstmt.setString(1, updateVO.getName());
			pstmt.setString(2, updateVO.getEmail());
			pstmt.setString(3, updateVO.getPhone());
			pstmt.setString(3, updateVO.getImage());
			pstmt.setInt(5, StudentMainFrame.sVO.getId());
			
			result = pstmt.executeUpdate();
			
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		
		
		return result;
	}
	
	/**
	 * 변경된 새 비밀번호를 업데이트하는 작업이다.
	 * @param empno 사번
	 * @param pw 새 비밀번호
	 * @return 업데이트에 성공하면 1을 반환하고 업데이트를 안 했으면 0을 반환한다.
	 * @throws SQLException
	 */
	public int updatePw(String empno, String pw) throws SQLException {
		int result = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConn db = DbConn.getInstance();
		
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			String updatePw = "UPDATE EMP SET PASS=? WHERE EMPNO=? ";
			
			pstmt = con.prepareStatement(updatePw);
			pstmt.setString(1, pw);
			pstmt.setString(2, empno);
			
			result = pstmt.executeUpdate();
			
			
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		
		return result;
	}
	
}
