package admin.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import admin.vo.BoardRangeVO;
import admin.vo.ClientInfoVO;
import common.dao.DbConnection;

public class ClientInfoDAO {
	
	private static ClientInfoDAO ciDAO;
	
	private ClientInfoDAO() {
		
	}
	
	public static ClientInfoDAO getInstance() {
		if(ciDAO == null) {
			ciDAO = new ClientInfoDAO();
		}
		return ciDAO;
	}//getInstance
	
	public int totalCount(BoardRangeVO brVO) throws SQLException{
		int totalCount=0;
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=db.getConn("jdbc/dbcp");
			
			StringBuilder sql=new StringBuilder();
			sql.append(" select count(*) cnt from member ");
			
			if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword()) && !"null".equals(brVO.getKeyword())) {
				String field="info";
				if("1".equals(brVO.getField())) {
					field="name";
				}
				if("2".equals(brVO.getField())) {
					field="id";
				}
				sql.append(" where ").append( field ).append(" like'%'||?||'%' ");
			}//end if
			
			pstmt=con.prepareStatement(sql.toString());
			
			if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword()) && !"null".equals(brVO.getKeyword())) {
				pstmt.setString(1, brVO.getKeyword());
			}
			
			rs=pstmt.executeQuery();
			
			if( rs.next() ) {
				totalCount=rs.getInt("cnt");
			}//end if
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}//end finally
		return totalCount;
	}//totalCount
	
	
	/**
	 * 전체 회원 목록
	 * @param brVO
	 * @throws SQLException
	 */
	public List<ClientInfoVO> selectAllUser(BoardRangeVO brVO) throws SQLException{
		List<ClientInfoVO> list=new ArrayList<ClientInfoVO>();
		
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			
		con=db.getConn("jdbc/dbcp");
		StringBuilder sql=new StringBuilder();
		sql
		.append(" select name,id,email,phone,membership,sign_date				")
		.append(" from(select name,id,email,phone,membership,sign_date 	")
		.append(" ,row_number() over(order by sign_date desc) rnum 			")
		.append(" from member			 															")	;
		
		if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword()) && !"null".equals(brVO.getKeyword()) ) {
			String field="info";
			
			if("1".equals(brVO.getField())) {
				field="name";
			}
			if("2".equals(brVO.getField())) {
				field="id";
			}
			
			sql.append(" where ").append(field).append(" like'%'||?||'%' ");
		}//end if
			
		sql.append("  ) where rnum between ? and ?  ");
		
		pstmt=con.prepareStatement(sql.toString());
		
		int bindCnt=1;
		if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword()) && !"null".equals(brVO.getKeyword())) {
			pstmt.setString( bindCnt++ , brVO.getKeyword());
		}
		
		pstmt.setInt(bindCnt++ , brVO.getStartNum());
		pstmt.setInt(bindCnt++, brVO.getEndNum());
		
		rs=pstmt.executeQuery();
		ClientInfoVO ciVO=null;
		
		while(rs.next()) {
			ciVO=new ClientInfoVO();
			ciVO.setName(rs.getString("name"));
			ciVO.setId(rs.getString("id"));
			ciVO.setEmail(rs.getString("email"));
			ciVO.setPhone(rs.getString("phone"));
			ciVO.setMembership(rs.getString("membership"));
			// 기존의 JoinDate 값을 Date 형식으로 가져온다.
		    Date joinDate = rs.getDate("sign_date");
		    
		    // SimpleDateFormat을 사용하여 원하는 형식('yyyy-MM-dd')으로 포맷팅한다.
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    String formattedDate = sdf.format(joinDate);
		    
		    // 포맷팅된 날짜를 ClientInfoVO에 설정한다.
		    ciVO.setJoinDate(formattedDate);
			
			list.add(ciVO);
		}
		
		}finally {
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectAllUser
	
	/**
	 * 선택한 회원 상세정보
	 * @param id
	 * @throws SQLException
	 */
	public ClientInfoVO selectUser(String id) throws SQLException{
		ClientInfoVO ciVO = null;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
		con = db.getConn("jdbc/dbcp");

		StringBuilder sql = new StringBuilder();
		sql
		.append(" select name, id, phone, email, zipcode, sido, addr, sign_date, membership	")
		.append(" from member 	")
		.append(" where id=? 		");
		
		pstmt=con.prepareStatement(sql.toString());
		
		pstmt.setString(1, id);
		
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			ciVO = new ClientInfoVO();
			
			ciVO.setId(id);
			ciVO.setName(rs.getString("name"));
			ciVO.setPhone(rs.getString("phone"));
			ciVO.setEmail(rs.getString("email"));
			ciVO.setZipcode(rs.getString("zipcode"));
			ciVO.setAddr(rs.getString("sido"));
			ciVO.setDetailAddr(rs.getString("addr"));
			ciVO.setMembership(rs.getString("membership"));
			
			// 기존의 가입일을 Date 형식으로 가져옴
		    Date sign_date = rs.getDate("sign_date");
		    
		    // SimpleDateFormat을 사용하여 원하는 형식('yyyy-MM-dd')으로 포맷팅
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    String formattedDate = sdf.format(sign_date);
		    
		    // 포맷팅된 날짜를 ClientInfoVO에 설정
		    ciVO.setJoinDate(formattedDate);
			
		}//end if
		
		}finally {
			db.dbClose(rs, pstmt, con);
		}//end finally
		return ciVO;
	}//selectUser

	/**
	 * 회원 탈퇴시키기
	 * @param id
	 * @throws SQLException
	 */
	public int deleteUser(String id) throws SQLException{
		int cnt=0;
		DbConnection db=DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt=null;
		
		try {
			con=db.getConn("jdbc/dbcp");
			
			pstmt=con.prepareStatement(" delete from member where id=? ");
			
			pstmt.setString(1, id);
			
			cnt=pstmt.executeUpdate();
		
		}finally {
			db.dbClose(null, pstmt, con);
		}
		return cnt;
	}//deleteUser
	
}//class
