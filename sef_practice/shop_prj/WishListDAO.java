package shop_prj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;

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
	
	public List<WishListVO> selectAllLIst(String id) throws SQLException{
		List<WishListVO> list=new ArrayList<WishListVO>();
		WishListVO wlVO=null;
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int delvFee=2500;
		try {
		//1. JNDI 사용 객체 생성
		//2. DataSource 얻기
		//3. Connection 얻기
			con=db.getConn("jdbc/dbcp");
		//4. 쿼리문 생성 객체 얻기
			String selectAllList="select img1,gname,price from goods where id= ? ";
			
			pstmt=con.prepareStatement(selectAllList);
		//5. 바인드 변수 값 설정
			pstmt.setString(1, id);
		//6. 쿼리문 실행 후 값 얻기
			rs=pstmt.executeQuery();
			while(rs.next()) {
				wlVO=new WishListVO();
				wlVO.setImg(rs.getString("img1"));
				wlVO.setgName(rs.getString("gname"));
				wlVO.setPrice(rs.getInt("price"));
				wlVO.setId(id);
				
				list.add(wlVO);
			}//end while
		}finally {
			//7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		
		return list;
	}//selectAllLIst
	
	
}//class
