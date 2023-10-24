package productManage.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import productManage.vo.ProductManageVO;
import shopping.dao.DbConnection;

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
	
	public ProductManageVO selectAllProduct (String id)throws SQLException {
		ProductManageVO pVO = null;
		DbConnection db = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		try{
			con= db.getConn("jdbc/dbcp");
			StringBuilder selectAllProduct = new StringBuilder();
			//쿼리문 작성해야됨.
			selectAllProduct.append(" select  ").append(" from ").append(" where ");
			
			pstmt=con.prepareStatement(selectAllProduct.toString());
			
			pstmt.setString(1,id);
			
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				pVO = new ProductManageVO();
				pVO.setImg1(rs.getString("IMG1"));
				pVO.setImg1(rs.getString("IMG1"));
				pVO.setImg2(rs.getString("IMG2"));
				pVO.setImg3(rs.getString("IMG3"));
				pVO.setGoodsCode(rs.getString("GCODE"));
				pVO.setGoodsName(rs.getString( "GNAME"));
				pVO.setCategoryName(rs.getString("CAT_NAME"));
				pVO.setInputDate(rs.getString("INPUT_DATE"));
				
				
				BufferedReader br = null;
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
				}//end if
			
		}finally {
			db.dbClose(rs, pstmt, con);
			
		}
		
		return pVO;
	}
}
