package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import admin.vo.DashboardVO;
import common.dao.DbConnection;

public class DashboardDAO {

	private static DashboardDAO dbDAO;

	private DashboardDAO() {

	}

	public static DashboardDAO getInstance() {
		if (dbDAO == null) {
			dbDAO = new DashboardDAO();
		}
		return dbDAO;
	}

	/**
	 * 판매 현황
	 * @return
	 * @throws SQLException
	 */
	public int selectSaleStatus(String status) throws SQLException {
		int cnt = 0;
		// 결제완료 - PF / 배송준비 - DR / 배송중 - D0 / 배송완료 - DF
		// 교환신청 - C0 / 반품신청 - R0
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder selectSalesStatus = new StringBuilder();

			selectSalesStatus
			.append(" select count(*) as cnt from uorder 									  ")
			.append(" where ord_date >= ADD_MONTHS(SYSDATE, -3) and dlvy_pro like '%'||?||'%' ")
			.append(" group by dlvy_pro  													  ");
			
			pstmt = con.prepareStatement(selectSalesStatus.toString());
			pstmt.setString(1, status);
			rs = pstmt.executeQuery();
			
			cnt = rs.next() ? rs.getInt("cnt") : 0;
			
			selectSalesStatus.setLength(0);
			pstmt.close();
			rs.close();

		} finally {
			db.dbClose(rs, pstmt, con);
		}

