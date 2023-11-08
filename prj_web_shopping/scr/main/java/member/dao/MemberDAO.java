package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.JOptionPane;

import member.vo.FindIdPwVO;
import member.vo.LoginVO;
import member.vo.RegisterVO;
import member.vo.UserVO;


public class MemberDAO {
	
	private static MemberDAO mDAO;
	
	private MemberDAO() {
	}
	
	public static MemberDAO getInstance() {
		if(mDAO == null) {
			mDAO=new MemberDAO();
		}//end if
		return mDAO;
	}//getInstance
	
	public boolean selectId(String id) throws SQLException{
		boolean resultId=false;
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
		//1. JNDI사용객체 생성
		//2. DataSource얻기
		//3. Connection 얻기
			con=db.getConn("jdbc/dbcp");
		//4. 쿼리문 생성객체 얻기
			String selectId=" select id from member where id=? ";
			pstmt=con.prepareStatement(selectId);
		//5. 바인드 변수에 값 설정
			pstmt.setString(1, id);
		//6. 쿼리문 수행 후 결과얻기
			rs=pstmt.executeQuery();
			
			resultId=rs.next();  //조회 결과가 있으면 true / 없으면 false
		}finally {
		//7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		return resultId;
	}//selectId
	
	public void insertMember(RegisterVO rVO) throws SQLException{
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		// 현재 날짜를 가져와서 포맷 적용 후 설정
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(currentDate);
		
		try {
			// 1. JNDI 사용객체 생성
			// 2. DataSource 얻기
			// 3. Connection 얻기
				con=db.getConn("jdbc/dbcp");
			// 4. 쿼리문 생성객체 얻기
				StringBuilder insertMember=new StringBuilder();
				insertMember
				.append(" insert into member ")
				.append(" (ID, PW, NAME, MEMBERSHIP, PHONE, ZIPCODE, SIDO, ADDR, EMAIL, SIGN_DATE) ")
				.append(" values(?,?,?,?,?,?,?,?,?,?) ");
				
				pstmt=con.prepareStatement( insertMember.toString() );
			//5. 바인드 변수 값 설정	
				pstmt.setString(1, rVO.getId());
				pstmt.setString(2, rVO.getPass());
				pstmt.setString(3, rVO.getName());
				pstmt.setString(4, rVO.getMembership());
				pstmt.setString(5, rVO.getPhone());
				pstmt.setString(6, rVO.getZipcode());
				pstmt.setString(7, rVO.getAddr());
				pstmt.setString(8, rVO.getDetailAddr());
				pstmt.setString(9, rVO.getEmail());
				pstmt.setString(10, formattedDate);
			//6. 쿼리 수행 후 결과얻기
				pstmt.executeQuery();
		}finally {
			//7. 연결끊기
			db.dbClose(rs, pstmt, con);
			
		}//end finally
	}//insertMember
	
	public UserVO findId(String name, String phone) throws SQLException{
		UserVO uVO=null;
	
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=db.getConn("jdbc/dbcp");
			
			String findId=" select id, email, sign_date from member where name=? and phone=?";
			
			pstmt=con.prepareStatement(findId);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				uVO=new UserVO();
				uVO.setId(rs.getString("id"));
				uVO.setEmail(rs.getString("email"));
				uVO.setSign_date(rs.getDate("sign_date"));
			}//end if
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return uVO;
	}//findId
	
	public boolean selectPw(UserVO uVO) throws SQLException{
		boolean resultPw=false;

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DbConnection db=DbConnection.getInstance();
		
		try {
			con=db.getConn("jdbc/dbcp");
			
			String selectPw=" select pw from member where id=? and name=? and phone=? ";
			pstmt=con.prepareStatement(selectPw);
			
			pstmt.setString(1, uVO.getId());
			pstmt.setString(2, uVO.getName());
			pstmt.setString(3, uVO.getPhone());
			
			rs=pstmt.executeQuery();
			
			resultPw=rs.next();	//조회 결과가 있으면 true / 없으면 false
		}finally {							
			db.dbClose(rs, pstmt, con);
		}//end finally
		return resultPw;
	}//resetPw
	
	public int resetPw(LoginVO lVO) throws SQLException{
		
		int cntPw=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		DbConnection db=DbConnection.getInstance();
		
		try {
			con=db.getConn("jdbc/dbcp");
			String updatePw=" update member set pw=? where id=? ";
			
			pstmt=con.prepareStatement(updatePw);
			pstmt.setString(1, lVO.getPass());
			pstmt.setString(2, lVO.getId());
			
			cntPw=pstmt.executeUpdate();
		} finally {
			db.dbClose(null, pstmt, con);
		}//end finally
		return cntPw;
	}//resetPw
	
	
	
	public RegisterVO selectInfo(String id) throws SQLException{
		RegisterVO rVO=null;
		
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=db.getConn("jdbc/dbcp");
			StringBuilder selectInfo=new StringBuilder();
			selectInfo
			.append(" select id, name, zipcode, sido, addr, phone, email ")
			.append(" from member ")
			.append("  where id=? ");
			pstmt=con.prepareStatement(selectInfo.toString());
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				rVO=new RegisterVO();
				
				rVO.setId(id);
				rVO.setName(rs.getString("name"));
				rVO.setZipcode(rs.getString("zipcode"));
				rVO.setAddr(rs.getString("sido"));
				rVO.setDetailAddr(rs.getString("addr"));
				rVO.setPhone(rs.getString("phone"));
				rVO.setEmail(rs.getString("email"));
			}//end if
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return rVO;
	}//selectInfo
	
	public int updateInfo(RegisterVO rVO) throws SQLException{
		int cntUp=0;
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn("jdbc/dbcp");
			StringBuilder updateInfo=new StringBuilder();
			updateInfo
			.append(" update member ")
			.append(" set pw=?, phone=?, zipcode=?, sido=?, addr=?, email=? ")
			.append(" where id=? ");
			
			pstmt=con.prepareStatement(updateInfo.toString());
			pstmt.setString(1, rVO.getPass());
			pstmt.setString(2, rVO.getPhone());
			pstmt.setString(3, rVO.getZipcode());
			pstmt.setString(4, rVO.getAddr());
			pstmt.setString(5, rVO.getDetailAddr());
			pstmt.setString(6, rVO.getEmail());
			pstmt.setString(7, rVO.getId());
			
			cntUp=pstmt.executeUpdate();

		}finally {
			db.dbClose(null, pstmt, con);
		}
		return cntUp;
	}//updateInfo
	
}//class








