package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.vo.BoardRangeVO;
import admin.vo.ProductManageVO;
import admin.vo.UserReviewVO;
import common.dao.DbConnection;
import user.vo.SummaryVO;

public class UserReviewDAO {
	
	
	private static UserReviewDAO uDAO;
	
	private UserReviewDAO () {
		
	}
	
	public static UserReviewDAO getInstance() {
		if(uDAO==null) {
			uDAO=new UserReviewDAO();
		}
		return uDAO;
	}
	
	
	
	
	public List<SummaryVO> selectAllReview(String id,BoardRangeVO brVO) throws SQLException {
		
		List<SummaryVO> list = new ArrayList<SummaryVO>();
		
		DbConnection db= DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		
		
		
		try {
			con=db.getConn("jdbc/dbcp");
			
			StringBuilder selectAllReview = new StringBuilder();

			selectAllReview.append("select  name, REV_CONT, star ,  REV_DATE , r_view, rcode ,cat_name from (select row_number() over(order by rcode desc) rnum , m.name, r.REV_CONT, r.star , to_char(r.rev_date,'yyyy-MM-dd') as REV_DATE , r.r_view, r.rcode ,c.cat_name  from member m, review r,goods g, category c where m.id=r.id and g.gcode=r.gcode and c.cat_code = g.cat_code and m.id= ? and r.cancle not in ('Y')");
			
			
			
			
			if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword() )&& !"null".equals(brVO.getKeyword())) {
				String field="r.REV_CONT";
				if("1".equals(brVO.getField())) {
					field="r.REV_CONT";
				}//end if
				if("2".equals(brVO.getField())) {
					field="c.cat_name";
				}//end if
//				if("2".equals(brVO.getField())) {
//					field="c.cat_name ";
//				}//end if
//				
				selectAllReview.append("and ").append(field).append(" like '%'||?||'%' ");
			}//end if

			selectAllReview.append(")	where rnum between ? and ?					");
			
			pstmt=con.prepareStatement(selectAllReview.toString());
		//5. 바인드 변수 값 설정
			int bindCnt=1;
			 pstmt.setString(bindCnt++, id);
			if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword() )&& !"null".equals(brVO.getKeyword())) {
			pstmt.setString(bindCnt++, brVO.getKeyword());	
			}//end if
			
			//pstmt.setString(1, id);
			pstmt.setInt(bindCnt++, brVO.getStartNum());
			pstmt.setInt(bindCnt++, brVO.getEndNum());
			
			

			
			
			rs=pstmt.executeQuery();
			SummaryVO sVO= null;
			while(rs.next()) {
				sVO= new SummaryVO();
				sVO.setName(rs.getString("name"));
				sVO.setCategory(rs.getString("cat_name"));
				sVO.setReview(rs.getString("REV_CONT"));
				sVO.setReviewDate(rs.getString("REV_DATE"));
				sVO.setView(rs.getInt("r_view"));
				sVO.setRcode(rs.getInt("rcode"));
				sVO.setStar(rs.getInt("star"));
				list.add(sVO);
			}
		}finally {
			db.dbClose(rs, pstmt, con);
			
		}
		
		return list;
	}
	
public SummaryVO selectOneReview(int rcode) throws SQLException {
		
		
		SummaryVO sVO= null;
		
		DbConnection db= DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		
		
		
		try {
			con=db.getConn("jdbc/dbcp");
			
			String selectAllReview = "select distinct m.name, r.REV_CONT,  r.star, r.rcode from member m, review r, category c where m.id=r.id   and r.rcode= ? ";

			
			
			pstmt=con.prepareStatement(selectAllReview);
			
			pstmt.setInt(1, rcode);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				sVO= new SummaryVO();
				sVO.setName(rs.getString("name"));
				sVO.setReview(rs.getString("REV_CONT"));
				sVO.setRcode(rs.getInt("rcode"));
				sVO.setStar(rs.getInt("star"));
			
			}
		}finally {
			db.dbClose(rs, pstmt, con);
			
		}
		
		return sVO;
	}
/*SummaryVO sVO*/

public void updateReivew ( String review,int star,int rcode,String img) throws SQLException {
	
	
	
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
	
	
	
	try {
		con=db.getConn("jdbc/dbcp");
		
		String updateReivew = " update  review set REV_CONT = ? , STAR = ? ,img=? where  rcode=? ";
		/*, IMG = ?*/

		
		
		pstmt=con.prepareStatement(updateReivew);
		
		pstmt.setString(1, review);
		pstmt.setInt(2,star);
		/*pstmt.setString(3, sVO.getReview());*/
		
		pstmt.setString(3, img);
		pstmt.setInt(4, rcode);
		
		int cnt=pstmt.executeUpdate();
		System.out.println(cnt+"건 변경");
		System.out.println(updateReivew+ " / "+review+" / " + star+" / "+ rcode );
		
		
	}finally {
		db.dbClose(null, pstmt, con);
		
	}
	

}

public void updateCancle (int rcode) throws SQLException {
	
	
	
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
	
	
	
	
	try {
		con=db.getConn("jdbc/dbcp");
		
		String deleteReivew = "update review set CANCLE = 'Y' where rcode=? ";

		
		
		pstmt=con.prepareStatement(deleteReivew);
		
		pstmt.setInt(1, rcode);
		
		int cnt=pstmt.executeUpdate();
		System.out.println(cnt+"건 변경되었습니다.");
	
	}finally {
		db.dbClose(null, pstmt, con);
		
	}
	

}//deleteReivew

	
public ProductManageVO selectproductImg(String gcode) throws SQLException {
	
	
	ProductManageVO pmVO= null;
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	ResultSet rs= null;
	
	
	
	
	try {
		
		con=db.getConn("jdbc/dbcp");
		
		String selectAllReview = " select main_img , gname from goods where gcode=? ";

		
		
		pstmt=con.prepareStatement(selectAllReview);
		
		pstmt.setString(1, gcode);
		
		rs=pstmt.executeQuery();
		if(rs.next()) {
			pmVO= new ProductManageVO();
			pmVO.setMainImg(rs.getString("main_img"));
			pmVO.setGoodsName(rs.getString("GNAME"));
		}
		
	}finally {
		db.dbClose(rs, pstmt, con);
		
	}
	
	return pmVO;
}

public void insertReview(String fileName,String gcode, String id)throws SQLException {
	
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
try {
		
		con=db.getConn("jdbc/dbcp");
		
		String insertReview = " select main_img , gname from goods where gcode=? ";

		
		
		pstmt=con.prepareStatement(insertReview);
		
		pstmt.setString(1, fileName);
		pstmt.setString(2, gcode);
		pstmt.setString(3, id);
		
		pstmt.executeQuery();
		
		
	}finally {
		db.dbClose(null, pstmt, con);
		
	}
}
	
	
}
