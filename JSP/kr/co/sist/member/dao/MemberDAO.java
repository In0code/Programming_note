package kr.co.sist.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.member.vo.WebMemberLangVO;
import kr.co.sist.member.vo.WebMemberVO;

public class MemberDAO {
	private static MemberDAO mDAO;

	private MemberDAO() {
	}

	public static MemberDAO getInstane() {
		if (mDAO == null) {
			mDAO = new MemberDAO();
		} // end if
		return mDAO;
	}// getInstane

	public boolean selectId(String id) throws SQLException {
		boolean resultId = false;

		DbConnection db = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 1. JNDI사용 객체 생성
			// 2. DataSource 얻기
			// 3. Connection 얻기
			con = db.getConn("jdbc/dbcp");
			// 4. 쿼리문 생성객체 얻기
			String selectId = "select id from web_member where id=?";
			pstmt = con.prepareStatement(selectId);
			// 5. bind 변수 값 설정
			pstmt.setString(1, id);
			// 6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			resultId = rs.next(); // 조회 결과가 있으면 true, 없으면 false
		} finally {
			// 7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		} // end finally

		return resultId;
	}// selectId

	public void insertMember(WebMemberVO wmVO) throws SQLException {

		DbConnection db = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		// 1. JNDI 사용 객체 생성
		try {

			// 2. DataSource 얻기

			// 3. Connection 얻기
			con = db.getConn("jdbc/dbcp");
			// 4. 쿼리문 생성 객체 얻기
			StringBuilder insertWebMember = new StringBuilder();
			insertWebMember.append("insert into web_member")
			.append("(ID, PASS, NAME, BIRTH, TEL, EMAIL, GENDER, ZIPCODE, ADDR1, ADDR2, INFO, ip)")
			.append("values(?,?,?,?,?,?,?,?,?,?,?,?)");
			
			pstmt=con.prepareStatement(insertWebMember.toString());
			// 5. 바인드 변수 값 설정
			pstmt.setString(1, wmVO.getId());
			pstmt.setString(2, wmVO.getPassword());
			pstmt.setString(3, wmVO.getName());
			pstmt.setString(4, wmVO.getBirthday());
			pstmt.setString(5, wmVO.getCell());
			pstmt.setString(6, wmVO.getEmail());
			pstmt.setString(7, wmVO.getGender());
			pstmt.setString(8, wmVO.getZipcode());
			pstmt.setString(9, wmVO.getAddr1());
			pstmt.setString(10, wmVO.getAddr2());
			pstmt.setString(11, wmVO.getInfo());
			pstmt.setString(12, wmVO.getIp());
			// 6. 쿼리문 실행 후 결과 얻기
			pstmt.executeUpdate();
		} finally {
			// 7. 연결 끊기
			db.dbClose(null, pstmt, con);
		} // end finally

	}// insertMember

	public void insertLang(WebMemberLangVO wmlVO) throws SQLException {

		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
		//1. JNDI 사용 객체 생성
			
		//2. DataSource 얻기
		//3. Connection 얻기
			con=db.getConn("jdbc/dbcp");
		//4. 쿼리문 생성 객체 얻기
			String insertLang="insert into lang(id,lang) values(?,?)";
			pstmt=con.prepareStatement(insertLang);
		//5. 바인드 변수 값 설정
			pstmt.setString(1, wmlVO.getId());
			pstmt.setString(2, wmlVO.getLang());
		//6. 쿼리 수행 후 결과 얻기
			pstmt.executeUpdate();
		}finally {
			//7. 연결 끊기
			db.dbClose(null, pstmt, con);
		}//end finally
		
	}// insertLang

}// class
