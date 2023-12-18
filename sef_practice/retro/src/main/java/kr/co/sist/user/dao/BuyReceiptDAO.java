package kr.co.sist.user.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.vo.BuyReceiptVO;

public class BuyReceiptDAO {
	
	private static BuyReceiptDAO BuyRDAO;
	private String configPath;

	private BuyReceiptDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}

	public static BuyReceiptDAO getInstance() {
		if (BuyRDAO == null) {
			BuyRDAO = new BuyReceiptDAO();
		} // end if
		return BuyRDAO;
	}// getInstance


	/**
	 * 판매자 상품 상세에서 판매 상태 변경에서 거래 방법 선택 시 추가
	 * 
	 * @return
	 * @throws PersistenceException
	 */
	public int insertBuyReceipt(BuyReceiptVO BuyRVO) throws PersistenceException {
		int insertCnt = 0;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		try {
			insertCnt = ss.insert("user.buyReceipt.insertBuyReceipt", BuyRVO);
	        if (insertCnt == 1) {
	            ss.commit();
	        } else {
	            ss.rollback();
	        }//end else
	    } finally {
	        mbh.closeHandler(ss);
	    }//finally
		return insertCnt;
	}// insertBuyReceipt
	
	
}//class
