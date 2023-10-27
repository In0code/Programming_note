package kr.co.sist.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.member.vo.StudentVO;

public class StuDAO {

	private static StuDAO sDAO;
	private StuDAO() {
		
	}
	
	public static StuDAO getInstance() {
		if(sDAO == null) {
			sDAO=new StuDAO();
		}//end if
		return sDAO;
	}//getInstance
	
	public List<StudentVO> selectAllStudent() throws SQLException {
		List<StudentVO> list = new ArrayList<StudentVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();

		try {
			// 1.
			// 2.
			con = db.getConn("jdbc/dbcp");
			// 3.
			String selectAllStudent = "select num,name,age,email,input_date from student";
			pstmt = con.prepareStatement(selectAllStudent);
			// 4.
			// 5.
			rs = pstmt.executeQuery();

			StudentVO stuVO = null;
			while (rs.next()) {// 다음 레코드가 존재하면
				stuVO = new StudentVO(rs.getInt("num"), rs.getString("name"), rs.getInt("age"), rs.getString("email"),
						rs.getDate("input_date"));

				list.add(stuVO);
			} // end while
		} finally {
			// 6.
			db.dbClose(null, pstmt, con);
		}//end finally
		return list;
	}// selectAllStudent
	
	
	public List<StudentVO> selectAgeStudent(int age) throws SQLException {
		List<StudentVO> list = new ArrayList<StudentVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();

		try {
			// 1.
			// 2.
			con = db.getConn("jdbc/dbcp");
			// 3.
			String selectAgeStudent 
			= "select num,name,age,email,input_date from student where age= ?";
			pstmt = con.prepareStatement(selectAgeStudent);
			// 4.
			pstmt.setInt(1, age);
			// 5.
			rs = pstmt.executeQuery();

			StudentVO stuVO = null;
			while (rs.next()) {// 다음 레코드가 존재하면
				stuVO = new StudentVO(rs.getInt("num"), rs.getString("name"), rs.getInt("age"), rs.getString("email"),
						rs.getDate("input_date"));

				list.add(stuVO);
			} // end while
		} finally {
			// 6.
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}// selectAgeStudent
	
}//class
