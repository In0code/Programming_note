package kr.co.sist.user.service.reiview;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.reiview.PurchaseReviewDAO;
import kr.co.sist.user.domain.MyPurchaseDomain;
import kr.co.sist.user.vo.ReviewVO;

@Service
public class PurchaseReviewService {
	
	@Autowired
	private PurchaseReviewDAO pDAO;
	
	public int addReview(ReviewVO rVO) {
		int cnt = 0;
		
		try {
			String[] comArr = rVO.getComment2();
			
			if (comArr.length >= 1) rVO.setComment2_1(comArr[0]);
			if (comArr.length >= 2) rVO.setComment2_2(comArr[1]);
			if (comArr.length >= 3) rVO.setComment2_3(comArr[2]);
			if (comArr.length >= 4) rVO.setComment2_4(comArr[3]);
			
			cnt = pDAO.insertReview(rVO);
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt;
	}
	
	public MyPurchaseDomain searchPurchaseInfo(String code) {
		MyPurchaseDomain mpd = null;
		
		try {
			mpd = pDAO.selectPurchaseInfo(code);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return mpd;
	}

}
