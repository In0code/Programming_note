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
import user.vo.SummaryVO;

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
//	
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
			.append(" select  rn, main_img, gcode, gname, cat_name, input_date, price, quantity, cancle    ")
			.append(" from(select  row_number() over(order by input_date desc) rn, main_img, gcode, gname, ")
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
			
			selectAllProduct.append(" )  where rn between ").append(brVO.getStartNum()).append(" and ").append(brVO.getEndNum()).append(" order by gcode	");
			pstmt=con.prepareStatement(selectAllProduct.toString());
			
			int bindCnt = 1;
			
			if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
				pstmt.setString(bindCnt++, keyword);
			}
			
//			pstmt.setInt(bindCnt++, brVO.getStartNum());
//			pstmt.setInt(bindCnt++, brVO.getEndNum());
			
			rs=pstmt.executeQuery();
			
			ProductManageVO pVO = null;
			while(rs.next()) {
				pVO = new ProductManageVO(rs.getString("main_img"), rs.getString("gcode"),
										  rs.getString("gname"), rs.getString("cat_name"),
										  rs.getString("input_date"), rs.getString("cancle"),
										  rs.getInt("price"), rs.getInt("quantity"));
				list.add(pVO);
			}
		
		System.out.println(selectAllProduct);
				
		}finally {
			db.dbClose(rs, pstmt, con);
			
		}
		
		return list;
	}//selectAllProduct
	//
public ProductManageVO selectOneProduct(String gcode) throws SQLException {
		
		
	ProductManageVO pVO= null;
		
		DbConnection db= DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		
		
		
		try {
			con=db.getConn("jdbc/dbcp");
			
			String selectAllReview = "select GNAME, MAIN_IMG , IMG1, IMG2, IMG3, TMI, PRICE, QUANTITY,ENG_TMI,TOP,HEART,BASE,ING,DETAIL_IMG  from GOODS where gcode=? ";

			
			
			pstmt=con.prepareStatement(selectAllReview);
			
			pstmt.setString(1, gcode);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				pVO= new ProductManageVO();
				pVO.setGoodsName(rs.getString("gname")); 
				pVO.setMainImg(rs.getString("MAIN_IMG"));
				pVO.setImg1(rs.getString("IMG1"));
				pVO.setImg2(rs.getString("IMG2"));
				pVO.setImg3(rs.getString("IMG3"));
				pVO.setTmi(rs.getString("TMI"));
				pVO.setPrice(rs.getInt("PRICE"));
				pVO.setQuantity(rs.getInt("QUANTITY"));
				pVO.setEngTmi(rs.getString("ENG_TMI"));
				pVO.setTop(rs.getString("TOP"));
				pVO.setHeart(rs.getString("HEART"));
				pVO.setBase(rs.getString("BASE"));
				pVO.setIng(rs.getString("ING"));
				pVO.setDetailImg(rs.getString("DETAIL_IMG"));
				
				
			
			}
		}finally {
			db.dbClose(rs, pstmt, con);
			
		}
		return pVO;
	}//selectOneProduct

//public void updateImg (String gcode,String mainImg, String img1 , String img2, String img3, String detailImg) throws SQLException {
//	
//	
//	
//	
//	DbConnection db= DbConnection.getInstance();
//	Connection con = null;
//	PreparedStatement pstmt=null;
//	
//	
//	
//	
//	
//	try {
//		con=db.getConn("jdbc/dbcp");
//		
//		String deleteReivew = " update goods set main_img = ? , img1=? , img2=? , img3=? , detail_img=? where gcode=? ";
//
//		
//		
//		pstmt=con.prepareStatement(deleteReivew);
//		
//		pstmt.setString(1, mainImg);
//		pstmt.setString(2, img1);
//		pstmt.setString(3, img2);
//		pstmt.setString(4, img3);
//		pstmt.setString(5, detailImg);
//		pstmt.setString(6, gcode);
//		
//		int cnt=pstmt.executeUpdate();
//		System.out.println(cnt+"건 변경되었습니다.");
//	
//	}finally {
//		db.dbClose(null, pstmt, con);
//		
//	}
	
//}

//--------------------------------------이미지 수정-------------------------------------
public void updateMainImg (String gcode,String mainImg) throws SQLException {
	
	
	
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
	
	
	
	
	try {
		con=db.getConn("jdbc/dbcp");
		
		String updateMainImg = " update goods set main_img = ?  where gcode=? ";

		
		
		pstmt=con.prepareStatement(updateMainImg);
		
		pstmt.setString(1, mainImg);
		
		pstmt.setString(2, gcode);
		
		int cnt=pstmt.executeUpdate();
		System.out.println("mainImg"+cnt+"건 변경되었습니다.");
	
	}finally {
		db.dbClose(null, pstmt, con);
		
	}
	

}//updateMainImg
public void updateImg1 (String gcode,String Img1) throws SQLException {
	
	
	
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
	
	
	
	
	try {
		con=db.getConn("jdbc/dbcp");
		
		String updateImg1 = " update goods set img1 = ?  where gcode=? ";

		
		
		pstmt=con.prepareStatement(updateImg1);
		
		pstmt.setString(1, Img1);
		
		pstmt.setString(2, gcode);
		
		int cnt=pstmt.executeUpdate();
		System.out.println("img1"+cnt+"건 변경되었습니다.");
	
	}finally {
		db.dbClose(null, pstmt, con);
		
	}
	

}//updateImg1

