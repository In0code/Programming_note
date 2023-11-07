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
import user.vo.BuyingGoodsVO;
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
			
			pstmt.executeUpdate();
			flag++;
			
			insertDelivery.delete(0, insertDelivery.length());
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
			
			pstmt.executeUpdate();
			flag++;
			
			insertDelivery.delete(0, insertDelivery.length());
			pstmt.close();
			
			int ord_dno = Integer.parseInt(makePK("ORDER_DETAIL", "ORD_DNO"));
			for(int i = 0; i < biVO.getGcode().length; i++) {
				
				insertDelivery
				.append("	INSERT INTO ORDER_DETAIL(ORD_DNO, ORDNO, AMOUNT, GCODE)	")
				.append("	VALUES('").append(String.valueOf(ord_dno)).append("','").append(ordno).append("',").append(biVO.getAmount()[i])
				.append(",'").append(biVO.getGcode()[i]).append("')");
				
				pstmt = con.prepareStatement(insertDelivery.toString());
				
				pstmt.executeUpdate();
				
				insertDelivery.delete(0, insertDelivery.length());
				pstmt.close();
				
				ord_dno++;
			}
			
			flag++;
			
			insertDelivery.delete(0, insertDelivery.length());
			pstmt.close();
			
			insertDelivery
			.append("	INSERT INTO DELIVERY(DLVYNO, ORDNO) VALUES(?,?)	");
			
			pstmt = con.prepareStatement(insertDelivery.toString());
			pstmt.setString(1, dlvyno);
			pstmt.setString(2, ordno);
			
			pstmt.executeUpdate();
			flag++;
			
			pstmt.close();
			
			if(flag == 4) {
				con.commit();
				updateTotalBuy(biVO);
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
			con.setAutoCommit(false);

			String num = makePK("PAYMENT_INFO", "NUM");
			StringBuilder insertPaymentInfo = new StringBuilder();
/////////////////////////////////////////////////////////////////////////			
			insertPaymentInfo
			.append("	INSERT INTO PAYMENT_INFO(NUM, PAYMENT_NUM, TOTAL_PRICE) VALUES(?, ?,(SELECT SUM(TOTAL) TOTAL	")
			.append("	FROM(SELECT (OD.AMOUNT * G.PRICE) TOTAL	")
			.append("	FROM  UORDER O, ORDER_DETAIL OD, GOODS G	")
			.append("	WHERE O.ORDNO=? AND OD.ORDNO=O.ORDNO AND OD.GCODE=G.GCODE)))	");
			
			pstmt = con.prepareStatement(insertPaymentInfo.toString());
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.setString(2, bpVO.getCardNum());
			pstmt.setString(3, bpVO.getOrdno());

			result += pstmt.executeUpdate();

			insertPaymentInfo.delete(0, insertPaymentInfo.length());
			pstmt.close();
////////////////////////////////////////////////////////////////////////			
			insertPaymentInfo.append("INSERT INTO PAYMENT(ORDNO, NUM) VALUES(?, ?)");
			pstmt = con.prepareStatement(insertPaymentInfo.toString());
			
			pstmt.setString(1, bpVO.getOrdno());
			pstmt.setInt(2, Integer.parseInt(num));
			
			result += pstmt.executeUpdate();
			
			if(result == 2) {
				con.commit();
			} else {
				con.rollback();
			}
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		return result;
	}
	
	public List<BuyingGoodsVO> selectAllCartGoods(String id) throws SQLException {
		List<BuyingGoodsVO> list = new ArrayList<BuyingGoodsVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String allCart = "SELECT GCODE, ID, AMOUNT, BCODE FROM BUCKET_LIST WHERE ID=?";
			
			pstmt = con.prepareStatement(allCart);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			BuyingGoodsVO bgVO = null;
			while(rs.next()) {
				bgVO = new BuyingGoodsVO(rs.getString("GCODE"), rs.getString(""), rs.getString(""), rs.getInt(""), rs.getInt("AMOUNT"));
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		
		return list;
	}
	
	public List<BuyingGoodsVO> selectAllWishGoods(String id) throws SQLException {
		List<BuyingGoodsVO> list = new ArrayList<BuyingGoodsVO>();
		
		
		return list;
	}
	
	public List<BuyingGoodsVO> selectWishGoods(String[] gcodes) throws SQLException {
		List<BuyingGoodsVO> list = new ArrayList<BuyingGoodsVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String goods = "SELECT G.GCODE, G.GNAME, G.PRICE, G.MAIN_IMG FROM WISHLIST W, GOODS G WHERE W.GCODE=G.GCODE AND W.WCODE=?";
			
			BuyingGoodsVO bgVO = null;
			for(String code : gcodes) {
				pstmt = con.prepareStatement(goods);
				pstmt.setString(1, code);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bgVO = new BuyingGoodsVO(rs.getString("GCODE"), rs.getString("GNAME"), rs.getString("MAIN_IMG"), rs.getInt("PRICE"), 1);
					list.add(bgVO);
				}
				
				pstmt.close();
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
	
	public List<BuyingGoodsVO> selectCartGoods(String[] gcodes) throws SQLException {
		List<BuyingGoodsVO> list = new ArrayList<BuyingGoodsVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String goods = "SELECT G.GCODE, G.GNAME, G.PRICE, G.MAIN_IMG, B.AMOUNT FROM BUCKET_LIST B, GOODS G WHERE B.GCODE=G.GCODE AND B.BCODE=?";
			
			BuyingGoodsVO bgVO = null;
			for(String code : gcodes) {
				pstmt = con.prepareStatement(goods);
				pstmt.setString(1, code);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bgVO = new BuyingGoodsVO(rs.getString("GCODE"), rs.getString("GNAME"), rs.getString("MAIN_IMG"), rs.getInt("PRICE"), rs.getInt("AMOUNT"));
					list.add(bgVO);
				}
				
				pstmt.close();
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
	
	public BuyingGoodsVO selectDetailGoods(String gcode) throws SQLException {
		BuyingGoodsVO bgVO = null;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String query = "SELECT GCODE, GNAME, PRICE, MAIN_IMG FROM GOODS WHERE GCODE=?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, gcode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bgVO = new BuyingGoodsVO(rs.getString("GCODE"), rs.getString("GNAME"), rs.getString("MAIN_IMG"), rs.getInt("PRICE"), 0);
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		
		return bgVO;
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
		String result = "";
		boolean flag = "NUM".equals(colm.toUpperCase()) ? true : false;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String makeOrdno = "";
			
			if(flag) {
				makeOrdno = "SELECT "+colm+"+1 "+colm+" FROM (SELECT "+colm+" FROM "+table+" ORDER BY "+colm+" DESC) WHERE ROWNUM=1";
			} else {
				makeOrdno = "SELECT "+colm+" FROM (SELECT LPAD("+colm+",8,0) "+colm+" FROM "+table+" ORDER BY "+colm+" DESC) WHERE ROWNUM=1";
			}
			
			pstmt = con.prepareStatement(makeOrdno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				try {
					if(flag) {
						result = String.valueOf(rs.getInt(colm));
					} else {
						result = String.valueOf(Integer.parseInt(rs.getString(colm))+1);
					}

				} catch (NumberFormatException e) {
					result = "숫자 아님";
				} catch (NullPointerException ne) {
				}
					
			} else {
				result = "0";
			}
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		return result;
	}
	
	public void deletePayProcess(String ordno) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			String deleteORDER_DETAIL = "DELETE FROM ORDER_DETAIL WHERE ORDNO=?	";
			String deletePAYMENT = "	DELETE FROM PAYMENT WHERE ORDNO=?	";
			String deleteUORDER = "	DELETE FROM UORDER WHERE ORDNO=?	";
			String deleteDELIVERY = "	DELETE FROM DELIVERY WHERE ORDNO=?	";
			String deleteDELIVERY_ADDR = "	DELETE FROM DELIVERY_ADDR WHERE DLVYNO=(SELECT DLVYNO FROM DELIVERY WHERE ORDNO=?)	";
			String deletePAYMENT_INFO = "	DELETE FROM PAYMENT_INFO WHERE NUM=(SELECT NUM FROM PAYMENT WHERE ORDNO=?)	";
			
			pstmt = con.prepareStatement(deleteORDER_DETAIL);
			pstmt.setString(1, ordno);
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = con.prepareStatement(deletePAYMENT);
			pstmt.setString(1, ordno);
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = con.prepareStatement(deleteUORDER);
			pstmt.setString(1, ordno);
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = con.prepareStatement(deleteDELIVERY);
			pstmt.setString(1, ordno);
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = con.prepareStatement(deleteDELIVERY_ADDR);
			pstmt.setString(1, ordno);
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = con.prepareStatement(deletePAYMENT_INFO);
			pstmt.setString(1, ordno);
			pstmt.executeUpdate();
			
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
	}
	
	public void updateTotalBuy(BuyInfoVO biVO) throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder update = new StringBuilder();
			
			for(int i = 0; i < biVO.getGcode().length; i++) {
				update.append("UPDATE GOODS SET TOTAL_BUY=(TOTAL_BUY+1), QUANTITY=(QUANTITY-1) WHERE GCODE='").append(biVO.getGcode()[i]).append("'");
				
				pstmt = con.prepareStatement(update.toString());
				pstmt.executeUpdate();
				pstmt.close();
				
				update.delete(0, update.length());
			}
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
	}
}
