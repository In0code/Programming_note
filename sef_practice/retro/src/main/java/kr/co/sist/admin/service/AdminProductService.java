package kr.co.sist.admin.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

import kr.co.sist.admin.dao.AdminProductDAO;
import kr.co.sist.admin.domain.AdminProductDetailDomain;
import kr.co.sist.admin.domain.AdminProductDomain;
import kr.co.sist.admin.vo.AdminProductVO;
import kr.co.sist.common.BoardRangeVO;

public class AdminProductService {

	
	public int productTotalCnt(BoardRangeVO brVO) {
		int cnt=0;
		AdminProductDAO pDAO=AdminProductDAO.getInstance();
		try {
			cnt=pDAO.productTotalCnt(brVO);
		}catch(PersistenceException pe){
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//productTotalCnt
	
	
	public List<AdminProductDomain> searchAllProduct(BoardRangeVO brVO) {
		List<AdminProductDomain> list=null;
		
		AdminProductDAO pDAO=AdminProductDAO.getInstance();
		try {
			list=pDAO.selectAllProduct(brVO);
		}catch(PersistenceException pe){
			pe.printStackTrace();
		}//end catch
		return list;
	}//searchAllProduct
	
	public AdminProductDetailDomain searchOneProduct(String pcode) {
		AdminProductDetailDomain pdd=null;
		
		AdminProductDAO pDAO=AdminProductDAO.getInstance();
		try {
			pdd=pDAO.selectOneProduct(pcode);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		return pdd;
	}//selectOneProduct
	
	public int editRemoveProduct(AdminProductVO apVO) {
		int updateCnt = 0;
		
		AdminProductDAO pDAO=AdminProductDAO.getInstance();
		
		try {
		updateCnt=pDAO.updateRemoveProduct(apVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		return updateCnt;
	}//updateRemoveProduct
	
}//class
