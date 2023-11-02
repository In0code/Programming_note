package kr.co.sist.course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConn;
//돼라
public class LoginDAO {
	
	private static LoginDAO lDAO;
	
	private LoginDAO() {
	}

	public static LoginDAO getInstnace() {
		if(lDAO == null) {
			lDAO = new LoginDAO();
		}
		
		return lDAO;
	}
	
	public StudentVO selectStu(String id, String pw) throws SQLException, NumberFormatException {
		StudentVO sVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConn db = DbConn.getInstance();
		
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			
			StringBuilder query = new StringBuilder();
			query
			.append("	SELECT  STUNO,D.DPTNAME,M.MAJORNAME, PASS, SNAME, PHONE, EMAIL, ADDR, IMG, NOWLEVEL	")
			.append("	FROM  STUDENT S, MAJOR M, DPT D	")
			.append("	WHERE  STUNO="+Integer.parseInt(id)+" AND  PASS='"+pw+"'")
			.append("	AND S.MAJORCODE=M.MAJORCODE AND S.DPTCODE=D.DPTCODE	");
			pstmt = con.prepareStatement(query.toString());
			
//			pstmt.setInt(1, Integer.parseInt(id));
//			pstmt.setString(2, pw);
			
			System.out.println(query);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				sVO = new StudentVO();
				
				sVO.setId(rs.getInt("STUNO"));
				sVO.setName(rs.getNString("SNAME"));
				sVO.setPhone(rs.getString("PHONE"));
				sVO.setEmail(rs.getString("EMAIL"));
				sVO.setAddr(rs.getString("ADDR"));
				sVO.setImg(rs.getString("IMG"));
				sVO.setDptName(rs.getString("DPTNAME"));
				sVO.setMajorName(rs.getString("MAJORNAME"));
				sVO.setYear(rs.getInt("NOWLEVEL"));
			}
			
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return sVO;
	}
	
	public EmployVO selectEmp(String id, String pw) throws SQLException {
		EmployVO eVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConn db = DbConn.getInstance();
		
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			
			StringBuilder query = new StringBuilder();
			query
			.append("	SELECT  E.EMPNO,D.DPTNAME,M.MAJORNAME,E.USERCODE, E.PASS, E.ENAME, E.PHONE, E.EMAIL, E.IMG	")
			.append("	FROM  EMP E, MAJOR M, DPT D																	")
			.append("	WHERE  E.EMPNO='"+id+"' AND E.PASS='"+pw+"'																")
			.append("	AND E.MAJORCODE=M.MAJORCODE AND E.DPTCODE=D.DPTCODE											");
			pstmt = con.prepareStatement(query.toString());
			
			//pstmt.setString(1, id);
		//	pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				eVO = new EmployVO();
				
				eVO.setEmpno(rs.getString("EMPNO"));
				eVO.setUsercode(rs.getString("USERCODE").charAt(0));
				eVO.setName(rs.getNString("ENAME"));
				eVO.setEmail(rs.getString("EMAIL"));
				eVO.setImage(rs.getString("IMG"));
				eVO.setPhone(rs.getString("PHONE"));
				eVO.setDptName(rs.getString("DPTNAME"));
				eVO.setMajorName(rs.getString("MAJORNAME"));
			}
			
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return eVO;
	}
	
}
