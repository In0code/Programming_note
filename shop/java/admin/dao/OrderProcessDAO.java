package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.vo.BoardRangeVO;
import admin.vo.OrderVO;
import admin.vo.RecallVO;
import common.dao.DbConnection;

/*
결제완료 -  PF
배송중  -  D0
배송완료 -  DF
교환신청 - C0
교환완료 - CF
반품신청 - R0
반품완료 - RF
*/
public class OrderProcessDAO {

	private static OrderProcessDAO opDAO;
	
	private OrderProcessDAO() {
	}
	
	public static OrderProcessDAO getInstance() {
		if(opDAO == null) {
			opDAO=new OrderProcessDAO();
		}//end if
		return opDAO;
	}//getInstance
	
	/**
	 * 주문 리스트의 총 레코드 수
	 * @param brVO
	 * @return
	 * @throws SQLException
	 */
	public int orderTotalCount(BoardRangeVO brVO) throws SQLException{
		int totalCnt = 0;
		String keyword = brVO.getKeyword();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");

			StringBuilder selectCount = new StringBuilder();
			selectCount
			.append("	select count(*) CNT		")
			.append("	from UORDER u, GOODS g, ORDER_DETAIL od, MEMBER m	")
			.append("	where  m.id=u.id and od.gcode=g.gcode and u.ordno=od.ordno 	")
			.append("	and ( DLVY_PRO not in ('C0','CF','R0','RF'))	");
			
			
			
			if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
				String field="m.id";
				if("1".equals(brVO.getField())) {
					field="m.name";
				}//end if
				if("2".equals(brVO.getField())) {
					field="u.ORDNO";
				}//end if
				
				selectCount.append(" and ").append(field).append(" like '%'||?||'%'");					
			}//end if
			
			pstmt = con.prepareStatement(selectCount.toString());
			
