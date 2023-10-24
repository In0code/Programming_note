package clientreview.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import clientreview.vo.ClientReviewVO;
import productManage.vo.ProductManageVO;
import shopping.dao.DbConnection;

public class ClientReviewDAO {

	public ClientReviewVO selectAllReview ()throws SQLException { // 고객리뷰 전체 검색
		ClientReviewVO cVO = null;
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
			
			
			
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				cVO = new ClientReviewVO();
				
				
				
				
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
					 cVO.setTmi(info.toString());
				}//end if
			
		}finally {
			db.dbClose(rs, pstmt, con);
			
		}
		
		return cVO;
	}
	
	public ClientReviewVO selectAllReview (String name , String productName)throws SQLException { // 이름과 상품명으로  검색
		ClientReviewVO cVO = null;
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
			
		//	pstmt.setString(1,tmi );
			
			
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				cVO = new ClientReviewVO();
				
				
				
				
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
					 cVO.setTmi(info.toString());
				}//end if
			
		}finally {
			db.dbClose(rs, pstmt, con);
			
		}
		
		return cVO;
	}

}
