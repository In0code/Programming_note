package admin.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.vo.BoardManageVO;
import admin.vo.BoardRangeVO;
import admin.vo.ProductManageVO;
import common.dao.DbConnection;

public class ProductDAO {
	private static ProductDAO pDAO;
	
	private ProductDAO() {
		
	}
	
	public static ProductDAO getInstance() {
		if(pDAO==null) {
			pDAO=new ProductDAO();
		}
		return pDAO;
	}
	
	public int totalCount(BoardRangeVO brVO) throws SQLException{
		int totalCount = 0;
		String keyword = brVO.getKeyword();
		DbConnection db = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=db.getConn("jdbc/dbcp");
			
			StringBuilder selectCnt = new StringBuilder();
			selectCnt.append(" select count(*) cnt from goods g, category c where g.cat_code = c.cat_code ");
			
			if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
				String field = "gname";
				if("2".equals(brVO.getField())) {
					field = "gcode";
				}
				if("3".equals(brVO.getField())) {
					field = "cat_name";
				}
				
				selectCnt.append(" and ").append(field).append(" like '%'||?||'%'	");
			}
			
			pstmt=con.prepareStatement(selectCnt.toString());
			
			if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword()) && !"null".equals(brVO.getKeyword())) {
				pstmt.setString(1, brVO.getKeyword());
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalCount = rs.getInt("cnt");
			}
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		return totalCount;
	}
	
	public List<ProductManageVO> selectAllProduct(BoardRangeVO brVO)throws SQLException {
		List<ProductManageVO> list = new ArrayList<ProductManageVO>();
		String keyword = brVO.getKeyword();
		
		DbConnection db = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		try{
			con= db.getConn("jdbc/dbcp");
			StringBuilder selectAllProduct = new StringBuilder();
			//쿼리문 작성해야됨.
			selectAllProduct
			.append(" select rn, main_img, gcode, gname, cat_name, input_date, price, quantity, cancle    ")
			.append(" from(select row_number() over(order by input_date desc) rn, main_img, gcode, gname, ")
			.append(" cat_name, input_date, price, quantity, cancle	from goods g, category c			  ")
			.append(" where g.cat_code = c.cat_code													  	  ");
			
			
			if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
				String field = "gname";
				if("2".equals(brVO.getField())) {
					field = "gcode";
				}
				if("3".equals(brVO.getField())) {
					field = "cat_name";
				}
				
				selectAllProduct.append("and ").append(field).append(" like '%'||?||'%'	");
			}
			
			selectAllProduct.append(" ) where rn between ? and ?	");
			pstmt=con.prepareStatement(selectAllProduct.toString());
			
			int bindCnt = 1;
			
			if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
				pstmt.setString(bindCnt++, keyword);
			}
			
			pstmt.setInt(bindCnt++, brVO.getStartNum());
			pstmt.setInt(bindCnt++, brVO.getEndNum());
			
			rs=pstmt.executeQuery();
			
			ProductManageVO pVO = null;
			while(rs.next()) {
				pVO = new ProductManageVO(rs.getString("main_img"), rs.getString("gcode"),
										  rs.getString("gname"), rs.getString("cat_name"),
										  rs.getString("input_date"), rs.getString("cancle"),
										  rs.getInt("price"), rs.getInt("quantity"));
				list.add(pVO);
			}
		
			/* BufferedReader br = null;
			StringBuilder info= new StringBuilder();
			
				 
				 try {
					 Clob clob= rs.getClob("TMI");
					 
					 
					 if(clob!=null) {
						 
						 br = new BufferedReader(rs.getClob("TMI").getCharacterStream());//CLOB 이용
						 
						 String temp="";
					while((temp=br.readLine())!=null) {
						 info.append(temp);
					 }//end while
					
					if(br!=null) {
						br.close();
					}
					 }//end if
				} catch (IOException e) {
					e.printStackTrace();
				}//end  catch
				// pVO.setTmi(info.toString());
			}//end if*/
				
		}finally {
			db.dbClose(rs, pstmt, con);
			
		}
		
		return list;
	}
}
