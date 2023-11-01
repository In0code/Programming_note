package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.dao.DbConnection;
import user.vo.ProductVO;

public class ProductDAO {
	
	private static ProductDAO pDAO;
	
	private ProductDAO() {
		
	}
	
	public static ProductDAO getInstantce() {
		if(pDAO == null) {
			pDAO = new ProductDAO();
		}
		return pDAO;
	}
	
	/**
	 * 상품 전체 목록
	 * @return
	 * @throws SQLException
	 */
	public List<ProductVO> selectAllProducts() throws SQLException{
		List<ProductVO> list = new ArrayList<ProductVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectAllPro = new StringBuilder();
			selectAllPro
			.append("	select gcode, gname, c.cat_code, cat_name, main_img, img1, price, quantity	")
			.append("	from goods g, category c 													")
			.append("	where cancle != 'Y' and g.cat_code = c.cat_code								")
			.append("   order by gcode desc															");
			
			pstmt = con.prepareStatement(selectAllPro.toString());
			
			rs = pstmt.executeQuery();
			
			ProductVO pVO = null;
			while(rs.next()) {
				pVO = new ProductVO(rs.getString("gcode"), rs.getString("gname"),
									rs.getString("cat_code"), rs.getString("cat_name"), 
									rs.getString("main_img"), rs.getString("img1"),
									rs.getInt("price"),  rs.getInt("quantity"));
				list.add(pVO);
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
	
	/**
	 * 카테고리에 해당하는 상품 목록
	 * @param cat_code
	 * @return
	 * @throws SQLException
	 */
	public List<ProductVO> selectCateProducts(String cat_code) throws SQLException{
		List<ProductVO> list = new ArrayList<ProductVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectCatePro = new StringBuilder();
			selectCatePro
			.append("	select gcode, gname, c.cat_code, cat_name, main_img, img1, price, quantity	")
			.append("	from goods g, category c 													")
			.append("	where cancle != 'Y' and g.cat_code = c.cat_code and c.cat_code = '").append(cat_code).append("'")
			.append("   order by gcode desc															");
			
			pstmt = con.prepareStatement(selectCatePro.toString());
			
			rs = pstmt.executeQuery();
			
			ProductVO pVO = null;
			while(rs.next()) {
				pVO = new ProductVO(rs.getString("gcode"), rs.getString("gname"),
									rs.getString("cat_code"), rs.getString("cat_name"),
									rs.getString("main_img"), rs.getString("img1"),
									rs.getInt("price"),  rs.getInt("quantity"));
				list.add(pVO);
			}
			
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}

}
