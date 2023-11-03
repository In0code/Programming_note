package user.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.dao.DbConnection;
import user.vo.GoodsVO;

public class GoodsDAO {
	
	private static GoodsDAO pDAO;
	
	private GoodsDAO() {
		
	}
	
	public static GoodsDAO getInstantce() {
		if(pDAO == null) {
			pDAO = new GoodsDAO();
		}
		return pDAO;
	}
	
	/**
	 * 상품 전체 목록
	 * @return
	 * @throws SQLException
	 */
	public List<GoodsVO> selectAllProducts() throws SQLException{
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		
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
			
			GoodsVO pVO = null;
			while(rs.next()) {
				pVO = new GoodsVO(rs.getString("gcode"), rs.getString("gname"),
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
	public List<GoodsVO> selectCateProducts(String cat_code) throws SQLException{
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		
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
			
			GoodsVO pVO = null;
			while(rs.next()) {
				pVO = new GoodsVO(rs.getString("gcode"), rs.getString("gname"),
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
	
	public List<GoodsVO> selectKeywordProducts(String keyword) throws SQLException{
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectKeywordPro = new StringBuilder();
			selectKeywordPro
			.append("	select gcode, gname, c.cat_code, cat_name, main_img, img1, price, quantity	")
			.append("	from goods g, category c 													")
			.append("	where cancle != 'Y' and g.cat_code = c.cat_code and 						")
			.append("   (g.gname like upper('%'||?||'%') or g.gname like lower('%'||?||'%'))        ")
			.append("   order by gcode desc															");
			
			pstmt = con.prepareStatement(selectKeywordPro.toString());
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			
			rs = pstmt.executeQuery();
			
			GoodsVO pVO = null;
			while(rs.next()) {
				pVO = new GoodsVO(rs.getString("gcode"), rs.getString("gname"),
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
	
	public int selectKeywordCnt(String keyword) throws SQLException{
		int cnt = 0;
		
		DbConnection db = DbConnection.getInstance();
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectCnt = new StringBuilder();
			selectCnt
			.append("	select count(*) cnt								 ")
			.append("	from(select gcode from goods g 					 ")
			.append("	where cancle != 'Y' and (g.gname like upper('%'||?||'%') or g.gname like lower('%'||?||'%')))");
			
			pstmt = con.prepareStatement(selectCnt.toString());
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			
			rs = pstmt.executeQuery();
			
			cnt = rs.next() ? rs.getInt("cnt") : 0;
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return cnt;
	}
	
	/**
	 * 상품 디테일
	 * @param gcode 상품코드
	 * @return 클릭한 상품 디테일 정보
	 * @throws SQLException
	 */
	public GoodsVO selectProductDetail(String gcode) throws SQLException {
		GoodsVO gVO = null;
		
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn("jdbc/dbcp");
			
			StringBuilder selectProDetail = new StringBuilder();
			selectProDetail
			.append("	select gcode, gname, main_img, img1, img2, img3, tmi, price, ")
			.append("	quantity, eng_tmi, top, heart, base, ing, detail_img	   	 ")
			.append("	from goods	where gcode = ?									 ");
			
			pstmt = con.prepareStatement(selectProDetail.toString());
			pstmt.setString(1, gcode);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				BufferedReader br = null;
				StringBuilder tmi = new StringBuilder();
				StringBuilder eng_tmi = new StringBuilder();
				
				try {
					Clob clobTmi = rs.getClob("tmi");
					Clob clobEngTmi = rs.getClob("eng_tmi");
					
					if(clobTmi != null) {
						br = new BufferedReader(rs.getClob("tmi").getCharacterStream());
						String temp = "";
						while((temp = br.readLine()) != null) {
							tmi.append(temp);
						}
						if(br != null) br.close();
					}
					
					if(clobEngTmi != null) {
						br = new BufferedReader(rs.getClob("eng_tmi").getCharacterStream());
						String temp = "";
						while((temp = br.readLine()) != null) {
							eng_tmi.append(temp);
						}
						if(br != null) br.close();
					}
				}catch(IOException ie) {
					ie.printStackTrace();
				}
				
				gVO = new GoodsVO(rs.getString("gcode"), rs.getString("gname"), rs.getString("main_img"),
						rs.getString("img1"),rs.getString("img2"), rs.getString("img3"), rs.getString("detail_img"),
						rs.getString("top"),rs.getString("heart"), rs.getString("base"),
						rs.getString("ing"), rs.getInt("price"), rs.getInt("quantity")
					);
				gVO.setTmi(tmi.toString());
				gVO.setEng_tmi(eng_tmi.toString());
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
			
		}
		
		return gVO;
	}

}
