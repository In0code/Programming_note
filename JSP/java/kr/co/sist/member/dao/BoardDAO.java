package kr.co.sist.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.member.vo.BoardRangeVO;
import kr.co.sist.member.vo.WebMemberVO;
import oracle.jdbc.driver.DBConversion;

public class BoardDAO {
	
	private static BoardDAO bDAO;
	
	private BoardDAO() {
		
	}
	
	public static BoardDAO getInstance() {
		if(bDAO==null) {
			bDAO = new BoardDAO();
		}//end if
		return bDAO;
	}//getInstance
	
	/**
	 * 10/23 Dynamic Query로 변경
	 * @param brVO
	 * @return
	 * @throws SQLException
	 */
	/* public int totalCount( ) throws SQLException{ */
		public int totalCount( BoardRangeVO brVO ) throws SQLException{
		int totalCount=0;
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
		//1.
		//2.
		//3.
			con=db.getConn("jdbc/dbcp");
		//4.
			StringBuilder selectCnt=new StringBuilder();
			selectCnt.append("	select count(*) cnt from web_member		");
			
			if(brVO.getKeyword() != null && ! "".equals(brVO.getKeyword() )&& !"null".equals(brVO.getKeyword())){
				String field="info";
				if("1".equals(brVO.getField() )) {
					field="id";
				}//end if
				if("2".equals(brVO.getField() )) {
					field="addr1";
				}//end if
				
				selectCnt.append("where ").append(field).append(" like '%'||?||'%' ");
			}//end if
			
			pstmt=con.prepareStatement(selectCnt.toString());
		//5.
			if(brVO.getKeyword() != null && ! "".equals(brVO.getKeyword() )&& !"null".equals(brVO.getKeyword())){
				pstmt.setString(1, brVO.getKeyword());
			}//end if
		//6.
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				totalCount=rs.getInt("cnt");
			}//end if
			
		}finally {
		//7.
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		return totalCount;
	}//totalCount
	
	/**
	 * 시작번호와 끝번호 사이의 레코드를 검색
	 * @return
	 * @throws SQLException
	 */
	public List<WebMemberVO> selectMember(BoardRangeVO brVO)throws SQLException{
		List<WebMemberVO> list=new ArrayList<WebMemberVO>();
		
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
		//1. JNDI 사용 객체 생성
		//2. DataSource 얻기
		//3. Connection 얻기
			con=db.getConn("jdbc/dbcp");
		//4. 쿼리문 생성 객체 얻기 => 검색 키워드와 검색 field에 따라 Dynamic Query로 변경
			StringBuilder selectMember=new StringBuilder();
			selectMember
			.append("	select id, name, birth, tel, email, gender , input_date			")
			.append("	from(select id, name, birth, tel, email, gender , input_date	")
			.append("	,row_number() over( order by input_date desc) rnum				")
			.append("	from web_member												");
			
			if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword() )&& !"null".equals(brVO.getKeyword())) {
				String field="info";
				if("1".equals(brVO.getField())) {
					field="id";
				}//end if
				if("2".equals(brVO.getField())) {
					field="addr1";
				}//end if
				
				selectMember.append("where ").append(field).append(" like '%'||?||'%' ");
			}//end if
			
			selectMember.append(")	where rnum between ? and ?					");
			
			pstmt=con.prepareStatement(selectMember.toString());
		//5. 바인드 변수 값 설정
			int bindCnt=1;
			if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword() )&& !"null".equals(brVO.getKeyword())) {
			pstmt.setString(bindCnt++, brVO.getKeyword());	
			}//end if
			
			pstmt.setInt(bindCnt++, brVO.getStartNum());
			pstmt.setInt(bindCnt++, brVO.getEndNum());
		//6. 쿼리문 실행 후 결과 얻기
			rs=pstmt.executeQuery();
			WebMemberVO wmVO=null;
			
			while(rs.next()) {
				wmVO=new WebMemberVO();
				wmVO.setId(rs.getString("id"));
				wmVO.setName(rs.getString("name"));
				wmVO.setBirthday(rs.getString("birth"));
				wmVO.setCell(rs.getString("tel"));
				wmVO.setEmail(rs.getString("email"));
				wmVO.setGender(rs.getString("gender"));
				wmVO.setInputDate(rs.getDate("input_date"));
				
				list.add(wmVO);
				
			}//end while
		}finally {
			//7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectMember
	
}//class