		return cnt;
	}
	
	/**
	 * 판매 중
	 * @return 판매 중인 상품 개수
	 * @throws SQLException
	 */
	public int selectOnSale() throws SQLException {
		int cnt = 0;

		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {
			con = db.getConn("jdbc/dbcp");

			// 판매중
			pstmt = con.prepareStatement(" select count(*) cnt from goods where quantity <> 0 ");
			rs = pstmt.executeQuery();
			
			cnt = rs.next() ? rs.getInt("cnt") : 0;
			
			pstmt.close();
			rs.close();
		} finally {
			db.dbClose(rs, pstmt, con);
		}

		return cnt;
	}
	
	/**
	 * 품절
	 * @return 품절인 상품 개수
	 * @throws SQLException
	 */
	public int selectSoldOut() throws SQLException {
		int cnt = 0;

		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {
			con = db.getConn("jdbc/dbcp");

			// 판매중
			pstmt = con.prepareStatement(" select count(*) cnt from goods where quantity = 0 ");
			rs = pstmt.executeQuery();
			
			cnt = rs.next() ? rs.getInt("cnt") : 0;
			
			pstmt.close();
			rs.close();
		} finally {
			db.dbClose(rs, pstmt, con);
		}

		return cnt;
	}
	
	/**
	 * 재고 10개 이하
	 * @return 재고 10개 이하인 상품 개수
	 * @throws SQLException
	 */
	public int selectUnderStock() throws SQLException {
		int cnt = 0;

		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {
			con = db.getConn("jdbc/dbcp");

			// 판매중
			pstmt = con.prepareStatement(" select count(*) cnt from goods where quantity between 1 and 10 ");
			rs = pstmt.executeQuery();
			
			cnt = rs.next() ? rs.getInt("cnt") : 0;
			
			pstmt.close();
			rs.close();
		} finally {
			db.dbClose(rs, pstmt, con);
		}

		return cnt;
	}

	/**
	 * 최근 3달 동안 상품 판매량 top 5
	 * @return
	 * @throws SQLException
	 */
	public List<DashboardVO> selectTopProducts() throws SQLException {
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
			.append("	from order_detail o, goods g, uorder u	")
			.append("	where o.gcode = g.gcode	and o.ordno = u.ordno and ord_date >= ADD_MONTHS(SYSDATE, -3) and dlvy_pro not in ('R0','RF')")
			.append("	group by g.gname order by amount desc)	")
			.append("	where rownum between 1 and 5			");

			pstmt = con.prepareStatement(selectTopPro.toString());

			rs = pstmt.executeQuery();

			DashboardVO dbVO = null;
			while (rs.next()) {
				dbVO = new DashboardVO(rs.getString("gname"), rs.getInt("amount"));
				list.add(dbVO);
			}

		} finally {
			db.dbClose(rs, pstmt, con);
		}

		return list;
	}

	/**
	 * 방문자 카운트
	 * 
	 * @throws SQLException
	 */
	public void insertVisitCount() throws SQLException {
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = db.getConn("jdbc/dbcp");

			pstmt = con.prepareStatement(" insert into visit values(to_char(sysdate,'yyyy-mm-dd')) ");

			pstmt.executeQuery();
		} finally {
			db.dbClose(null, pstmt, con);
		}
	}

	/**
	 * 최근 5일간 방문자 수
	 * 
	 * @return
	 * @throws SQLException
	 */
	public int selectVisitCount(int day) throws SQLException {
		int cnt = 0;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = db.getConn("jdbc/dbcp");
			LocalDate date = LocalDate.now();
			StringBuilder selectCount = new StringBuilder();

			date = date.minus(day, ChronoUnit.DAYS);	
			
			selectCount
			.append(" select daydate, count(*) cnt 	")
			.append(" from visit 					")
			.append(" where daydate = ? 			")
			.append(" group by daydate 				");
			
			pstmt = con.prepareStatement(selectCount.toString());
			pstmt.setString(1, date.toString());
			
			rs = pstmt.executeQuery();
			
			cnt = rs.next() ? rs.getInt("cnt") : 0;
			
			selectCount.setLength(0);
			pstmt.close();
			rs.close();

		} finally {
			db.dbClose(rs, pstmt, con);
		}

		return cnt;
	}

	/**
	 * 최근 5일간 판매건수
	 * 
	 * @return
	 * @throws SQLException
	 */
	public int selectVisitSale(int day) throws SQLException {
		int cnt = 0;

		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			LocalDate date = LocalDate.now();
			StringBuilder selectVisitSale = new StringBuilder();

			date = date.minus(day, ChronoUnit.DAYS);	
			
			selectVisitSale
			.append("	select to_char(ord_date,'yyyy-mm-dd') ord_date, count(*) cnt		     ")
			.append("	from uorder																 ")
			.append("   where to_char(ord_date,'yyyy-mm-dd') = ? and dlvy_pro not in ('R0','RF') ")
			.append("	group by to_char(ord_date,'yyyy-mm-dd')									 ");
			
			pstmt = con.prepareStatement(selectVisitSale.toString()); 
			pstmt.setString(1, date.toString());
			
			rs = pstmt.executeQuery();
			
			cnt = rs.next() ? rs.getInt("cnt") : 0;
			
			selectVisitSale.setLength(0);
			rs.close();
			pstmt.close();

		} finally {
			db.dbClose(rs, pstmt, con);
		}

		return cnt;
	}

	/**
	 * 일일 요약 - 주문 수
	 * 
	 * @return
	 * @throws SQLException
	 */
	public int selectSummaryOrder(int day) throws SQLException {
		int cnt = 0;

		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = db.getConn("jdbc/dbcp");
			LocalDate date = LocalDate.now();
			StringBuilder selectDailySummary = new StringBuilder();
			
			date = date.minus(day, ChronoUnit.DAYS);
			
			selectDailySummary
			.append("	select to_char(ord_date, 'yyyy-mm-dd') ord_date, count(*) cnt					")
			.append("	from order_detail o, uorder u, goods g											")
			.append("	where o.ordno = u.ordno and o.gcode = g.gcode and dlvy_pro not in ('R0','RF') 	")
			.append("   and to_char(ord_date, 'yyyy-mm-dd') = ?											")
			.append("	group by to_char(ord_date, 'yyyy-mm-dd')										");
			
			pstmt = con.prepareStatement(selectDailySummary.toString());
			pstmt.setString(1, date.toString());
			rs = pstmt.executeQuery();
			
			cnt = rs.next() ? rs.getInt("cnt") : 0;

		} finally {
			db.dbClose(rs, pstmt, con);
		}

		return cnt;
	}
	
	/**
	 * 일일 요약 - 매출
	 * @param day
	 * @return
	 * @throws SQLException
	 */
	public int selectSummarySale(int day) throws SQLException {
		int sales = 0;

		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = db.getConn("jdbc/dbcp");
			LocalDate date = LocalDate.now();
			StringBuilder selectDailySummary = new StringBuilder();
			
			date = date.minus(day, ChronoUnit.DAYS);
			
			selectDailySummary
			.append("	select to_char(ord_date, 'yyyy-mm-dd') ord_date, sum(price * amount) sales		")
			.append("	from order_detail o, uorder u, goods g											")
			.append("	where o.ordno = u.ordno and o.gcode = g.gcode and dlvy_pro not in ('R0','RF') 	")
			.append("   and to_char(ord_date, 'yyyy-mm-dd') = ?											")
			.append("	group by to_char(ord_date, 'yyyy-mm-dd')										");
			
			pstmt = con.prepareStatement(selectDailySummary.toString());
			pstmt.setString(1, date.toString());
			rs = pstmt.executeQuery();
			
			sales = rs.next() ? rs.getInt("sales") : 0;
		} finally {
			db.dbClose(rs, pstmt, con);
		}

		return sales;
	}
	
	/**
	 * 일일 요약 - 가입
	 * @param day
	 * @return
	 * @throws SQLException
	 */
	public int selectSummarySign(int day) throws SQLException {
		int cnt = 0;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			LocalDate date = LocalDate.now();
			StringBuilder selectDailySummary = new StringBuilder();
			
			date = date.minus(day, ChronoUnit.DAYS);
			
			selectDailySummary
			.append("	select to_char(sign_date, 'yyyy-mm-dd') sign_date, count(*) cnt	")
			.append("	from member														")
			.append("	where to_char(sign_date, 'yyyy-mm-dd') = ?						")
			.append("	group by to_char(sign_date, 'yyyy-mm-dd')						");
			
			pstmt = con.prepareStatement(selectDailySummary.toString());
			pstmt.setString(1, date.toString());
			rs = pstmt.executeQuery();
			
			cnt = rs.next() ? rs.getInt("cnt") : 0;
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return cnt;
	}
	
	/**
	 * 분기 - 주문
	 * @param quarter 분기
	 * @return 분기별 주문 수
	 * @throws SQLException
	 */
	public int selectQuarterOrder(int quarter) throws SQLException {
		int cnt = 0;
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectQuarter = new StringBuilder();
			selectQuarter
			.append("	select cnt																		")
			.append("	from(select ceil(to_char(ord_date,'mm')/3) quarter, count(*) cnt				")
			.append("	from order_detail o, uorder u, goods g											")
			.append("	where o.ordno = u.ordno and o.gcode = g.gcode and dlvy_pro not in ('R0','RF')	")
			.append("   group by ceil(to_char(ord_date,'mm')/3))										")
			.append("	where quarter = ?																");
			
			pstmt = con.prepareStatement(selectQuarter.toString());
			pstmt.setInt(1, quarter);
			rs = pstmt.executeQuery();
			
			cnt = rs.next() ? rs.getInt("cnt") : 0;
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return cnt;
	}
	
	/**
	 * 분기 - 매출
	 * @param quarter 분기
	 * @return 분기별 매출 금액
	 * @throws SQLException
	 */
	public int selectQuarterSale(int quarter) throws SQLException {
		int sales = 0;
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectQuarter = new StringBuilder();
			selectQuarter
			.append("	select sales																	")
			.append("	from(select ceil(to_char(ord_date,'mm')/3) quarter, sum(price * amount) sales	")
			.append("	from order_detail o, uorder u, goods g											")
			.append("	where o.ordno = u.ordno and o.gcode = g.gcode and dlvy_pro not in ('R0','RF')	")
			.append("   group by ceil(to_char(ord_date,'mm')/3))										")
			.append("	where quarter = ?																");
			
			pstmt = con.prepareStatement(selectQuarter.toString());
			pstmt.setInt(1, quarter);
			rs = pstmt.executeQuery();
			
			sales = rs.next() ? rs.getInt("sales") : 0;
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return sales;
	}
	
	/**
	 * 분기 - 가입
	 * @param quarter 분기
	 * @return 분기별 방문자 수
	 * @throws SQLException
	 */
	public int selectQuarterSign(int quarter) throws SQLException {
		int cnt = 0;
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectQuarter = new StringBuilder();
			selectQuarter
			.append("	select cnt															")
			.append("	from(select ceil(to_char(sign_date,'mm')/3) quarter, count(*) cnt	")
			.append("	from member															")
			.append("	group by ceil(to_char(sign_date,'mm')/3))							")
			.append("   where quarter = ?													");
			
			pstmt = con.prepareStatement(selectQuarter.toString());
			pstmt.setInt(1, quarter);
			rs = pstmt.executeQuery();
			
			cnt = rs.next() ? rs.getInt("cnt") : 0;
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return cnt;
	}
	
	/**
	 * 분기 - 방문
	 * @param quarter 분기
	 * @return 분기별 가입자 수
	 * @throws SQLException
	 */
	public int selectQuarterVisit(int quarter) throws SQLException {
		int cnt = 0;
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectQuarter = new StringBuilder();
			selectQuarter
			.append("	select cnt															")
			.append("	from(select ceil(to_char(daydate,'mm')/3) quarter, count(*) cnt		")
			.append("	from visit															")
			.append("	group by ceil(to_char(daydate,'mm')/3))								")
			.append("   where quarter = ?													");
			
			pstmt = con.prepareStatement(selectQuarter.toString());
			pstmt.setInt(1, quarter);
			rs = pstmt.executeQuery();
			
			cnt = rs.next() ? rs.getInt("cnt") : 0;
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return cnt;
	}
	

}
