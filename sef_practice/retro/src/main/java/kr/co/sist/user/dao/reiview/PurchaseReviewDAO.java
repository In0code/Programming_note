package kr.co.sist.user.dao.reiview;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.MyPurchaseDomain;
import kr.co.sist.user.vo.ReviewVO;

@Component
public class PurchaseReviewDAO {
	
	private String configPath;
	
	private PurchaseReviewDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}
	
	public int insertReview(ReviewVO rVO) throws PersistenceException{
		int cnt = 0;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		cnt = ss.insert("user.purchase.review.insertReiview",rVO);
		
		if(cnt==1) {
			ss.commit();
		}

		mbh.closeHandler(ss);
		
		return cnt;
	}
	
	public MyPurchaseDomain selectPurchaseInfo(String code) throws PersistenceException{
		MyPurchaseDomain mpd = null;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		mpd = ss.selectOne("user.purchase.review.selectPurchaseInfo",code);
		
		mbh.closeHandler(ss);
		
		return mpd;
	}
}
