package kr.co.sist.course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConn;

public class LecturePlanProfDAO {
	private static LecturePlanProfDAO lppDAO;
	
	public static LecturePlanProfDAO getInstance() {
		if(lppDAO == null) {
			lppDAO = new LecturePlanProfDAO();
		}//end if
		return lppDAO;
	}//getInstance
	
	
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
			String selectAllDpt = "select dptname from dpt";
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
	
	public LecturePlanProfVO selectedContents(String subCode) throws SQLException {
		LecturePlanProfVO lppVO=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConn db = DbConn.getInstance();

		con = db.getConnection("192.168.10.142", "applepie", "mincho");

		StringBuilder selectedContents = new StringBuilder();
		selectedContents.append(" SELECT sb.subname,sp.subgoal,sp.subinfo ")
		.append(" FROM  student s,hakyeon h, course c,  subject_plan sp, subject sb ")
		.append(" WHERE s.stuno = h.stuno AND s.stuno = c.stuno AND c.subcode = sp.subcode  ")
		.append(" AND c.subcode=sb.subcode AND c.subcode=? ");
		
		pstmt = con.prepareStatement(selectedContents.toString());
		
		pstmt.setString(1, subCode);
		rs = pstmt.executeQuery();

		 if(rs.next()) {
			 lppVO = new LecturePlanProfVO();
			
			 lppVO.setSubName(rs.getString("subname"));
			 lppVO.setSubGoal(rs.getString("subgoal"));
			 lppVO.setLectureInfo(rs.getString("subinfo"));
			 
		}//end if
		return lppVO;
	}//selectedContents
	
	public int updatePlanContents(LecturePlanProfVO lppVO) throws SQLException{
		int rowCnt=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		DbConn db=DbConn.getInstance();
		
		try {
			con=db.getConnection("192.168.10.142", "applepie", "mincho");	
			StringBuilder updatePlan=new StringBuilder();
			updatePlan
			.append("	update subject_plan																			")
			.append("	set subgoal=?, subinfo=? 																 	")
			.append("	where subcode=(select subcode from subject where subname=?) 	");
			 
			pstmt=con.prepareStatement(updatePlan.toString());
			
			pstmt.setString(1, lppVO.getSubGoal());
			pstmt.setString(2, lppVO.getLectureInfo());
			pstmt.setString(3, lppVO.getSubName());
			
			rowCnt=pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}//end finally
		return rowCnt;
	}//updatePlanContents
	
	public static void main(String[] args) throws SQLException {
		System.out.println(getInstance().selectedContents("CMP001001"));
	}
	
	
}//class
