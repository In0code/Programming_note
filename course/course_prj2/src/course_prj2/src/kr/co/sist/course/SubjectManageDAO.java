package kr.co.sist.course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConn;

public class SubjectManageDAO {
	private static SubjectManageDAO smDAO;

	public static SubjectManageDAO getInstance() {
		if (smDAO == null) {
			smDAO = new SubjectManageDAO();
		} // end if
		return smDAO;
	}// getInstance

	public List<SubjectManageVO> selectAllSubject(String dptname, String majorname) throws SQLException {
		List<SubjectManageVO> sas = new ArrayList<SubjectManageVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();

		try {
			// 1. 드라이버 로딩
			// 2. DB연결얻기
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			// 3. 쿼리문 생성객체 얻기
			StringBuilder selectAllSubject = new StringBuilder();
			selectAllSubject
			.append("  select s.subcode, s.subname, d.dptname, m.majorname, e.ename, s.credit, s.subtype 		")
			.append("  from subject s, major m, dpt d, emp e  																		")
			.append("  where s.dptcode = d.dptcode and s.majorcode = m.majorcode and s.empno = e.empno	")
			.append("	and d.dptname=? and m.majorname=?	");
			pstmt = con.prepareStatement(selectAllSubject.toString());
			// 4. 바인드 변수 값 설정
			pstmt.setString(1, dptname);
			pstmt.setString(2, majorname);
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			SubjectManageVO smVO = null;

			while (rs.next()) {
				smVO = new SubjectManageVO(	
						rs.getString("subcode"), 
						rs.getString("subname"), 
						rs.getString("dptname"),
						rs.getString("majorname"),
						rs.getString("ename"), 
						rs.getInt("credit"),
						rs.getString("subtype"));
				sas.add(smVO);
			} // end while

		} finally {
			// 6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		return sas;
	}// selectAllSubject

	public List<String> selectAllDpt() throws SQLException {
		List<String> sad = new ArrayList<String>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();

		try {
			// 1.
			// 2.
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			// 3.
			String selectAllDpt = " select dptname from dpt ";
			pstmt = con.prepareStatement(selectAllDpt);
			// 4.
			// 5.
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sad.add(rs.getString("dptname"));
			} // end while

		} finally {
			// 6.
			db.dbClose(rs, pstmt, con);
		}
		return sad;
	}// selectAllDpt
	
	public List<String> selectAllMajor(String dptname) throws SQLException {
		List<String> sam = new ArrayList<String>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();

		try {
			// 1.
			// 2.
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			// 3.
			String selectAllMajor = " select m.majorname from dpt d, major m "
												+ "where d.dptcode=m.dptcode and d.dptname=? ";
			pstmt = con.prepareStatement(selectAllMajor);
			// 4.
			pstmt.setString(1, dptname);
			// 5.
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sam.add(rs.getString("majorname"));
			} // end while

		} finally {
			// 6.
			db.dbClose(rs, pstmt, con);
		}
		return sam;
	}// selectAllMajor

		

//	public static void main(String[] args) throws SQLException {
//		System.out.println(getInstance().selectAllSubject());
//		System.out.println(getInstance().selectAllMajor());
//		System.out.println(getInstance().selectAllDpt());
		
//	}// main

}// class
