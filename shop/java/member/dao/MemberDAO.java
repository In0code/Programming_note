package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import member.vo.FindIdPwVO;
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
	
}//class








