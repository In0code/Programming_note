package self_practice_course_prj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConn;

public class ProfDAO {

	private static ProfDAO pDAO;

	private ProfDAO() {

	}

	public static ProfDAO getInstance() {
		if (pDAO == null) {
			pDAO = new ProfDAO();
		} // end if
		return pDAO;
	}// getInstance
//
//	public ProfVO selectProf(String prof) throws SQLException {
//		ProfVO pVO = null;
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		DbConn db = DbConn.getInstance();
//
//		// 1. 드라이버로딩
//		// 2. 커넥션 얻기
//		con = db.getConnection("localhost", "applepie", "mincho");
//		// 3. 쿼리문 생성 객체 얻기
//		String insertInfo = "";
//
//		pstmt = con.prepareStatement(insertInfo);
//		// 4. 바인드 변수 값 설정
//
//		// 5. 쿼리문 실행 결과 얻기
////		pstmt.excuteQuery();   
//		// 6. 연결끊기
//		db.dbClose(null, pstmt, con);
//
//		return null;
//
//	}// selectProf

	public List<ProfVO> selectAllProf() throws SQLException {

		List<ProfVO> list = new ArrayList<ProfVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();

		try {

			// 1. 드라이버로딩
			// 2. 커넥션 얻기
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			// 3. 쿼리문 생성 객체 얻기
			String insertInfo = "select * from emp";

			pstmt = con.prepareStatement(insertInfo);

			ProfVO pVO = null;
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pVO = new ProfVO(

						rs.getString("ename"), rs.getString("phone"), rs.getString("email"), rs.getString("image"),
						rs.getString("major"), rs.getString("dpt"), rs.getInt("empno"),
						rs.getString("usercode").charAt(0));
				list.add(pVO);
			}
			// 4. 바인드 변수 값 설정

			// 5. 쿼리문 실행 결과 얻기

		} finally {

			// 6. 연결끊기
			db.dbClose(null, pstmt, con);
		}

		return list;

	}// selectAllProf

//	public int updateProf(ProfVO prof) throws SQLException {
//		ProfVO pVO = null;
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		DbConn db = DbConn.getInstance();
//
//		// 1. 드라이버로딩
//		// 2. 커넥션 얻기
//		con = db.getConnection("localhost", "applepie", "mincho");
//		// 3. 쿼리문 생성 객체 얻기
//		String insertInfo = "";
//
//		pstmt = con.prepareStatement(insertInfo);
//		// 4. 바인드 변수 값 설정
//
//		// 5. 쿼리문 실행 결과 얻기
////		pstmt.excuteQuery();   
//		// 6. 연결끊기
//		db.dbClose(null, pstmt, con);
//
//		return 0;
//
//	}//updateProf
//	
//	public int insertProf(ProfVO prof) throws SQLException{
//		ProfVO pVO = null;
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		DbConn db = DbConn.getInstance();
//
//		// 1. 드라이버로딩
//		// 2. 커넥션 얻기
//		con = db.getConnection("localhost", "applepie", "mincho");
//		// 3. 쿼리문 생성 객체 얻기
//		String insertInfo = "";
//
//		pstmt = con.prepareStatement(insertInfo);
//		// 4. 바인드 변수 값 설정
//
//		// 5. 쿼리문 실행 결과 얻기
////		pstmt.excuteQuery();   
//		// 6. 연결끊기
//		db.dbClose(null, pstmt, con);
//		
//		return 0;
//	}//insertProf
//	
//	public int createProfNo() throws SQLException {
//		ProfVO pVO = null;
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		DbConn db = DbConn.getInstance();
//
//		// 1. 드라이버로딩
//		// 2. 커넥션 얻기
//		con = db.getConnection("localhost", "applepie", "mincho");
//		// 3. 쿼리문 생성 객체 얻기
//		String insertInfo = "";
//
//		pstmt = con.prepareStatement(insertInfo);
//		// 4. 바인드 변수 값 설정
//
//		// 5. 쿼리문 실행 결과 얻기
////		pstmt.excuteQuery();   
//		// 6. 연결끊기
//		db.dbClose(null, pstmt, con);
//		return 0;
//	}

	public static void main(String[] args) {
		try {
			System.out.println(getInstance().selectAllProf());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}// class
