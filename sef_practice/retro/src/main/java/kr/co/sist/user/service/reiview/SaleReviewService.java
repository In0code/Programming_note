package kr.co.sist.user.service.reiview;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.reiview.SalesReviewDAO;
import kr.co.sist.user.domain.MySalesDomain;
import kr.co.sist.user.vo.ReviewVO;

@Service
public class SaleReviewService {
	   private SalesReviewDAO srDAO = SalesReviewDAO.getInstance();
	    private static SaleReviewService srs;

	    private SaleReviewService() {

	    }

	    public static SaleReviewService getInstance() {
	        if (srs == null) {
	        	srs = new SaleReviewService();
	        }
	        return srs;
	    }//getInstance

	
	public int addSaleReview(ReviewVO rVO) {
		int cnt = 0;
		
		try {
			String[] comArr = rVO.getComment2();
			
			if (comArr.length >= 1) rVO.setComment2_1(comArr[0]);
			if (comArr.length >= 2) rVO.setComment2_2(comArr[1]);
			if (comArr.length >= 3) rVO.setComment2_3(comArr[2]);
			if (comArr.length >= 4) rVO.setComment2_4(comArr[3]);
			
			cnt = srDAO.insertSaleReview(rVO);
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//addSaleReview
	
	
	public MySalesDomain searchBuyerInfo(String buyer) {
		MySalesDomain searchInfo = null;
		
		try {
			searchInfo = srDAO.selectBuyerInfo(buyer);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		return searchInfo;
	}//searchBuyerInfo
	
	
}//class
