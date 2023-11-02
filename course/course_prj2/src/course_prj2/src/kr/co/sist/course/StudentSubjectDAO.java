package kr.co.sist.course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import kr.co.sist.dao.DbConn;

public class StudentSubjectDAO {
	private static StudentSubjectDAO ssDAO;
	
	private StudentSubjectDAO() {

	}

	public static StudentSubjectDAO getInstance() {

		if (ssDAO == null) {
			ssDAO = new StudentSubjectDAO();
		}
		return ssDAO;
	}
	
	public List<StudentSubjectVO> selectSubject(int StuNum) throws SQLException {
		List<StudentSubjectVO> list = new ArrayList<StudentSubjectVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConn db = DbConn.getInstance();
		try {
		con = db.getConnection("192.168.10.142", "applepie", "mincho");

		StringBuilder selectSubject = new StringBuilder();
		selectSubject.append(" select distinct sb.subcode ,sb.subname, e.ename,  sb.subtype, sb.credit  ")
		.append(" from subject sb, course c, emp e, hakyeon h, student s ")
		.append(" where s.stuno= h.stuno and h.stuno=c.stuno and c.subcode=sb.subcode and sb.empno=e.empno and sb.subcode not in (select sb.subcode  ")
		.append(" from  student s, dpt d ,subject sb ")
		.append(" where s.dptcode=d.dptcode and d.dptcode=sb.dptcode and s.stuno=?) ");
		
		

		pstmt = con.prepareStatement(selectSubject.toString());
		pstmt.setInt(1, StuNum);
		rs = pstmt.executeQuery();

		StudentSubjectVO ssVO = null;

		while (rs.next()) {
			ssVO = new StudentSubjectVO();
			ssVO.setSubjectCode(rs.getString("subcode"));
			ssVO.setSubjectname(rs.getString("subname"));
			ssVO.setProfName(rs.getString("ename"));
			ssVO.setSubType(rs.getString("subtype").charAt(0));
			ssVO.setCredit(rs.getInt("credit"));

			list.add(ssVO);
		}
		} finally {
			db.dbClose(rs, pstmt, con);
		}//finally
		return list;

	}
	

	public void insertLecture(String subjectCode)throws SQLException {
		Connection con = null;
		PreparedStatement pstmt=null;
		DbConn db = DbConn.getInstance();
		
		
		try {
			
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			
			StringBuilder insertLecture = new StringBuilder();
			
			insertLecture.append(" insert into course (subcode, stuno, slevel, semester) ")
			.append(" values (?, ?, ? , ")
			.append(" case when to_number(to_char(sysdate, 'mm')) > 6 then 2 else 1 end ) ");

			
			
			pstmt=con.prepareStatement(insertLecture.toString());
			pstmt.setString(1,subjectCode /*"KOR001001"*/); // ssVO.getSubjectCode()가 널 상태임
			pstmt.setInt(2, StudentMainFrame.sVO.getId()/*20230002*/); //임의의 학번 추가
			pstmt.setInt(3, StudentMainFrame.sVO.getYear()/*20230002*/);
			
		
			pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
			
			
		}//finally
		
	}//insertLecture
	
	public void insertTgrade(StudentSubjectVO ssVO)throws SQLException {
		Connection con = null;
		PreparedStatement pstmt=null;
		DbConn db = DbConn.getInstance();
		
		try {
			
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			
			StringBuilder insertLecture = new StringBuilder();
			
			insertLecture.append(" INSERT INTO TGRADE  (SUBCODE, STUNO, SLEVEL, SEMESTER, GRADE ) ")
			.append(" values (?, ?, (select nowlevel from student where stuno=?) , ")
			.append(" CASE WHEN TO_NUMBER(TO_CHAR(SYSDATE, 'MM')) > 6 THEN 2 ELSE 1 END, '-' ");//value값 grade는 -로 설정해놨음.

			
			
			pstmt=con.prepareStatement(insertLecture.toString());
			pstmt.setString(1, ssVO.getSubjectCode());
			pstmt.setInt(2, StudentMainFrame.sVO.getId());
			pstmt.setInt(3, StudentMainFrame.sVO.getId());
			
		
			pstmt.executeUpdate();
		}finally {
			db.dbClose(null, pstmt, con);
			
			
		}//finally
		
	}//insertLecture




}
