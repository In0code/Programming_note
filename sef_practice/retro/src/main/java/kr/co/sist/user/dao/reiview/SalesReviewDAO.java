package kr.co.sist.user.dao.reiview;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.MySalesDomain;
import kr.co.sist.user.vo.ReviewVO;

public class SalesReviewDAO {
	
	private static SalesReviewDAO srDAO;
	private String configPath;

	private SalesReviewDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}

	public static SalesReviewDAO getInstance() {
		if (srDAO == null) {
			srDAO = new SalesReviewDAO();
		} // end if
		return srDAO;
	}// getInstance
	
	public int insertSaleReview(ReviewVO rVO) throws PersistenceException{
		int insertcnt = 0;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		insertcnt = ss.insert("user.sell.review.insertReview",rVO);
		
		if(insertcnt==1) {
			ss.commit();
		}//end if

		mbh.closeHandler(ss);
		
		return insertcnt;
	}//insertSaleReview
	
	public MySalesDomain selectBuyerInfo(String buyer) throws PersistenceException{
		MySalesDomain msd = null;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		msd = ss.selectOne("user.sell.review.selectBuyerInfo",buyer);
		
		mbh.closeHandler(ss);
		
		return msd;
	}//selectSaleInfo
	
	
}//class
