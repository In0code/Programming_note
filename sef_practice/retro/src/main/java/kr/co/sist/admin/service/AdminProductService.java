package kr.co.sist.admin.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

import kr.co.sist.admin.dao.AdminProductDAO;
import kr.co.sist.admin.domain.AdminProductDetailDomain;
import kr.co.sist.admin.domain.AdminProductDomain;
import kr.co.sist.common.BoardRangeVO;

public class AdminProductService {

	public List<AdminProductDomain> searchAllProduct(BoardRangeVO brVO) {
		List<AdminProductDomain> list=null;
		
		AdminProductDAO pDAO=AdminProductDAO.getInstance();
		try {
//			list=pDAO.selectAllProduct(brVO);
		}catch(PersistenceException pe){
			pe.printStackTrace();
		}//end catch
		return list;
	}//searchAllProduct
	
	public AdminProductDetailDomain selectOneProduct(String pcode) {
		AdminProductDetailDomain pdd=null;
		
		AdminProductDAO pDAO=AdminProductDAO.getInstance();
		try {
			pdd=pDAO.selectOneProduct(pcode);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		return pdd;
	}//selectOneProduct
	
}//class
