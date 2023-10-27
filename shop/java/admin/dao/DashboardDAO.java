package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.dao.DbConnection;

public class DashboardDAO {
	
	private static DashboardDAO dbDAO;
	
	private DashboardDAO () {
		
	}
	
	public static DashboardDAO getInstance() {
		if(dbDAO==null) {
			dbDAO = new DashboardDAO();
		}
		return dbDAO;
	}
	
	public int[] selectSalesStatus() throws SQLException {
		int[] cnt = new int[6];
		//결제완료 - PF / 배송준비 - DR / 배송중 - D0 / 배송완료 - DF
		//교환신청 - C0 / 반품신청 - R0
		String[] status = {"PF", "DR", "D0", "DF", "C0", "R0"};
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder selectSalesStatus = new StringBuilder();
			
			for(int i=0; i<cnt.length; i++) {
				selectSalesStatus.append(" select count(*) as cnt from uorder ")
				.append(" where ord_date >= ADD_MONTHS(SYSDATE, -3) ")
				.append(" group by dlvy_pro having dlvy_pro like '")
				.append(status[i])
				.append("'");
				pstmt = con.prepareStatement(selectSalesStatus.toString());
				rs = pstmt.executeQuery();
				cnt[i] = rs.next() ? rs.getInt("cnt") : 0;
				pstmt.close();
				rs.close();
				selectSalesStatus.setLength(0);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return cnt;
	}
	
	public int[] selectProductStatus() throws SQLException {
		int[] cnt = new int[3];
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			//판매중
			pstmt = con.prepareStatement(" select count(*) cnt from goods where quantity <> 0 ");
			rs = pstmt.executeQuery();
			cnt[0] = rs.next() ? rs.getInt("cnt") : 0;
			pstmt.close();
			rs.close();
			
			//품절
			pstmt = con.prepareStatement(" select count(*) cnt from goods where quantity = 0 ");
			rs = pstmt.executeQuery();
			cnt[1] = rs.next() ? rs.getInt("cnt") : 0;
			pstmt.close();
			rs.close();

			//재고 10개 미만
			pstmt = con.prepareStatement(" select count(*) cnt from goods where quantity between 1 and 10 ");
			rs = pstmt.executeQuery();
			cnt[2] = rs.next() ? rs.getInt("cnt") : 0;
			pstmt.close();
			rs.close();
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return cnt;
	}

}
