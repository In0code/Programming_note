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
			.append("	SELECT ORDNO, TO_CHAR(ORD_DATE, 'YYYY-MM-DD HH24:MI') INPUT_DATE, MAIN_IMG, GNAME, AMOUNT, DLVY_PRO, PRICE	")
			.append("	FROM ( SELECT ROW_NUMBER() OVER(ORDER BY ORD_DATE DESC) RNUM, UO.ID, UO.ORD_DATE, UO.ORDNO, G.MAIN_IMG, G.GNAME,	")
			.append("	OD.AMOUNT, UO.DLVY_PRO, G.PRICE	")
			.append("	FROM UORDER UO, GOODS G, ORDER_DETAIL OD	")
			.append("	WHERE UO.ID = ? AND OD.ORDNO=UO.ORDNO AND G.GCODE=OD.GCODE AND (UO.DLVY_PRO LIKE 'D_' OR UO.DLVY_PRO LIKE 'P_'))	");
			
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
			.append("	SELECT ORDNO, TO_CHAR(ORD_DATE, 'YYYY-MM-DD HH24:MI') INPUT_DATE, MAIN_IMG, GNAME, AMOUNT, DLVY_PRO, PRICE	")
			.append("	FROM ( SELECT ROW_NUMBER() OVER(ORDER BY ORD_DATE DESC) RNUM, UO.ID, UO.ORD_DATE, UO.ORDNO, G.MAIN_IMG, G.GNAME,	")
			.append("	OD.AMOUNT, UO.DLVY_PRO, G.PRICE	")
			.append("	FROM UORDER UO, GOODS G, ORDER_DETAIL OD	")
			.append("	WHERE UO.ID = ? AND OD.ORDNO=UO.ORDNO AND G.GCODE=OD.GCODE AND (UO.DLVY_PRO LIKE 'C_' OR UO.DLVY_PRO LIKE 'R_' OR UO.DLVY_PRO LIKE 'NA'))	");
			
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
			StringBuilder selectOne = new StringBuilder();
			selectOne
			.append("		")
			.append("		")
			.append("		");
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return diVO;
	}
	
	public int cancelOrder(String ordno) throws SQLException {
		int result = 0;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder cancelOrder = new StringBuilder();
			cancelOrder
			.append("		")
			.append("		")
			.append("		");
			
		} finally {
			db.dbClose(null, pstmt, con);
		}
		
		return result;
	}
}
