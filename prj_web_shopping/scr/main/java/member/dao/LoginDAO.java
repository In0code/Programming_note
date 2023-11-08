package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.vo.LoginVO;
import member.vo.UserVO;



public class LoginDAO {

	private static LoginDAO lDAO;
	private LoginDAO() {
	}
	
	public static LoginDAO getInstance() {
		if( lDAO == null) {
			lDAO=new LoginDAO();
		}//end if
		return lDAO;
	}//getInstance
	
	public UserVO selectLogin(LoginVO lVO) throws SQLException{
		UserVO uVO=null;
		
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=db.getConn("jdbc/dbcp");
			
			String selectData=" select id, name, email, phone, sign_date from member where id=? and pw=? ";
			pstmt=con.prepareStatement(selectData);
			
			pstmt.setString(1, lVO.getId());
			pstmt.setString(2, lVO.getPass());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {	//검색결과있으면
				uVO=new UserVO(rs.getString("id"), rs.getString("name"), rs.getString("email"), 
						rs.getString("phone"), rs.getDate("sign_date"));
			}//end if
				
		} finally {
			//7.연결끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		return uVO;
	}//selectLogin
	
	
	
	
	
	
	
	
	
	
	
	

}//class