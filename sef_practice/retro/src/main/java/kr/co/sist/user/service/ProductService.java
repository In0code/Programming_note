package kr.co.sist.user.service;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;

import kr.co.sist.user.dao.ProductDAO;
import kr.co.sist.user.domain.ProductDomain;
import kr.co.sist.user.vo.ProductVO;

public class ProductService {

	private ProductDAO pDAO=ProductDAO.getInstance();
	private static ProductService ps;
	
	private ProductService() {
		
	}
	
	public static ProductService getInstance() {
		if(ps == null) {
			ps=new ProductService();
		}//end if
		return ps;
	}//getInstance
	
	/**
	 * 상품 등록
	 * @param pVO
	 * @return
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
	
	public ProductDomain searchProduct(ProductVO pVO){
		ProductDomain search= null;
		try {
			search=pDAO.selectProduct(pVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return search;
	}//searchCategory
	
	public JSONObject editProduct(ProductVO pVO){
		JSONObject editJsonObj = new JSONObject();
		editJsonObj.put("resultData", false);
		try {
			int updateCnt=pDAO.updateProduct(pVO);
			editJsonObj.put("resultData", true);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
			editJsonObj.put("error", pe.getMessage()); // 예외 메시지 추가
		}//end catch
		
		return editJsonObj;
	}//searchCategory
	
	public JSONObject cancelProduct(ProductVO pVO){
		JSONObject deletejsonObj = new JSONObject();
		deletejsonObj.put("resultData", false);
		try {
			int deleteCnt=pDAO.deleteProduct(pVO);
			deletejsonObj.put("resultData", true);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
			deletejsonObj.put("error", pe.getMessage()); // 예외 메시지 추가
		}//end catch
		
		return deletejsonObj;
	}//searchCategory
	
	
}//class