package shop_prj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import kr.co.sist.dao.DbConnection;
import oracle.jdbc.proxy.annotation.Pre;

public class OrderProcessDAO {

	private static OrderProcessDAO opDAO;
	
	private OrderProcessDAO() {
	}
	
	public static OrderProcessDAO getInstance() {
		if(opDAO != null) {
			opDAO=new OrderProcessDAO();
		}//end if
		return opDAO;
	}//getInstance
	
	/**
	 * 전체 주문 조회해서 조회된 정보를 넣어주기 위한 일
	 * @return list
	 * @throws SQLException
	 */
	public List<OrderVO> selectAllOrder() throws SQLException{
		
		OrderVO oVO=null;
		List<OrderVO> list= new ArrayList<OrderVO>();
		
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
			.append("		")
			.append("		")
			.append("		");
			
			pstmt=con.prepareStatement(selectAllOrder.toString());
		//5. 바인드 변수 값 설정
		//6. 쿼리문 실행 후 값 얻기
			rs=pstmt.executeQuery();
			while(rs.next()) {
				
				list.add(oVO);
			}//end while
		}finally {
			//7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectAllOrder
	
	/**
	 * 주문자나 id로 검색한 주문 내역을 조회하여 조회된 주문 정보를 넣어주기 위한 일
	 * @param receiver
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public List<OrderVO> selectAllOrder(String receiver,String id) throws SQLException{
		OrderVO oVO=null;
		List<OrderVO> list= new ArrayList<OrderVO>();
		
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
			.append("		")
			.append("		")
			.append("		");
			
			pstmt=con.prepareStatement(selectAllOrder.toString());
		//5. 바인드 변수 값 설정
		//6. 쿼리문 실행 후 값 얻기
			rs=pstmt.executeQuery();
			while(rs.next()) {
				
				list.add(oVO);
			}//end while
		}finally {
			//7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
		
	}//selectAllOrder
	
	/**
	 * 주문 상태 변경 후, 수정 된 주문 정보를 DB에 update하는 일
	 * @param dlvyPro
	 * @return
	 * @throws SQLException
	 */
	public int updateShippingProgress(String dlvyPro) throws SQLException{
		
		DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		int rowCntShipUpdate=0;
		try {
			//1.
			//2.
			//3.
			con=db.getConn("jdbc/dbcp");
			//4.
			StringBuilder updateShipPro=new StringBuilder();
			updateShipPro
			.append("		")
			.append("		")
			.append("		");
			
			pstmt=con.prepareStatement(updateShipPro.toString());
			//5.
			
			//6.
			rowCntShipUpdate=pstmt.executeUpdate();
			
			if (rowCntShipUpdate == 0) {
				JOptionPane.showMessageDialog(null, "변경된 내용이 없습니다. 다시 확인해주세요");
				con.rollback(); // 실패하면 롤백
			} else {
				JOptionPane.showMessageDialog(null, "수정이 완료되었습니다");
				con.commit(); // 성공하면 커밋
			} // end else
		}finally{
			//7.
			db.dbClose(null, pstmt, con);
		}//end finally
		return rowCntShipUpdate;
	}//updateShippingProgress
	
	/**
	 * 교환/반품 처리 상태 변경 후, 수정 된 주문 정보를 DB에 update하는 일
	 * @param progress
	 * @return
	 * @throws SQLException
	 */
	public int updateRecall(String progress)throws SQLException {
		
DbConnection db=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		int rowCntUpdate=0;
		try {
			//1.
			//2.
			//3.
			con=db.getConn("jdbc/dbcp");
			//4.
			StringBuilder updateShipPro=new StringBuilder();
			updateShipPro
			.append("		")
			.append("		")
			.append("		");
			
			pstmt=con.prepareStatement(updateShipPro.toString());
			//5.
			
			//6.
			rowCntUpdate=pstmt.executeUpdate();
			
			if (rowCntUpdate == 0) {
				JOptionPane.showMessageDialog(null, "변경된 내용이 없습니다. 다시 확인해주세요");
				con.rollback(); // 실패하면 롤백
			} else {
				JOptionPane.showMessageDialog(null, "수정이 완료되었습니다");
				con.commit(); // 성공하면 커밋
			} // end else
		}finally{
			//7.
			db.dbClose(null, pstmt, con);
		}//end finally
		return rowCntUpdate;
	}//updateRecall
	
	
}//class