public void updateImg2 (String gcode,String Img2) throws SQLException {
	
	
	
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
	
	
	
	
	try {
		con=db.getConn("jdbc/dbcp");
		
		String updateImg2 = " update goods set img2 = ?  where gcode=? ";

		
		
		pstmt=con.prepareStatement(updateImg2);
		
		pstmt.setString(1, Img2);
		
		pstmt.setString(2, gcode);
		
		int cnt=pstmt.executeUpdate();
		System.out.println("img2"+cnt+"건 변경되었습니다.");
	
	}finally {
		db.dbClose(null, pstmt, con);
		
	}
	

}//updateImg2

public void updateImg3 (String gcode,String Img3) throws SQLException {
	
	
	
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
	
	
	
	
	try {
		con=db.getConn("jdbc/dbcp");
		
		String updateImg3 = " update goods set img3 = ?  where gcode=? ";

		
		
		pstmt=con.prepareStatement(updateImg3);
		
		pstmt.setString(1, Img3);
		
		pstmt.setString(2, gcode);
		
		int cnt=pstmt.executeUpdate();
		System.out.println("img3"+cnt+"건 변경되었습니다.");
	
	}finally {
		db.dbClose(null, pstmt, con);
		
	}
	

}//updateImg3

public void updateDetail (String gcode,String detailImg) throws SQLException {
	
	
	
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
	
	
	
	
	try {
		con=db.getConn("jdbc/dbcp");
		
		String updateDetail = " update goods set detail_img = ?  where gcode=? ";

		
		
		pstmt=con.prepareStatement(updateDetail);
		
		pstmt.setString(1, detailImg);
		
		pstmt.setString(2, gcode);
		
		int cnt=pstmt.executeUpdate();
		System.out.println("img3"+cnt+"건 변경되었습니다.");
	
	}finally {
		db.dbClose(null, pstmt, con);
		
	}
	

}//updateDetail

///-------------------------------상품 수정---------------------------------

public void updateInfo (String gcode,ProductManageVO pVO) throws SQLException {
	
	
	
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
	
	
	
	
	try {
		con=db.getConn("jdbc/dbcp");
		
		String updateInfo = " update goods set GCODE = ? , GNAME=? , TMI=? , ENG_TMI=? , PRICE=?, QUANTITY=?, top= ? , heart=? , base=?, ing=? where gcode=? ";

		
		
		pstmt=con.prepareStatement(updateInfo);
		
		
		pstmt.setString(1, pVO.getGoodsCode());
		pstmt.setString(2, pVO.getGoodsName());
		pstmt.setString(3, pVO.getTmi());
		pstmt.setString(4, pVO.getEngTmi());
		pstmt.setInt(5, pVO.getPrice());
		pstmt.setInt(6, pVO.getQuantity());
		pstmt.setString(7, pVO.getTop());
		pstmt.setString(8, pVO.getHeart());
		pstmt.setString(9, pVO.getBase());
		pstmt.setString(10, pVO.getIng());
		
		pstmt.setString(11, gcode);
		
		int cnt=pstmt.executeUpdate();
		System.out.println("info"+cnt+"건 변경되었습니다.");
	
	}finally {
		db.dbClose(null, pstmt, con);
		
	}


}

public void updateCancle (String gcode) throws SQLException {
	
	
	
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
	
	
	
	
	try {
		con=db.getConn("jdbc/dbcp");
		
		String updateCancle = " update goods set CANCLE = 'Y' where gcode=? ";

		
		
		pstmt=con.prepareStatement(updateCancle);
		
		

		
		pstmt.setString(1, gcode);
		
		int cnt=pstmt.executeUpdate();
		System.out.println(cnt+"건 변경되었습니다.");
	
	}finally {
		db.dbClose(null, pstmt, con);
		
	}


}//updateCancle//

public void insertinfo(ProductManageVO pVO)throws SQLException {
	
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
try {
		
		con=db.getConn("jdbc/dbcp");
		
		String insertReview = "insert into goods (GCODE, GNAME, CANCLE, MAIN_IMG, IMG1, IMG2, IMG3, TMI, PRICE, QUANTITY, INPUT_DATE, CAT_CODE, ENG_TMI, TOP, HEART, BASE, ING, DETAIL_IMG)  values(?,?,'Y',?,?,?,?,?,?,?,sysdate,?,?,?,?,?,?,?) ";

		
		
		pstmt=con.prepareStatement(insertReview);
		
		pstmt.setString(1, pVO.getGoodsCode());
		pstmt.setString(2, pVO.getGoodsName());
		pstmt.setString(3, pVO.getMainImg());
		pstmt.setString(4, pVO.getImg1());
		pstmt.setString(5, pVO.getImg2());
		pstmt.setString(6, pVO.getImg3());
		pstmt.setString(7, pVO.getTmi());
		pstmt.setInt(8, pVO.getPrice());
		pstmt.setInt(9,pVO.getQuantity() );
		pstmt.setString(10, pVO.getCategoryCode());
		pstmt.setString(11, pVO.getEngTmi());
		pstmt.setString(12, pVO.getTop());
		pstmt.setString(13, pVO.getHeart());
		pstmt.setString(14, pVO.getBase());
		pstmt.setString(15, pVO.getIng());
		pstmt.setString(16, pVO.getDetailImg());
		
		pstmt.executeQuery();
		
		
	}finally {
		db.dbClose(null, pstmt, con);
		
	}
	
}//insertImg//




}
