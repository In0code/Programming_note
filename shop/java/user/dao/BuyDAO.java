package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.dao.DbConnection;
import user.vo.AddrVO;
import user.vo.BuyInfoVO;
import user.vo.BuyPaymentVO;
import user.vo.BuyingCartVO;
import user.vo.FillOrderInfoVO;

public class BuyDAO {
	
	private static BuyDAO bDAO;
	
	private BuyDAO() {
	}

	public static BuyDAO getInstance() {
		if(bDAO == null) {
			bDAO = new BuyDAO();
		}
		
		return bDAO;
	}
	
	public String insertDelivery(BuyInfoVO biVO) throws SQLException {
		String ordno = "";
		int flag = 0;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		ordno = makePK("UORDER", "ORDNO");
		
		
		try {
			con = db.getConn("jdbc/dbcp");
			con.setAutoCommit(false); //auto commit 해지
			
			StringBuilder insertDelivery = new StringBuilder();
			insertDelivery
			.append("	INSERT INTO UORDER(ORDNO, ID) VALUES(?, ?)	");
			
			pstmt = con.prepareStatement(insertDelivery.toString());
			pstmt.setString(1, ordno);
			pstmt.setString(2, biVO.getId());
			
			flag += pstmt.executeUpdate();
			
			insertDelivery.setLength(0);
			pstmt.close();
			
			String dlvyno = makePK("DELIVERY_ADDR", "DLVYNO");
			
			insertDelivery
			.append("	INSERT INTO DELIVERY_ADDR(DLVYNO, ID, RECEIVER, ZIPCODE, SIDO, ADDR, PHONE, MSG, EMAIL)	")
			.append("	VALUES(?,?,?,?,?,?,?,?,?)	");
			
			pstmt = con.prepareStatement(insertDelivery.toString());
			pstmt.setString(1, dlvyno);
			pstmt.setString(2, biVO.getId());
			pstmt.setString(3, biVO.getReceiver());
			pstmt.setString(4, biVO.getZipcode());
			pstmt.setString(5, biVO.getSido());
			pstmt.setString(6, biVO.getAddr());
			pstmt.setString(7, biVO.getPhone());
			pstmt.setString(8, biVO.getMsg());
			pstmt.setString(9, biVO.getEmail());
			
			flag += pstmt.executeUpdate();
			
			insertDelivery.setLength(0);
			pstmt.close();
			
			for(int i = 0; i < biVO.getGcode().length; i++) {
				String ord_dno = makePK("ORDER_DETAIL", "ORD_DNO");
				
				insertDelivery
				.append("	INSERT INTO ORDER_DETAIL(ORD_DNO, ORDNO, AMOUNT, GCODE)	")
				.append("	VALUES(?,?,?,?)	");
				
				pstmt = con.prepareStatement(insertDelivery.toString());
				pstmt.setString(1, ord_dno);
				pstmt.setString(2, ordno);
				pstmt.setInt(3, biVO.getAmount()[i]);
				pstmt.setString(3, biVO.getGcode()[i]);
				
				pstmt.executeUpdate();
			}
			
			flag++;
			
			insertDelivery.setLength(0);
			pstmt.close();
			
			insertDelivery
			.append("	INSERT INTO DELIVERY(DLVYNO, ORDNO) VALUES(?,?)	");
			
			pstmt = con.prepareStatement(insertDelivery.toString());
			pstmt.setString(1, dlvyno);
			pstmt.setString(2, ordno);
			
			flag += pstmt.executeUpdate();
			
			pstmt.close();
			
			if(flag == 4) {
				con.commit();
			} else {
				con.rollback();
			}
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		
		return ordno;
	}
	
	public int insertPriceInfo(BuyPaymentVO bpVO) throws SQLException {
		int result = 0;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder insertPaymentInfo = new StringBuilder();
			insertPaymentInfo
			.append("	INSERT INTO PAYMENT_INFO(NUM, PAYMENT_NUM, TOTAL_PRICE) VALUES(?, ?,(SELECT SUM(TOTAL) TOTAL	")
			.append("	FROM(SELECT (OD.AMOUNT * G.PRICE) TOTAL	")
			.append("	FROM  UORDER O, ORDER_DETAIL OD, GOODS G	")
			.append("	WHERE O.ORDNO=? AND OD.ORDNO=O.ORDNO AND OD.GCODE=G.GCODE)))	");
					
			String num = makePK("PAYMENT_INFO", "NUM");
			
			pstmt = con.prepareStatement(insertPaymentInfo.toString());
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.setString(2, bpVO.getCardNum());
			pstmt.setString(3, bpVO.getOrdno());
			
			result = pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		return result;
	}
	
	public List<BuyingCartVO> selectBuyingGoods(String id) throws SQLException {
		List<BuyingCartVO> list = new ArrayList<BuyingCartVO>();
		
		
		return list;
	}
	
	public void updateAddr(AddrVO aVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String updateAddr = "UPDATE MEMBER SET ZIPCODE=?, SIDO=?, ADDR=? WHERE ID=?";
			
			pstmt = con.prepareStatement(updateAddr);
			pstmt.setString(1, aVO.getZipcode());
			pstmt.setString(2, aVO.getSido());
			pstmt.setString(3, aVO.getAddr());
			pstmt.setString(4, aVO.getId());
			
			pstmt.executeUpdate();
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		
	}
	
	public FillOrderInfoVO selectInfo(String id) throws SQLException {
		FillOrderInfoVO foiVO = null;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String selectInfo = "SELECT NAME, ZIPCODE, SIDO, ADDR, EMAIL FROM MEMBER WHERE ID=?'";
			
			pstmt = con.prepareStatement(selectInfo);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				foiVO = new FillOrderInfoVO(rs.getString("NAME"), rs.getString("ZIPCODE"), rs.getString("SIDO"), rs.getString("ADDR"), rs.getString("EMAIL"));
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return foiVO;
	}
	
	public String makePK(String table, String colm) throws SQLException {
		int result = 0;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String makeOrdno = "SELECT ? FROM (SELECT ORDNO FROM ? ORDER BY ? DESC) WHERE ROWNUM=1";
			
			pstmt = con.prepareStatement(makeOrdno);
			pstmt.setString(1, colm);
			pstmt.setString(2, table);
			pstmt.setString(3, colm);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String temp = rs.getString(colm);
				try {
					result = Integer.parseInt(temp)+1;
					
				} catch (NumberFormatException e) {
					result = -1;
				} catch (NullPointerException ne) {
				}
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return String.valueOf(result);
	}
}
