package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.vo.DashboardVO;
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
	
	/**
	 * 결제완료/배송준비/배송중/배송완료/교환신청/반품신청 카운트
	 * @return
	 * @throws SQLException
	 */
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
				selectSalesStatus
				.append(" select count(*) as cnt from uorder 		")
				.append(" where ord_date >= ADD_MONTHS(SYSDATE, -3) ")
				.append(" group by dlvy_pro having dlvy_pro like '	")
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
	
	/**
	 * 판매 중/품절/재고 10개 이하 카운트
	 * @return
	 * @throws SQLException
	 */
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
	
	/**
	 * 방문자 카운트
	 * @throws SQLException
	 */
	public void insertVisitCount() throws SQLException{
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			pstmt = con.prepareStatement(" insert into visit values(to_char(sysdate,'yyyy-mm-dd')) ");
			
			pstmt.executeQuery();
		}finally {
			db.dbClose(null, pstmt, con);
		}
	}
	
	/**
	 * 최근 5일간 방문자 수
	 * @return
	 * @throws SQLException
	 */
	public int[] selectVisitCount() throws SQLException{
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int[] count = {0, 0, 0, 0, 0};
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectCount = new StringBuilder();
			
			selectCount
			.append(" select daydate, count(*) cnt 							")
			.append(" from visit 											")
			.append(" group by daydate 										")
			.append(" having daydate >= SYSDATE - NUMTODSINTERVAL(5, 'DAY')	")
			.append(" order by daydate										");
			
			int i = 0;
			pstmt = con.prepareStatement(selectCount.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				count[i] = rs.getInt("cnt");
				i++;
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return count;
	}
	
	/**
	 * 상품 판매량 top 5
	 * @return
	 * @throws SQLException
	 */
	public List<DashboardVO> selectTopProducts() throws SQLException{
		List<DashboardVO> list = new ArrayList<DashboardVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectTopPro = new StringBuilder();
			selectTopPro
			.append("	select rownum, gname, amount			")
			.append("	from(select g.gname, sum(amount) amount	")
			.append("	from order_detail o, goods g			")
			.append("	where o.gcode = g.gcode					")
			.append("	group by g.gname order by amount desc)	")
			.append("	where rownum between 1 and 5			");
			
			pstmt = con.prepareStatement(selectTopPro.toString());
			
			rs = pstmt.executeQuery();
			
			DashboardVO dbVO = null;
			while(rs.next()) {
				dbVO = new DashboardVO(rs.getString("gname"),rs.getInt("amount"));
				list.add(dbVO);
			}
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
	
	public int[] selectVisitSale() throws SQLException {
		int[] cnt = {0, 0, 0, 0, 0};
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectVisitSale = new StringBuilder();
			selectVisitSale
			.append("	select to_char(ord_date,'yyyy-mm-dd') ord_date, count(*) cnt	")
			.append("	from uorder														")
			.append("	group by to_char(ord_date,'yyyy-mm-dd')							")
			.append("	having to_char(ord_date,'yyyy-mm-dd') >= SYSDATE - NUMTODSINTERVAL(5, 'DAY')	")
			.append("	order by ord_date desc											");
			
			pstmt = con.prepareStatement(selectVisitSale.toString());
			
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()) {
				cnt[i] = rs.getInt("cnt");
				i++;
			}
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}
		
		return cnt;
	}

}
