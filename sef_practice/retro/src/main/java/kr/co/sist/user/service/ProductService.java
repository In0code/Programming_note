package kr.co.sist.user.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

import kr.co.sist.user.dao.ProductDAO;
import kr.co.sist.user.domain.ProductDomain;

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
	
	public List<ProductDomain> searchCategory(){
		
		List<ProductDomain> categoryList = null;
		try {
		categoryList=pDAO.selectCategory();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return categoryList;
	}//searchCategory
	
	
}//class
