package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.vo.BoardRangeVO;
import admin.vo.OrderVO;
import common.dao.DbConnection;
import user.vo.CartVO;
import user.vo.WishListVO;

public class CartDAO {

	private static CartDAO bkDAO;
	
	private CartDAO() {
		
	}
	
	public static CartDAO getInstance() {
		if(bkDAO == null) {
			bkDAO=new CartDAO();
		}//end if
		return bkDAO;
	}//getInstance

	public List<CartVO> selectAllCartList(String id,BoardRangeVO brVO) throws SQLException{
		CartVO bkVO=null;
		List<CartVO> list= new ArrayList<CartVO>();
		
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
			StringBuilder selectAllCartList=new StringBuilder();
			selectAllCartList
			.append("	select MAIN_IMG,gname,price, AMOUNT, id, gcode , bcode	")
			.append("	from(select row_number() over(order by bcode ) rnum,	")
			.append("	g.MAIN_IMG, g.gname, g.price,bl.AMOUNT, bl.id ,bl.GCODE, bl.bcode	")
			.append("	from goods g, BUCKET_LIST bl	")
			.append("	where  g.gcode = bl.gcode and bl.id= ?	");
			
			boolean flag = false;
			if(brVO.getStartNum() != 0) {
				selectAllCartList.append(")	WHERE RNUM BETWEEN ? AND ?	");
				flag = true;
			}//end if
			
			pstmt=con.prepareStatement(selectAllCartList.toString());
		//5. 바인드 변수 값 설정
			pstmt.setString(1, id);
			
			if(flag) {
				pstmt.setInt(2, brVO.getStartNum());
				pstmt.setInt(3, brVO.getEndNum());
			}//end if
		//5. 바인드 변수 값 설정
		//6. 쿼리문 실행 후 값 얻기
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bkVO=new CartVO();
				bkVO.setImg(rs.getString("MAIN_IMG"));
				bkVO.setGname(rs.getString("GNAME"));
				bkVO.setPrice(rs.getInt("PRICE"));
				bkVO.setAmount(rs.getInt("AMOUNT"));
				bkVO.setGcode(rs.getString("gcode"));
				bkVO.setBcode(rs.getString("bcode"));
				list.add(bkVO);
			}//end while
		}finally {
			//7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectAllList
	
public int intsertAddCart(String id, String gcode, int amount)throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		CartVO cVO=new CartVO();
		int rowCnt = 0;
		
		DbConnection db = DbConnection.getInstance();
		try {
			// 2. 커넥션 얻기
			con=db.getConn("jdbc/dbcp");
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder intsertAddCart=new StringBuilder();
			intsertAddCart
			.append("	insert into BUCKET_LIST (ADD_DATE, GCODE, ID, AMOUNT, BCODE)	")
			.append("	values(sysdate, ? , ? , ? ,cart_seq.nextval )	");
			
			pstmt = con.prepareStatement(intsertAddCart.toString());
			
			pstmt.setString(1, gcode);
			pstmt.setString(2, id);
			pstmt.setInt(3, amount);
			
			System.out.println(intsertAddCart);
			
			// 5. 쿼리문 실행 결과 얻기
			rowCnt = pstmt.executeUpdate();
		} finally {
			// 6. 연결끊기
			db.dbClose(null, pstmt, con);
		} // end finally
		return rowCnt;
	}//intsertAddCart

/**
 * 선택한 장바구니 삭제
 * @param wcode
 * @return
 * @throws SQLException
 */
public int deleteCart( String id, String bcode) throws SQLException {
	DbConnection db = DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	int cnt = 0;
	try {
		con = db.getConn("jdbc/dbcp");
		
		String deleteCart="delete from BUCKET_LIST where bcode = ? and id= ? ";
		
		pstmt = con.prepareStatement(deleteCart);
		
		pstmt.setString(1, bcode);
		pstmt.setString(2, id);
		
		cnt = pstmt.executeUpdate();
		
		
	}finally {
		db.dbClose(null, pstmt, con);
	}//end finally
	return cnt;
}//deleteWishList


	/*
	 * 
	 * public int changeAmount(String[]) throws SQLException{ 
	 * List<BucketVO> list=new ArrayList<BucketVO>();
	 * 
	 * 
	 * 
	 * }//changeAmount
	 */	
	
}//class
