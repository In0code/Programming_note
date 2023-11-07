package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.vo.BoardRangeVO;
import admin.vo.ProductManageVO;
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
	
	
	
//--------------------------------------리뷰 수정, 등록, 삭제------------------------------------------	
	public List<SummaryVO> selectAllReview(String id,BoardRangeVO brVO) throws SQLException {
		
		List<SummaryVO> list = new ArrayList<SummaryVO>();
		
		DbConnection db= DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		
		
		
		try {
			con=db.getConn("jdbc/dbcp");
			
			StringBuilder selectAllReview = new StringBuilder();

			selectAllReview.append("select  name, REV_CONT, star ,  REV_DATE , r_view, rcode ,gname from (select row_number() over(order by rcode desc) rnum , m.name, r.REV_CONT, r.star , to_char(r.rev_date,'yyyy-MM-dd') as REV_DATE , r.r_view, r.rcode ,g.gname  from member m, review r,goods g, category c where m.id=r.id and g.gcode=r.gcode and c.cat_code = g.cat_code and m.id= ? and r.cancle not in ('Y')");
			
			
			
			
			if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword() )&& !"null".equals(brVO.getKeyword())) {
				String field="r.REV_CONT";
			
				if("2".equals(brVO.getField())) {
					field="g.gname";
				}//end if
//				if("2".equals(brVO.getField())) {
//					field="c.cat_name ";
//				}//end if
//				
				selectAllReview.append("and upper(").append(field).append(") like upper('%'||?||'%') ");
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
				sVO.setGname(rs.getString("gname"));
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
	}//selectAllReview
	
	
public SummaryVO selectOneReview(int rcode) throws SQLException {
		
		
		SummaryVO sVO= null;
		
		DbConnection db= DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		
		
		
		try {
			con=db.getConn("jdbc/dbcp");
			
			String selectAllReview = "select distinct r.img , to_char(r.rev_date,'yyyy-MM-dd') as REV_DATE ,m.name, m.id, r.REV_CONT,  r.star, r.rcode, c.cat_name, g.gname from member m, review r, category c, goods g where m.id=r.id and  r.gcode = g.gcode and g.cat_code=c.cat_code   and r.rcode= ? ";

			
			
			pstmt=con.prepareStatement(selectAllReview);
			
			pstmt.setInt(1, rcode);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				sVO= new SummaryVO();
				sVO.setId(rs.getString("id"));
				sVO.setGname(rs.getString("gname"));
				sVO.setCategory(rs.getString("cat_name"));
				sVO.setReviewDate(rs.getString("rev_date"));
				sVO.setImg(rs.getString("img"));
				sVO.setName(rs.getString("name"));
				sVO.setReview(rs.getString("REV_CONT"));
				sVO.setRcode(rs.getInt("rcode"));
				sVO.setStar(rs.getInt("star"));
				
			
			}
		}finally {
			db.dbClose(rs, pstmt, con);
			
		}
		return sVO;
	}//selectOneReview
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
	

}//updateReivew

public void updateReivew3 ( String review,int star,int rcode) throws SQLException {
	
	
	
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
	
	
	
	try {
		con=db.getConn("jdbc/dbcp");
		
		String updateReivew = " update  review set REV_CONT = ? , STAR = ?  where  rcode=? ";
		/*, IMG = ?*/

		
		
		pstmt=con.prepareStatement(updateReivew);
		
		pstmt.setString(1, review);
		pstmt.setInt(2,star);
		/*pstmt.setString(3, sVO.getReview());*/
		
		pstmt.setInt(3, rcode);
		
		int cnt=pstmt.executeUpdate();
		System.out.println(cnt+"건 변경");
		System.out.println(updateReivew+ " / "+review+" / " + star+" / "+ rcode );
		
		
	}finally {
		db.dbClose(null, pstmt, con);
		
	}
	

}//updateReivew3

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



