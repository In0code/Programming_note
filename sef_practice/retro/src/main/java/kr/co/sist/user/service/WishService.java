package kr.co.sist.user.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;

import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.user.dao.WishDAO;
import kr.co.sist.user.domain.WishDomain;
import kr.co.sist.user.vo.WishVO;

public class WishService {

	    private WishDAO wDAO = WishDAO.getInstance();
	    private static WishService ws;

	    private WishService() {
	    }

	    public static WishService getInstance() {
	        if (ws == null) {
	            ws = new WishService();
	        }
	        return ws;
	    }//getInstance
	    
	    /**
	     * 찜 리스트 전체 레코드 수 조회
	     * @param brVO
	     * @return
	     */
	    public int searchWishCnt(String id) {
	    	int selectAllCnt = 0;
	    	try {
	    		selectAllCnt = wDAO.selectWishCnt(id);
	    	} catch (PersistenceException pe) {
	    		pe.printStackTrace();
	        }//end catch
	        return selectAllCnt;
	    }//searchWishCnt
	    
	    public JSONObject addWish(WishVO wVO) {
	    	
	        JSONObject addjsonObj = new JSONObject();
	        addjsonObj.put("resultData", false);
	        try {
	            int insertCnt = wDAO.insertWish(wVO);
	            addjsonObj.put("resultData", true);
	        } catch (PersistenceException pe) {
	            pe.printStackTrace();
	            addjsonObj.put("error", pe.getMessage()); // 예외 메시지 추가
	        }//end catch
	        return addjsonObj;
	    }//addWish
	    
	    public int getChkPcode(WishVO wVO) {
	    	int resultPcode=0;
	    	try {
	    		resultPcode = wDAO.getChkPcode(wVO); 
	    	} catch (PersistenceException pe) {
	    		pe.printStackTrace();
	        }//end catch
	        return resultPcode;
	    }//getPcode
	    
	    /**
	     * 찜 리스트 전체 조회
	     * @param brVO
	     * @return
	     */
	    public List<WishDomain> searchWish(BoardRangeVO brVO) {
	    	List<WishDomain> searchWishList = null;
	    	try {
	    		searchWishList = wDAO.selectAllWish(brVO);
	    	} catch (PersistenceException pe) {
	    		pe.printStackTrace();
	        }//end catch
	        return searchWishList;
	    }//searchWish
	    
	    
	    /**
	     * 찜 삭제
	     * @param pcode
	     * @return
	     */
	    public JSONObject cancelWish(String pcode) {
	        JSONObject deletejsonObj = new JSONObject();
	        deletejsonObj.put("resultData", false);
	        try {
	            int deleteCnt = wDAO.deleteWish(pcode);
	            
	            if (deleteCnt == 1) {
	                deletejsonObj.put("resultData", true);
	            } else {
	                deletejsonObj.put("resultData", false);
	            }//end else
	            
	        } catch (PersistenceException pe) {
	            pe.printStackTrace();
	            deletejsonObj.put("error", pe.getMessage()); // 예외 메시지 추가
	        }//end catch
	        return deletejsonObj;
	    }//cancelWish
	    
	    
}//class
