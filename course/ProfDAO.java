package self_practice_course_prj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConn;

public class ProfDAO {
//////////////인영 ///////////////
/////////// 교수 DAO ///////////
	private static ProfDAO pDAO;

	private ProfDAO() {

	}

	public static ProfDAO getInstance() {
		if (pDAO == null) {
			pDAO = new ProfDAO();
		} // end if
		return pDAO;
	}// getInstance

//	public ProfVO selectProf(String prof) throws SQLException {
//		ProfVO pVO = null;
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		DbConn db = DbConn.getInstance();
//
//		// 1. 드라이버로딩
//		// 2. 커넥션 얻기
//		con = db.getConnection("192.168.10.142", "applepie", "mincho");
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

		ProfVO pVO = null;
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
			StringBuilder selectInfo = new StringBuilder();
			selectInfo.append("  select e.empno, e.ename, m.majorname, d.dptname, e.phone, e.email ")
					.append("  from  emp e, major m, dpt d ")
					.append("  where (e.dptcode=d.dptcode) and (e.majorcode=m.majorcode)   ");

			pstmt = con.prepareStatement(selectInfo.toString());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				pVO = new ProfVO(
						rs.getString("ename"), rs.getString("phone"), rs.getString("email"), rs.getString("majorname"),
						rs.getString("dptname"),  rs.getString("empno"));
				list.add(pVO);
			}//end while
			// 4. 바인드 변수 값 설정

			// 5. 쿼리문 실행 결과 얻기

		} finally {

			// 6. 연결끊기
			db.dbClose(rs, pstmt, con);
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
