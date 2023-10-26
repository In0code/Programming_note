package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.dao.DbConnection;
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
	
	public List<ClientOrderVO> selectAllOrder(String id) throws SQLException {
		List<ClientOrderVO> list = new ArrayList<ClientOrderVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder selectOrder = new StringBuilder();
			selectOrder
			.append("		")
			.append("		")
			.append("		");
			
		} finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
	
	public List<ClientOrderVO> selectAllRecall(String id) throws SQLException {
		List<ClientOrderVO> list = new ArrayList<ClientOrderVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			StringBuilder selectRecall = new StringBuilder();
			selectRecall
			.append("		")
			.append("		")
			.append("		");
			
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
	
	public DetailInfoVO selectOneRecall(String ordno) throws SQLException {
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
