package kr.co.sist.user.service;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;

import kr.co.sist.user.dao.BuyReceiptDAO;
import kr.co.sist.user.vo.BuyReceiptVO;

public class BuyReceiptService {

	    private BuyReceiptDAO BuyRDAO = BuyReceiptDAO.getInstance();
	    private static BuyReceiptService ws;

	    private BuyReceiptService() {
	    }

	    public static BuyReceiptService getInstance() {
	        if (ws == null) {
	            ws = new BuyReceiptService();
	        }
	        return ws;
	    }//getInstance
	    
	    /**
	     * 판매 상태 변경 버튼 클릭 시 거래 방법 선택
	     * @param buyRVO
	     * @return
	     */
	    public JSONObject addBuyReceipt(BuyReceiptVO buyRVO) {
	        JSONObject addjsonObj = new JSONObject();
	        addjsonObj.put("resultData", false);
	        try {
	            int insertCnt = BuyRDAO.insertBuyReceipt(buyRVO);
	            addjsonObj.put("resultData", true);
	        } catch (PersistenceException pe) {
	            pe.printStackTrace();
	            addjsonObj.put("error", pe.getMessage()); // 예외 메시지 추가
	        }//end catch
	        return addjsonObj;
	    }//addBuyReceipt
	    
	    
}//class
