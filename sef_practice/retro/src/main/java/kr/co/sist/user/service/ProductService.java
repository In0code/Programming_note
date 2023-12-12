package kr.co.sist.user.service;

import org.apache.ibatis.exceptions.PersistenceException;

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
		int result= 0;
		try {
			result=pDAO.insertProduct(pVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return result;
	}//searchCategory
	
	public ProductDomain searchProduct(ProductVO pVO){
		ProductDomain pd= null;
		try {
			pd=pDAO.selectProduct(pVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return pd;
	}//searchCategory
	
	public int editProduct(ProductVO pVO){
		int updateCnt= 0;
		try {
			updateCnt=pDAO.updateProduct(pVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return updateCnt;
	}//searchCategory
	
	public int cancelProduct(ProductVO pVO){
		int deleteCnt= 0;
		try {
			deleteCnt=pDAO.deleteProduct(pVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return deleteCnt;
	}//searchCategory
	
	
}//class