			if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
				pstmt.setString(1, keyword);
			}//end if
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalCnt = rs.getInt("CNT");
			}//end if
		} finally {
			db.dbClose(rs, pstmt, con);
		}//end finally
		return totalCnt;
	}//orderTotalCount
	
	/**
	 * 교환/반품 리스트의 총 레코드 수
	 * @param brVO
	 * @return
	 * @throws SQLException
	 */
	public int recallTotalCount(BoardRangeVO brVO) throws SQLException{
		int totalCnt = 0;
		String keyword = brVO.getKeyword();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectCount = new StringBuilder();
			selectCount
			.append("	select count(*) CNT		")
			.append("	from UORDER u, GOODS g, ORDER_DETAIL od, MEMBER m	")
			.append("	where  m.id=u.id and od.gcode=g.gcode and u.ordno=od.ordno  	")
			.append("	and DLVY_PRO not in ('D0','DF','DR','PF') 	");
			
			
			
			if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
				String field="m.id";
				if("1".equals(brVO.getField())) {
					field="m.name";
				}//end if
				if("2".equals(brVO.getField())) {
					field="u.ORDNO";
				}//end if
				
				selectCount.append(" and ").append(field).append(" like '%'||?||'%'");					
			}//end if
			
			pstmt = con.prepareStatement(selectCount.toString());
			
			if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
				pstmt.setString(1, keyword);
			}//end if
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalCnt = rs.getInt("CNT");
			}//end if
		} finally {
			db.dbClose(rs, pstmt, con);
		}//end finally
		return totalCnt;
	}//recallTotalCount
	
	/**
	 * 전체 주문 조회해서 조회된 정보를 넣어주기 위한 일
	 * @return list
	 * @throws SQLException
	 */
	public List<OrderVO> selectAllOrder(BoardRangeVO brVO) throws SQLException{
		
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
			.append("	select ORD_DATE, ORDNO,id, GNAME, AMOUNT, PRICE, DLVY_PRO, NAME ,ORD_DNO	")
			.append("	from (select row_number() over(order by ORD_DATE desc) rnum,	")
			.append("	u.ORD_DATE, u.ORDNO,m.id ,g.GNAME, od.AMOUNT, g.PRICE, od.DLVY_PRO, m.NAME, od.ORD_DNO	")
			.append("	from UORDER u, GOODS g, MEMBER m, ORDER_DETAIL od	")
			.append("	where m.id=u.id and od.gcode=g.gcode and u.ordno=od.ordno	")
			.append("	and ( DLVY_PRO in ('D0','DF','DR','PF' ) )	");
			//
			
			if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword() )&& !"null".equals(brVO.getKeyword())) {
				String field="m.id";
				if("1".equals(brVO.getField())) {
					field="m.name";
				}//end if
				if("2".equals(brVO.getField())) {
					field="u.ORDNO";
				}//end if
				
				selectAllOrder.append("and ").append(field).append(" like '%'||?||'%' ");
			}//end if
			
			selectAllOrder.append(")	where rnum between ? and ?					");
			
			pstmt=con.prepareStatement(selectAllOrder.toString());
		//5. 바인드 변수 값 설정
			int bindCnt=1;
			if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword() )&& !"null".equals(brVO.getKeyword())) {
			pstmt.setString(bindCnt++, brVO.getKeyword());	
			}//end if
			
			pstmt.setInt(bindCnt++, brVO.getStartNum());
			pstmt.setInt(bindCnt++, brVO.getEndNum());
		//5. 바인드 변수 값 설정
		//6. 쿼리문 실행 후 값 얻기
			rs=pstmt.executeQuery();
			while(rs.next()) {
				oVO=new OrderVO();
				oVO.setOrd_date(rs.getString("ORD_DATE"));
				oVO.setOrdno(rs.getString("ORDNO"));
				oVO.setGname(rs.getString("GNAME"));
				oVO.setAmount(rs.getInt("AMOUNT"));
				oVO.setPrice(rs.getInt("PRICE"));
				oVO.setDlvy_pro(rs.getString("DLVY_PRO"));
				oVO.setName(rs.getString("NAME"));
				oVO.setOrd_dno(rs.getString("ORD_DNO"));
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
	public int updateShippingProgress(String dlvy_pro, String ord_dno) throws SQLException{
		
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
			.append("	update ORDER_DETAIL	")
			.append("	set  DLVY_PRO=	? ")
			.append("	where ORD_DNO = ? ");
			
			pstmt=con.prepareStatement(updateShipPro.toString());
			
			//5.
			pstmt.setString(1, dlvy_pro );
			pstmt.setString(2, ord_dno );
			
			//6.
			rowCntShipUpdate=pstmt.executeUpdate();
		}finally{
			//7.
			db.dbClose(null, pstmt, con);
		}//end finally
		return rowCntShipUpdate;
	}//updateShippingProgress
	
	/**
	 * 교환/반품 리스트에서 전체 주문 조회해서 조회된 정보를 넣어주기 위한 일
	 * @return list
	 * @throws SQLException
	 */
	public List<RecallVO> selectRecallAllOrder(BoardRangeVO brVO) throws SQLException{
		
		RecallVO rVO=null;
		List<RecallVO> list= new ArrayList<RecallVO>();
		
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
			.append("	select ORD_DATE, ORDNO,id, GNAME, AMOUNT, PRICE, DLVY_PRO, NAME	, RECALL_DATE, ORD_DNO ")
			.append("	from (select row_number() over(order by ORD_DATE desc) rnum,	")
			.append("	u.ORD_DATE, u.ORDNO,m.id ,g.GNAME, od.AMOUNT, g.PRICE, od.DLVY_PRO, m.NAME, u.RECALL_DATE, od.ORD_DNO	")
			.append("	from UORDER u, GOODS g, MEMBER m, ORDER_DETAIL od	")
			.append("	where m.id=u.id and od.gcode=g.gcode and u.ordno=od.ordno	")
			.append("	and ( DLVY_PRO in ('C0','CF','R0','RF' ) )	");
			//
			
			if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword() )&& !"null".equals(brVO.getKeyword())) {
				String field="m.id";
				if("1".equals(brVO.getField())) {
					field="m.name";
				}//end if
				if("2".equals(brVO.getField())) {
					field="u.ORDNO";
				}//end if
				
				selectAllOrder.append("and ").append(field).append(" like '%'||?||'%' ");
			}//end if
			
			selectAllOrder.append(")	where rnum between ? and ?					");
			
			pstmt=con.prepareStatement(selectAllOrder.toString());
		//5. 바인드 변수 값 설정
			int bindCnt=1;
			if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword() )&& !"null".equals(brVO.getKeyword())) {
			pstmt.setString(bindCnt++, brVO.getKeyword());	
			}//end if
			
			pstmt.setInt(bindCnt++, brVO.getStartNum());
			pstmt.setInt(bindCnt++, brVO.getEndNum());
		//5. 바인드 변수 값 설정
		//6. 쿼리문 실행 후 값 얻기
			rs=pstmt.executeQuery();
			while(rs.next()) {
				rVO=new RecallVO();
				rVO.setOrd_date(rs.getString("ORD_DATE"));
				rVO.setOrdno(rs.getString("ORDNO"));
				rVO.setGname(rs.getString("GNAME"));
				rVO.setAmount(rs.getInt("AMOUNT"));
				rVO.setPrice(rs.getInt("PRICE"));
				rVO.setDlvy_pro(rs.getString("DLVY_PRO"));
				rVO.setName(rs.getString("NAME"));
				rVO.setOrd_dno(rs.getString("ORD_DNO"));
				rVO.setRecall_date(rs.getString("RECALL_DATE"));
				list.add(rVO);
			}//end while
		}finally {
			//7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectRecallAllOrder
	
}//class