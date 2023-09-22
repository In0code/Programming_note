package kr.co.sist.course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import kr.co.sist.dao.DbConn;

public class LecturePlanDao {
	
	private static LecturePlanDao lpDAO;
	
	private LecturePlanDao() {

	}

	public static LecturePlanDao getInstance() {

		if (lpDAO == null) {
			lpDAO = new LecturePlanDao();
		}
		return lpDAO;
	}
	
	public LecturePlanVO selectedContents(String subjectCode) throws SQLException {
		LecturePlanVO lpVO=null;
		System.out.println(subjectCode);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConn db = DbConn.getInstance();

		con = db.getConnection("192.168.10.142", "applepie", "mincho");

		StringBuilder selectedContents = new StringBuilder();
		selectedContents.append(" SELECT sb.subname,sp.subgoal,sp.subinfo ")
		.append(" from  student s,hakyeon h, course c,  subject_plan sp, subject sb ")
		.append(" WHERE s.stuno = h.stuno and s.stuno = c.stuno and c.subcode = sp.subcode  ")
		.append(" and c.subcode=sb.subcode and c.subcode=? ");
		pstmt = con.prepareStatement(selectedContents.toString());
		pstmt.setString(1,subjectCode);
		rs = pstmt.executeQuery();

		

		 if(rs.next()) {
			lpVO = new LecturePlanVO();
			
			lpVO.setSubName(rs.getString("subname"));
			lpVO.setSubGoal(rs.getString("subgoal"));
			lpVO.setSubInfo(rs.getString("subinfo"));

			
		}
		return lpVO;

	}
	
	

}
