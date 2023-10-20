package kr.co.sist.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.util.log.UserDataHelper;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.member.vo.LoginVO;
import kr.co.sist.member.vo.UserDataVO;

public class LoginDAO {

	private static LoginDAO lDAO;
	
	private LoginDAO() {
	}
	
	public static LoginDAO getInstance() {
		if(lDAO == null) {
			lDAO=new LoginDAO();
		}//end if
		return lDAO;
	}//getInstance
	
	public UserDataVO selectLogin(LoginVO lVO)throws SQLException {
		UserDataVO udVO=null;
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
		//1. JNDI 사용 객체 생성
			
		//2. DataSource 얻기
			
		//3. Connection 얻기
			con=db.getConn("jdbc/dbcp");
		//4. 쿼리문 생성 객체 얻기
			String selectData="select name,email from web_member where id=? and pass=?";
			pstmt=con.prepareStatement(selectData);
		//5. 바인드 변수 값 설정
			pstmt.setString(1, lVO.getId());
			pstmt.setString(2, lVO.getPass());
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			
			if(rs.next()) { //검색 결과 있음
				udVO=new UserDataVO(rs.getString("name"),rs.getString("email"));
			}//end if
			
		}finally {
			//7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		return udVO;
	}//selectLogin
	
}//class
