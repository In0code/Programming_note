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

	// 교수 한 명 조회
	public ProfVO selectProf(String prof) throws SQLException {
//		ProfVO pVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConn db = DbConn.getInstance();

		try {
			// 1. 드라이버로딩
			// 2. 커넥션 얻기
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder selectOneProfInfo = new StringBuilder();
			selectOneProfInfo.append("  select e.empno, e.ename, m.majorname, d.dptname, e.phone, e.email ")
					.append("  from  emp e, major m, dpt d ")
					.append(" where (e.dptcode=d.dptcode) and (e.majorcode=m.majorcode) and ((e.ename= ? ) or (e.empno= ?))   ");

			pstmt = con.prepareStatement(selectOneProfInfo.toString());

			// 4. 바인드 변수 값 설정
			pstmt.setString(1, prof);
			// 5. 쿼리문 실행 결과 얻기
			pstmt.executeQuery();
			// 6. 연결끊기
		} finally {

			db.dbClose(null, pstmt, con);
		}

		return null;

	}// selectProf

	// 교수 전체 조회
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
			StringBuilder selectAllProfInfo = new StringBuilder();
			selectAllProfInfo.append("  select e.empno, e.ename, m.majorname, d.dptname, e.phone, e.email ")
					.append("  from  emp e, major m, dpt d ")
					.append("  where (e.dptcode=d.dptcode) and (e.majorcode=m.majorcode)   ");

			pstmt = con.prepareStatement(selectAllProfInfo.toString());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				pVO = new ProfVO(rs.getString("ename"), rs.getString("phone"), rs.getString("email"),
						rs.getString("majorname"), rs.getString("dptname"), rs.getString("empno"));
				list.add(pVO);
			} // end while
				// 4. 바인드 변수 값 설정

			// 5. 쿼리문 실행 결과 얻기

		} finally {

			// 6. 연결끊기
			db.dbClose(rs, pstmt, con);
		}

		return list;

	}// selectAllProf

	// 교수 수정
	public int updateProf(ProfVO pVO) throws SQLException {
		int rowCnt = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConn db = DbConn.getInstance();
		try {

			// 1. 드라이버로딩
			// 2. 커넥션 얻기
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder updateProfInfo = new StringBuilder();
			updateProfInfo.append("  update emp ")
					.append(" set   ename= ? , majorname= ? , dptname=? , phone=? , email=? ")
					.append("  where empno = ? || ename=?   ");

			pstmt = con.prepareStatement(updateProfInfo.toString());
			// 4. 바인드 변수 값 설정
			pstmt.setString(1, pVO.getEname());
			pstmt.setString(2, pVO.getMajorname());
			pstmt.setString(3, pVO.getDptname());
			pstmt.setString(4, pVO.getPhone());
			pstmt.setString(5, pVO.getEmail());
			pstmt.setString(6, pVO.getEmpno());
			pstmt.setString(7, pVO.getEname());
			// 5. 쿼리문 실행 결과 얻기
			rowCnt = pstmt.executeUpdate();
			// 6. 연결끊기
		} finally {
			db.dbClose(null, pstmt, con);
		}

		return rowCnt;

	}// updateProf

	// 교수 등록
	public int insertProf(ProfVO pVO) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConn db = DbConn.getInstance();

		try {
			// 1. 드라이버로딩
			// 2. 커넥션 얻기
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder insertProfInfo = new StringBuilder();
			insertProfInfo.append(" insert into emp(empno, ename, dptcode, majorcode, phone, email) ")
					.append("  ?,?,(select DPTCODE from DPT where DPTNAME=?) ,")
					.append("	(select MAJORCODE from MAJOR where MAJORNAME=?) , ?, ? ");

			pstmt = con.prepareStatement(insertProfInfo.toString());
			// 4. 바인드 변수 값 설정
			pstmt.setString(1, pVO.getEmpno());
			pstmt.setString(2, pVO.getEname());
			pstmt.setString(3, pVO.getDptname());
			pstmt.setString(4, pVO.getMajorname());
			pstmt.setString(5, pVO.getPhone());
			pstmt.setString(6, pVO.getEmail());
			// 5. 쿼리문 실행 결과 얻기
			pstmt.executeQuery();
			// 6. 연결끊기
		} finally {
			db.dbClose(null, pstmt, con);
		}
		return 0;
	}// insertProf

	// 사번 생성
	public int createProfNo() throws SQLException {
		ProfVO pVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConn db = DbConn.getInstance();

		try {

			// 1. 드라이버로딩
			// 2. 커넥션 얻기
			con = db.getConnection("localhost", "applepie", "mincho");
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder createProfInfo = new StringBuilder();
			createProfInfo.append("   ").append("   ").append("     ");

			pstmt = con.prepareStatement(createProfInfo.toString());
			// 4. 바인드 변수 값 설정

			// 5. 쿼리문 실행 결과 얻기
			pstmt.executeQuery();
			// 6. 연결끊기
		} finally {

			db.dbClose(null, pstmt, con);
		}
		return 0;
	}// createProfNo

	public static void main(String[] args) {
		try {
			
			System.out.println(getInstance().selectAllProf());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}// class
