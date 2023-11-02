package kr.co.sist.course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import kr.co.sist.dao.DbConn;

//동원
public class MySubjectDAO {
	private static MySubjectDAO msDAO;

	private MySubjectDAO() {

	}

	public static MySubjectDAO getInstance() {

		if (msDAO == null) {
			msDAO = new MySubjectDAO();
		}
		return msDAO;
	}

	public List<MySubjectVO> selectedContents(int StuNum) throws SQLException {
		List<MySubjectVO> list = new ArrayList<MySubjectVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConn db = DbConn.getInstance();

		con = db.getConnection("192.168.10.142", "applepie", "mincho");

		StringBuilder selectedContents = new StringBuilder();
		selectedContents.append("select m.majorname, sb.subname ,sb.subcode, e.ename, sb.subtype, sb.credit ")
		.append(" from student s,major m ,course c, subject sb , emp e ")
		.append("where  s.stuno=c.stuno and s.majorcode=m.majorcode and sb.subcode=c.subcode "
				+ " and sb.empno=e.empno and c.semester= case when to_number(to_char(sysdate, 'mm')) > 6 then 2 else 1 end and s.stuno=? and c.slevel = (select nowlevel from student where stuno=? ) ");

		pstmt = con.prepareStatement(selectedContents.toString());
		pstmt.setInt(1, StuNum);
		pstmt.setInt(2, StuNum);
		rs = pstmt.executeQuery();

		MySubjectVO msVO = null;

		while (rs.next()) {
			msVO = new MySubjectVO();
			
			msVO.setMajorName(rs.getString("majorname"));
			msVO.setSubName(rs.getString("subname"));
			msVO.setSubCode(rs.getString("subcode"));
			msVO.setProfname(rs.getString("ename"));
			msVO.setSubType(rs.getString("subtype").charAt(0));
			msVO.setCredit(rs.getInt("credit"));

			list.add(msVO);
		}
		return list;

	}
	
}

