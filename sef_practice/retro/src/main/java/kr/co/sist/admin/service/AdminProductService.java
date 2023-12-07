package kr.co.sist.admin.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;

import kr.co.sist.admin.dao.AdminProductDAO;
import kr.co.sist.admin.domain.AdminProductDetailDomain;
import kr.co.sist.admin.domain.AdminProductDomain;
import kr.co.sist.admin.vo.AdminProductVO;
import kr.co.sist.common.BoardRangeVO;

public class AdminProductService {

	private AdminProductDAO apDAO=AdminProductDAO.getInstance();
	
	private static AdminProductService aps;

	private AdminProductService() {
	}

	public static AdminProductService getInstance() {
		if (aps == null) {
			aps = new AdminProductService();
		} // end if
		return aps;
	}// getInstance

	
	/**
	 * 총 레코드 수 service
	 * @param brVO
	 * @return
	 */
	public int productTotalCnt(BoardRangeVO brVO) {
		int cnt = 0;
		try {
			cnt = apDAO.productTotalCnt(brVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch

		return cnt;
	}// productTotalCnt

	/**
	 * 전체 상품 조회 service
	 * @param brVO
	 * @return
	 */
	public List<AdminProductDomain> searchAllProduct(BoardRangeVO brVO) {

		List<AdminProductDomain> productList =  apDAO.selectAllProduct(brVO);

		return productList;
	}// searchAllProduct

	/**
	 * 상품 하나 상세 조회 service
	 * @param pcode
	 * @return
	 */
	public AdminProductDetailDomain searchOneProduct(String pcode) {
		AdminProductDetailDomain pdd = null;

		try {
			pdd = apDAO.selectOneProduct(pcode);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return pdd;
	}// selectOneProduct

	/**
	 * 관리자가 상품 삭제 시 pCancel이 C로 바뀜. service
	 * @param apVO
	 * @return
	 */
	public int editRemoveProduct(AdminProductVO apVO) {
		int updateCnt = 0;


		try {
			updateCnt = apDAO.updateRemoveProduct(apVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return updateCnt;
	}// updateRemoveProduct

}// class