//----------------------------------리뷰 상세----------------------------------------
public List<SummaryVO> selectAllReview2(BoardRangeVO brVO,String gcode) throws SQLException {
	
	List<SummaryVO> list = new ArrayList<SummaryVO>();
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	ResultSet rs= null;
	
	
	
	
	try {
		con=db.getConn("jdbc/dbcp");
		
		StringBuilder selectAllReview2 = new StringBuilder();

		selectAllReview2.append("      select  name, REV_CONT, star ,  REV_DATE , r_view, rcode ,id from  " )
		.append("  ( select row_number() over(order by rcode desc) rnum, m.id, m.name, r.REV_CONT, r.star , to_char(r.rev_date,'yyyy-MM-dd') as REV_DATE , r.r_view, r.rcode ,c.cat_name  ")
		.append("	from member m, review r,goods g, category c where m.id=r.id and g.gcode=r.gcode and c.cat_code = g.cat_code and  r.gcode=? and r.cancle not in ('Y')   ");
				
		 
		
		
		
		
		
if(brVO.getKeyword() != null && !"".equals(brVO.getKeyword() )&& !"null".equals(brVO.getKeyword())) {
		String field="m.id";
		if("1".equals(brVO.getField())) {
			field="m.id";
		}//end if
		if("2".equals(brVO.getField())) {
			field="r.rev_cont";
		}//end if
		
		
		selectAllReview2.append("and upper(").append(field).append(") like upper('%'||?||'%') ");
	}//end if

selectAllReview2.append(") 	where rnum between ? and ?		order by rev_date desc			");
		
		pstmt=con.prepareStatement(selectAllReview2.toString());
	//5. 바인드 변수 값 설정
		int bindCnt=1;
		pstmt.setString(bindCnt++, gcode);
		// pstmt.setString(bindCnt++, id);
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
			sVO.setId(rs.getString("id"));
			sVO.setReview(rs.getString("REV_CONT"));
			sVO.setReviewDate(rs.getString("REV_DATE"));
			sVO.setView(rs.getInt("r_view"));
			sVO.setStar(rs.getInt("star"));			
			sVO.setRcode(rs.getInt("rcode"));

			list.add(sVO);
		}
	}finally {
		db.dbClose(rs, pstmt, con);
		
	}
	
	return list;
}//selectAllReview2








//--------------------------------------------리뷰 작성----------------------------------------------
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
}//selectproductImg




public int selectSeqRcode()throws SQLException {
	int seqRcode=0;
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	ResultSet rs= null;
	
	
	try {
		con=db.getConn("jdbc/dbcp");
		
		String selectSeqRcode = " select rcode_seq.nextval as SEQRCODE from dual ";
		
		pstmt=con.prepareStatement(selectSeqRcode);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			seqRcode=rs.getInt("SEQRCODE");
		}

	}finally {
		db.dbClose(rs, pstmt, con);
		
	}
	
	
	return seqRcode;
}//selectSeqRcode




public void insertImg(String fileName,String gcode, int SeqRcode,String id)throws SQLException {
	
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
try {
		
		con=db.getConn("jdbc/dbcp");
		
		String insertReview = " insert into review (gcode, img , id, rcode,cancle) values (?, ? ,?,?,'Y') ";

		
		
		pstmt=con.prepareStatement(insertReview);
		
		pstmt.setString(1, gcode);
		pstmt.setString(2, fileName);
		pstmt.setString(3, id);
		pstmt.setInt(4, SeqRcode);
		
		pstmt.executeQuery();
		
		
	}finally {
		db.dbClose(null, pstmt, con);
		
	}
	
}//insertImg

public void updateReivew2 ( String review,int star,int rcode) throws SQLException {
	
	
	
	
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
	
	
	
	try {
		con=db.getConn("jdbc/dbcp");
		
		String updateReivew2 = " update  review set REV_CONT = ? , STAR = ? ,CANCLE='N' where  rcode=? ";
		/*, IMG = ?*/

		
		
		pstmt=con.prepareStatement(updateReivew2);
		
		pstmt.setString(1, review);
		pstmt.setInt(2,star);
		
		pstmt.setInt(3, rcode);
		
		int cnt=pstmt.executeUpdate();
		System.out.println(cnt+"건 변경");
		System.out.println(updateReivew2+ "2 / "+review+" / " + star+" / "+ rcode );
		
		
	}finally {
		db.dbClose(null, pstmt, con);
		
	}
	

}//updateReivew

