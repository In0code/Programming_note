package user.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.dao.DbConnection;
import user.vo.ClientOrderPageVO;
import user.vo.ClientOrderVO;
import user.vo.DetailInfoVO;

public class ClientOrderDAO {
	
	private static ClientOrderDAO coDAO;
	
	private ClientOrderDAO() {
	}
	
	public static ClientOrderDAO getInstance() {
		if(coDAO == null) {
			coDAO = new ClientOrderDAO();
		}
		
		return coDAO;
	}
	
	public List<ClientOrderVO> selectAllOrder(ClientOrderPageVO copVO) throws SQLException {
		List<ClientOrderVO> list = new ArrayList<ClientOrderVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder selectOrder = new StringBuilder();
			selectOrder
			.append("	SELECT GCODE, LPAD(ORDNO,8,0) ORDNO, ORD_DNO, TO_CHAR(ORD_DATE, 'YYYY-MM-DD HH24:MI') INPUT_DATE, MAIN_IMG, GNAME, AMOUNT, DLVY_PRO, PRICE	")
			.append("	FROM ( SELECT ROW_NUMBER() OVER(ORDER BY ORD_DATE DESC) RNUM, G.GCODE, OD.ORD_DNO, UO.ID, UO.ORD_DATE, UO.ORDNO, G.MAIN_IMG, G.GNAME,	")
			.append("	OD.AMOUNT, OD.DLVY_PRO, G.PRICE	")
			.append("	FROM UORDER UO, GOODS G, ORDER_DETAIL OD	")
			.append("	WHERE UO.ID=? AND OD.ORDNO=UO.ORDNO AND G.GCODE=OD.GCODE AND (OD.DLVY_PRO LIKE 'D_' OR OD.DLVY_PRO LIKE 'P_'))	");
			
			boolean flag = false;
			if(copVO.getStartNum() != 0) {
				selectOrder.append("	WHERE RNUM BETWEEN ? AND ?	");
				flag = true;
			}
			
			pstmt = con.prepareStatement(selectOrder.toString());
			pstmt.setString(1, copVO.getId());
			
			if(flag) {
				pstmt.setInt(2, copVO.getStartNum());
				pstmt.setInt(3, copVO.getEndNum());
			}
			
			
			rs = pstmt.executeQuery();
			
			ClientOrderVO coVO = null;
			while(rs.next()) {
				coVO = new ClientOrderVO();
				coVO.setAmount(rs.getInt("AMOUNT"));
				coVO.setImg(rs.getString("MAIN_IMG"));
				coVO.setOnProcess(rs.getString("DLVY_PRO"));
				coVO.setOrderDate(rs.getString("INPUT_DATE"));
				coVO.setOrderNum(rs.getString("ORDNO"));
				coVO.setOrddno(rs.getString("ORD_DNO"));
				coVO.setGcode(rs.getString("GCODE"));
				coVO.setPrice(rs.getInt("PRICE"));
				coVO.setProductName(rs.getString("GNAME"));
				
				list.add(coVO);
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
	
	public List<ClientOrderVO> selectAllRecall(ClientOrderPageVO copVO) throws SQLException {
		List<ClientOrderVO> list = new ArrayList<ClientOrderVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder selectOrder = new StringBuilder();
			selectOrder
			.append("	SELECT GCODE, LPAD(ORDNO,8,0) ORDNO, ORD_DNO, TO_CHAR(ORD_DATE, 'YYYY-MM-DD HH24:MI') INPUT_DATE, MAIN_IMG, GNAME, AMOUNT, DLVY_PRO, PRICE	")
			.append("	FROM ( SELECT ROW_NUMBER() OVER(ORDER BY ORD_DATE DESC) RNUM, G.GCODE, OD.ORD_DNO, UO.ID, UO.ORD_DATE, UO.ORDNO, G.MAIN_IMG, G.GNAME,	")
			.append("	OD.AMOUNT, OD.DLVY_PRO, G.PRICE	")
			.append("	FROM UORDER UO, GOODS G, ORDER_DETAIL OD	")
			.append("	WHERE UO.ID=? AND OD.ORDNO=UO.ORDNO AND G.GCODE=OD.GCODE AND (OD.DLVY_PRO LIKE 'C_' OR OD.DLVY_PRO LIKE 'R_'OR OD.DLVY_PRO LIKE 'NA'))	");
			
			boolean flag = false;
			if(copVO.getStartNum() != 0) {
				selectOrder.append("	WHERE RNUM BETWEEN ? AND ?	");
				flag = true;
			}
			
			pstmt = con.prepareStatement(selectOrder.toString());
			pstmt.setString(1, copVO.getId());
			
			if(flag) {
				pstmt.setInt(2, copVO.getStartNum());
				pstmt.setInt(3, copVO.getEndNum());
			}
			
			rs = pstmt.executeQuery();
			
			ClientOrderVO coVO = null;
			while(rs.next()) {
				coVO = new ClientOrderVO();
				coVO.setAmount(rs.getInt("AMOUNT"));
				coVO.setImg(rs.getString("MAIN_IMG"));
				coVO.setOnProcess(rs.getString("DLVY_PRO"));
				coVO.setOrderDate(rs.getString("INPUT_DATE"));
				coVO.setOrderNum(rs.getString("ORDNO"));
				coVO.setOrddno(rs.getString("ORD_DNO"));
				coVO.setGcode(rs.getString("GCODE"));
				coVO.setPrice(rs.getInt("PRICE"));
				coVO.setProductName(rs.getString("GNAME"));
				
				list.add(coVO);
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
	
	public DetailInfoVO selectOneOrder(String ordno) throws SQLException {
		DetailInfoVO diVO = null;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder selectOne = new StringBuilder(); //U.DLVY_PRO -> OD.DLVY_PRO
			selectOne
			.append("	SELECT LPAD(u.ORDNO,8,0) ORDNO, TO_CHAR(u.ord_date, 'YYYY-MM-DD HH24:MI') ord_date, ")
			.append("	DA.RECEIVER, OD.DLVY_PRO, G.GNAME, G.MAIN_IMG, DA.ZIPCODE, DA.SIDO, DA.ADDR, DA.PHONE, G.PRICE, OD.AMOUNT	")
			.append("	FROM UORDER U, DELIVERY D, DELIVERY_ADDR DA, GOODS G, ORDER_DETAIL OD	")
			.append("	WHERE U.ORDNO='").append(ordno).append("'")
			.append("	AND  OD.ORDNO=U.ORDNO AND OD.GCODE=G.GCODE AND D.ORDNO=U.ORDNO AND D.DLVYNO=DA.DLVYNO	");
			
			pstmt = con.prepareStatement(selectOne.toString());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				diVO = new DetailInfoVO();
				diVO.setAddr(rs.getString("ADDR"));
				diVO.setImg(rs.getString("MAIN_IMG"));
				diVO.setName(rs.getString("RECEIVER"));
				diVO.setOnProcess(rs.getString("DLVY_PRO"));
				diVO.setOrderDate(rs.getString("ORD_DATE"));
				diVO.setOrderNum(rs.getString("ORDNO"));
				diVO.setPhone(rs.getString("PHONE"));
				diVO.setProductName(rs.getString("GNAME"));
				diVO.setSido(rs.getString("SIDO"));
				diVO.setZipcode(rs.getString("ZIPCODE"));
				diVO.setAmount(rs.getInt("AMOUNT"));
				diVO.setPrice(rs.getInt("PRICE"));
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		System.out.println(diVO);
		return diVO;
	}
	
	public void cancelOrder(String ord_dno, int price) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String cancelOrder = "UPDATE ORDER_DETAIL SET DLVY_PRO='NA'  WHERE ORD_DNO='"+ord_dno+"'";
			
			pstmt = con.prepareStatement(cancelOrder);
			pstmt.executeUpdate();
			

			cancelOrder = "UPDATE UORDER SET RECALL_DATE=STSDTAE WHERE ORD_DNO='"+ord_dno+"'";
			pstmt = con.prepareStatement(cancelOrder);
			
			pstmt.close();

			StringBuilder paymentQuery = new StringBuilder();
			paymentQuery
			.append("	UPDATE PAYMENT_INFO SET TOTAL_PRICE=TOTAL_PRICE-?	")
			.append("	WHERE NUM=(SELECT NUM FROM (SELECT PI.NUM	")
			.append("	FROM ORDER_DETAIL OD, UORDER O, PAYMENT P, PAYMENT_INFO PI	")
			.append("	WHERE ORD_DNO=? AND OD.ORDNO=O.ORDNO AND O.ORDNO=P.ORDNO AND P.NUM=PI.NUM))	");
			
			pstmt = con.prepareStatement(paymentQuery.toString());
			pstmt.setInt(1, price);
			pstmt.setString(2, ord_dno);
			
			pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		
	}
	
	public void recallOrder(String ord_dno, int price) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String cancelOrder = "UPDATE ORDER_DETAIL SET DLVY_PRO='R0' WHERE ORD_DNO='"+ord_dno+"'";
			
			pstmt = con.prepareStatement(cancelOrder);
			pstmt.executeUpdate();
			
			pstmt.close();
			
			StringBuilder paymentQuery = new StringBuilder();
			paymentQuery
			.append("	UPDATE PAYMENT_INFO SET TOTAL_PRICE=TOTAL_PRICE-?	")
			.append("	WHERE NUM=(SELECT NUM FROM (SELECT PI.NUM	")
			.append("	FROM ORDER_DETAIL OD, UORDER O, PAYMENT P, PAYMENT_INFO PI	")
			.append("	WHERE ORD_DNO=? AND OD.ORDNO=O.ORDNO AND O.ORDNO=P.ORDNO AND P.NUM=PI.NUM))	");
			
			pstmt = con.prepareStatement(paymentQuery.toString());
			pstmt.setInt(1, price);
			pstmt.setString(2, ord_dno);
			
			pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		
	}
	
	public void changeOrder(String ord_dno) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		System.out.println("ord_dno(DAO) : "+ord_dno);
		
		try {
			con = db.getConn("jdbc/dbcp");
			String cancelOrder = "UPDATE ORDER_DETAIL SET DLVY_PRO='C0' WHERE ORD_DNO='"+ord_dno+"'";
			
			System.out.println("cancelOrder(DAO) : "+cancelOrder);
			
			pstmt = con.prepareStatement(cancelOrder);
			pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		
	}
}
