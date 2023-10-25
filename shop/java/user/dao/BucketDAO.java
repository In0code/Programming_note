package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.vo.OrderVO;
import common.dao.DbConnection;
import user.vo.BucketVO;

public class BucketDAO {

	private static BucketDAO bkDAO;
	
	private BucketDAO() {
		
	}
	
	public static BucketDAO getInstance() {
		if(bkDAO == null) {
			bkDAO=new BucketDAO();
		}//end if
		return bkDAO;
	}//getInstance

	public List<BucketVO> selectAllList(String userId) throws SQLException{
		BucketVO bkVO=null;
		List<BucketVO> list= new ArrayList<BucketVO>();
		
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
			StringBuilder selectAllOrder=new StringBuilder();
			selectAllOrder
			.append("	select g.IMG1, g.GNAME, g.PRICE, bl.AMOUNT	")
			.append("	from BUCKET_LIST bl ,UORDER u ,GOODS g	")
			.append("	where (u.id=bl.id and g.GCODE = bl.GCODE) and u.id= ?	");
			
			pstmt=con.prepareStatement(selectAllOrder.toString());
			
			pstmt.setString(1, userId);
		//5. 바인드 변수 값 설정
		//6. 쿼리문 실행 후 값 얻기
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bkVO=new BucketVO();
				bkVO.setImg(rs.getString("IMG1"));
				bkVO.setProductName(rs.getString("GNAME"));
				bkVO.setPrice(rs.getInt("PRICE"));
				bkVO.setAmount(rs.getInt("AMOUNT"));
				list.add(bkVO);
			}//end while
		}finally {
			//7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectAllList
	
	public int deleteList(String[]) throws SQLException{
				
		
		
	}//deleteList
	
	public int deleteList(String) throws SQLException{
		List<BucketVO> list=new ArrayList<BucketVO>();
				
		
		
	}//deleteList
	
	public int changeAmount(String[]) throws SQLException{
		List<BucketVO> list=new ArrayList<BucketVO>();
				
		
		
	}//changeAmount
	
	
}//class