public void insertNoImgReview(String gcode, String review, String id, int rcode, int star )throws SQLException {
	DbConnection db= DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt=null;
	
try {
		
		con=db.getConn("jdbc/dbcp");
		
		String insertReview = " insert into review (gcode, rev_cont  ,  rev_date, id, rcode, star ,cancle) values (?, ?, sysdate ,?,?,?,'N') ";

		
		
		pstmt=con.prepareStatement(insertReview);
		
		pstmt.setString(1, gcode);
		pstmt.setString(2, review);
		pstmt.setString(3, id);
		pstmt.setInt(4, rcode);
		pstmt.setInt(5, star);

		pstmt.executeQuery();
		
		
	}finally {
		db.dbClose(null, pstmt, con);
		
	}
	System.out.println("insert"+review+rcode+id+star+gcode);
}

//-----------------------totalcount--------------------//
public int postingTotalCount(BoardRangeVO brVO,String id) throws SQLException{
	int totalCnt = 1;
	String keyword = brVO.getKeyword();
	
	DbConnection db = DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		con = db.getConn("jdbc/dbcp");

		StringBuilder selectCount = new StringBuilder();
		selectCount
		.append("	select count(*) CNT		")
		.append("	from review r , goods g , category c, member m	")
		.append("	 where m.id=r.id and g.gcode=r.gcode and c.cat_code=g.cat_code and r.CANCLE not in  ('Y') and m.id=?	");
		
		
		
		if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
			String field="r.rev_cont";

			if("2".equals(brVO.getField())) {
				field="c.cat_name";
			}//end if
			
			selectCount.append(" and ").append(field).append(" like '%'||?||'%'");					
		}//end if
		
		pstmt = con.prepareStatement(selectCount.toString());
		int bindCnt=1;
		 pstmt.setString(bindCnt++, id);
		if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
			pstmt.setString(2, keyword);
		}//end if
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			totalCnt = rs.getInt("CNT");
		}//end if
	} finally {
		db.dbClose(rs, pstmt, con);
	}//end finally
	System.out.println(totalCnt);
	return totalCnt;
}//postingTotalCount
	
public int productReviewTotalCount(BoardRangeVO brVO,String gcode) throws SQLException{
	int totalCnt = 1;
	String keyword = brVO.getKeyword();
	
	DbConnection db = DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		con = db.getConn("jdbc/dbcp");

		StringBuilder selectCount = new StringBuilder();
		selectCount
		.append("	select count(*) CNT		")
		.append("	from review r , goods g , member m 	")
		.append("	 where m.id=r.id and g.gcode=r.gcode and r.CANCLE not in  ('Y') and g.gcode=?	");
		
		
		if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
			String field="m.id";
			if("2".equals(brVO.getField())) {
				field="r.rev_cont";
			}//end if
			selectCount.append(" and ").append(field).append(" like '%'||?||'%'");					
		}//end if
		
		pstmt = con.prepareStatement(selectCount.toString());
		int bindCnt=1;
		 pstmt.setString(bindCnt++, gcode);
		if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)) {
			pstmt.setString(2, keyword);
		}//end if
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			totalCnt = rs.getInt("CNT");
		}//end if
	} finally {
		db.dbClose(rs, pstmt, con);
	}//end finally
	System.out.println(totalCnt);
	return totalCnt;
}//reviewTotalCount	


public int updateView(int rcode) throws SQLException {
	int cnt = 0;
	DbConnection db = DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	
	try {
		con = db.getConn("jdbc/dbcp");
		
		pstmt = con.prepareStatement(" update review set r_view = r_view + 1 where rcode = ? ");
		
		pstmt.setInt(1, rcode);
		
		cnt = pstmt.executeUpdate();
		
	}finally {
		db.dbClose(null, pstmt, con);
	}
	
	return cnt;
}


}
