package day0816_sangjun;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConn;

public class WorkConnDAO { // 박상준 숙제
	private static WorkConnDAO wc;

	private WorkConnDAO() {
	}// constructor

	public static WorkConnDAO getInstance() {
		if (wc == null) {
			wc = new WorkConnDAO();
		} // if
		return wc;
	}// getInstance

	public void insertInfo(WorkStudentVO stuVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		DbConn db = DbConn.getInstance();
		try {
			con = db.getConnection("localhost", "scott", "tiger");
			String insertInfo = "insert into work_user (name,img,age,num) values(?,?,?,?)";
			pstmt = con.prepareStatement(insertInfo);

			pstmt.setString(1, stuVO.getName());
			pstmt.setInt(2, stuVO.getImg());
			pstmt.setInt(3, stuVO.getAge());
			pstmt.setInt(4, stuVO.getNum());

		} finally {
			db.dbClose(null, pstmt, con);
		} // finally

	}// insertInfo

	public WorkStudentVO selectInfo(int num) throws SQLException {
		WorkStudentVO stuVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();

		try {
			con = db.getConnection("localhost", "scott", "tiger");
			String selectInfo = "select * from work_user where num = ?";
			pstmt = con.prepareStatement(selectInfo);

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				stuVO = new WorkStudentVO();
				stuVO.setName(rs.getString("name"));
				stuVO.setImg(rs.getInt("img"));
				stuVO.setAge(rs.getInt("age"));
				stuVO.setNum(rs.getInt("num"));
			} // if
		} finally {
			db.dbClose(rs, pstmt, con);
		} // finally

		return stuVO;
	}// insertInfo
}// class
