package kr.co.sist.user.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;

import kr.co.sist.user.dao.ProductDAO;
import kr.co.sist.user.domain.ProductDomain;
import kr.co.sist.user.vo.ProductVO;

public class ProductService {

    private ProductDAO pDAO = ProductDAO.getInstance();
    private static ProductService ps;

    private ProductService() {

    }

    public static ProductService getInstance() {
        if (ps == null) {
            ps = new ProductService();
        }
        return ps;
    }

    /**
     * 상품 등록
     * 
     * @param pVO
     */
    public int addProduct(ProductVO pVO){
		int insertCnt= 0;
		try {
			insertCnt=pDAO.insertProduct(pVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return insertCnt;
	}//searchCategory
    
    public String getPcode() {
    	String getRecentPcode="";
    	try {
    		getRecentPcode=pDAO.getPcode();
    	} catch (PersistenceException pe) {
    		pe.printStackTrace();
    	}
    	return getRecentPcode;
    }
    
    public List<ProductDomain> getCategoryName(String pcode) {
    	List<ProductDomain> getCname=null;
    	try {
    		getCname=pDAO.getCategoryName(pcode);
    	} catch (PersistenceException pe) {
    		pe.printStackTrace();
    	}
    	return getCname;
    }

    public ProductDomain searchProduct(ProductVO pVO) {
        ProductDomain search = null;
        try {
            search = pDAO.selectProduct(pVO);
        } catch (PersistenceException pe) {
            pe.printStackTrace();
        }
        return search;
    }

    public JSONObject editProduct(ProductVO pVO) {
        JSONObject editJsonObj = new JSONObject();
        editJsonObj.put("resultData", false);
        try {
            int updateCnt = pDAO.updateProduct(pVO);
            editJsonObj.put("resultData", true);
        } catch (PersistenceException pe) {
            pe.printStackTrace();
            editJsonObj.put("error", pe.getMessage()); // 예외 메시지 추가
        }
        return editJsonObj;
    }

    public JSONObject editSaleok(String pcode) {
        JSONObject editSaleJsonObj = new JSONObject();
        editSaleJsonObj.put("resultData", false);
        try {
            int updateCnt = pDAO.updateSaleok(pcode);
            editSaleJsonObj.put("resultData", true);
        } catch (PersistenceException pe) {
            pe.printStackTrace();
            editSaleJsonObj.put("error", pe.getMessage()); // 예외 메시지 추가
        }
        return editSaleJsonObj;
    }

    public JSONObject cancelProduct(String pcode) {
        JSONObject deletejsonObj = new JSONObject();
        deletejsonObj.put("resultData", false);
        try {
            int deleteCnt = pDAO.deleteProduct(pcode);
            deletejsonObj.put("resultData", true);
        } catch (PersistenceException pe) {
            pe.printStackTrace();
            deletejsonObj.put("error", pe.getMessage()); // 예외 메시지 추가
        }
        return deletejsonObj;
    }

}
