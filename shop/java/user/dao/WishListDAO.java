package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.vo.BoardRangeVO;
import common.dao.DbConnection;
import user.vo.WishListPageVO;
import user.vo.WishListVO;

public class WishListDAO {

	private static WishListDAO wlDAO;
	
	private WishListDAO() {
		
	}
	
	public static WishListDAO getInstance() {
		if(wlDAO == null) {
			wlDAO=new WishListDAO();
		}//end if
		return wlDAO;
	}//getInstance
	
	/**
	 * 주문자의 모든 관심상품을 검색하는 일
	 * @param id
	 * @param brVO
	 * @return
	 * @throws SQLException
	 */
	public List<WishListVO> selectAllWishList(String id, BoardRangeVO brVO) throws SQLException{
		List<WishListVO> list=new ArrayList<WishListVO>();
		WishListVO wlVO=null;
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
			StringBuilder selectAllWishList=new StringBuilder();
			selectAllWishList.append("	select MAIN_IMG,gname,price, id, gcode , wcode	")
			.append("	from(select row_number() over(order by wcode ) rnum,	")
			.append("	   g.MAIN_IMG, g.gname, g.price, w.id ,w.GCODE, w.wcode	")
			.append("	  from goods g,WISHLIST w	")
			.append("	 where  g.gcode = w.gcode and w.id= ?	");
			
			boolean flag = false;
			if(brVO.getStartNum() != 0) {
				selectAllWishList.append(")	WHERE RNUM BETWEEN ? AND ?	");
				flag = true;
			}//end if
			
			pstmt=con.prepareStatement(selectAllWishList.toString());
		//5. 바인드 변수 값 설정
			pstmt.setString(1, id);
			
			if(flag) {
				pstmt.setInt(2, brVO.getStartNum());
				pstmt.setInt(3, brVO.getEndNum());
			}//end if
			
		//6. 쿼리문 실행 후 값 얻기
			rs=pstmt.executeQuery();
			while(rs.next()) {
				wlVO=new WishListVO();
				wlVO.setImg(rs.getString("MAIN_IMG"));
				wlVO.setGname(rs.getString("gname"));
				wlVO.setPrice(rs.getInt("price"));
				wlVO.setGcode(rs.getString("gcode"));
				wlVO.setId(rs.getString("id"));
				
				list.add(wlVO);
			}//end while
		}finally {
			//7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectAllWishList
	
	
	/**
	 * 사용자가 상품에 하트 ( 관심상품 )을 누르면 DB Wish table에 insert되는 일
	 * @return
	 * @throws SQLException
	 */
	public int intsertWhisList(int gcode)throws SQLException {
		WishListPageVO wpVO=new WishListPageVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCnt = 0;

		DbConnection db = DbConnection.getInstance();
		try {
			// 2. 커넥션 얻기
			con=db.getConn("jdbc/dbcp");
			// 3. 쿼리문 생성 객체 얻기
			String intsertWhisList = "insert into WISHLIST (WCODE, ID, GCODE) values(wish_seq.nextval, ? , ? )";

			pstmt = con.prepareStatement(intsertWhisList);
			
			pstmt.setString(1, wpVO.getId());
			pstmt.setInt(2, gcode);
			
			// 5. 쿼리문 실행 결과 얻기
			rowCnt = pstmt.executeUpdate();
		} finally {
			// 6. 연결끊기
			db.dbClose(null, pstmt, con);
		} // end finally
		return rowCnt;
	}//intsertWhisList
	
	
	/**
	 * 선택한 관심상품 삭제
	 * @param wcode
	 * @return
	 * @throws SQLException
	 */
	public int deleteWishList( String id, String gcode) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		int cnt = 0;
		try {
			con = db.getConn("jdbc/dbcp");
			
			String deleteWishList="delete from WISHLIST where gcode = ? and id= ? ";
			
			pstmt = con.prepareStatement(deleteWishList);
			
			pstmt.setString(1, gcode);
			pstmt.setString(2, id);
			
			cnt = pstmt.executeUpdate();
			
			System.out.println(deleteWishList);
			
		}finally {
			db.dbClose(null, pstmt, con);
		}//end finally
		return cnt;
	}//deleteWishList
	
	
	
	
	
	
	
}//class
