package kr.co.sist.user.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;

import kr.co.sist.user.dao.ProductDAO;
import kr.co.sist.user.domain.MySalesDomain;
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
    }//getInstance

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
    
    public String getPcode(String id) {
    	String getRecentPcode="";
    	try {
    		getRecentPcode=pDAO.getPcode(id);
    	} catch (PersistenceException pe) {
    		pe.printStackTrace();
    	}//end catch
    	return getRecentPcode;
    }//getPcode
    
    
    public ProductDomain searchProduct(ProductVO pVO) {
    	ProductDomain search = null;
    	try {
    		search = pDAO.selectProduct(pVO);
    	} catch (PersistenceException pe) {
    		pe.printStackTrace();
        }//end catch
        return search;
    }//searchProduct

    public int editProduct(ProductVO pVO) {
    	int editCnt= 0;
		try {
			editCnt=pDAO.updateProduct(pVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return editCnt;
    }//editProduct

    public JSONObject editSaleok(String pcode) {
        JSONObject editSaleJsonObj = new JSONObject();
        editSaleJsonObj.put("resultData", false);
        try {
            int updateCnt = pDAO.updateSaleok(pcode);
            editSaleJsonObj.put("resultData", true);
        } catch (PersistenceException pe) {
            pe.printStackTrace();
            editSaleJsonObj.put("error", pe.getMessage()); // 예외 메시지 추가
        }//end catch
        return editSaleJsonObj;
    }//editSaleok

    public JSONObject cancelProduct(String pcode) {
        JSONObject deletejsonObj = new JSONObject();
        deletejsonObj.put("resultData", false);
        try {
            int deleteCnt = pDAO.deleteProduct(pcode);
            deletejsonObj.put("resultData", true);
        } catch (PersistenceException pe) {
            pe.printStackTrace();
            deletejsonObj.put("error", pe.getMessage()); // 예외 메시지 추가
        }//end catch
        return deletejsonObj;
    }//cancelProduct
    

	public List<MySalesDomain> searchBuyerAllInfo(String seller){
		 List<MySalesDomain> searchAllInfo=null;
		 try {
			 searchAllInfo = pDAO.selectBuyerAllInfo(seller);
			}catch(PersistenceException pe) {
				pe.printStackTrace();
			}//end catch
			return searchAllInfo;
	}//searchBuyerAllInfo

}//class
