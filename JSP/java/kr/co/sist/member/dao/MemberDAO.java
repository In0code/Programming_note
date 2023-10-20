package kr.co.sist.member.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public WebMemberVO selectMember ( String id )throws SQLException{
		WebMemberVO wmVO=null;
		
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
		//1.
		//2.
		//3.
			con=db.getConn("jdbc/dbcp");
		//4.
			StringBuilder selectMember=new StringBuilder();
			selectMember
			.append("	select NAME, BIRTH, TEL, EMAIL, GENDER, ZIPCODE, ADDR1, ADDR2, INFO, INPUT_DATE, IP	")
			.append("	from WEB_MEMBER	")
			.append("	where ID= ?	");
			pstmt=con.prepareStatement(selectMember.toString());
		//5.
			pstmt.setString(1, id);
		//6.
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				wmVO=new WebMemberVO();
				wmVO.setId(id);
				wmVO.setName(rs.getString("name"));
				wmVO.setBirthday(rs.getString("BIRTH"));
				wmVO.setCell(rs.getString("TEL"));
				wmVO.setEmail(rs.getString("EMAIL"));
				wmVO.setGender(rs.getString("GENDER"));
				wmVO.setZipcode(rs.getString("ZIPCODE"));
				wmVO.setAddr1(rs.getString("ADDR1"));
				wmVO.setAddr2(rs.getString("ADDR2"));
				wmVO.setInfo(rs.getString("INFO"));
				wmVO.setInputDate(rs.getDate("INPUT_DATE"));
				wmVO.setIp(rs.getString("IP"));
				
				BufferedReader br=null;
				StringBuilder info=new StringBuilder("");
				try {
					Clob clob=rs.getClob("INFO");
					if(clob != null) {
					br=new BufferedReader(clob.getCharacterStream());
					String temp="";
					
					while((temp=br.readLine()) != null) {
						info.append(temp);
					}//end while
					if(br != null) { br.close(); }//end if
					}//end if
				}catch (IOException ie) {
					ie.printStackTrace();
				}//end catch
				
				wmVO.setInfo(info.toString());
			}//end if
		}finally {
			//7.
			db.dbClose(rs, pstmt, con);
		}//end finally
		return wmVO;
	}//selectMember
	
	public List<String> selectLang ( String id )throws SQLException{
		List<String> list=new ArrayList<String>();
		
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1.
			//2.
			//3.
			con=db.getConn("jdbc/dbcp");
			//4.
			//5.
			//6.
		}finally {
			//7.
			db.dbClose(rs, pstmt, con);
		}
		
		
		return list;
	}//selectMember

}// class
;