package kr.co.sist.admin.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;

import kr.co.sist.admin.dao.AdminProductDAO;
import kr.co.sist.admin.domain.AdminProductDetailDomain;
import kr.co.sist.admin.domain.AdminProductDomain;
import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.pagination.Pagination;
import kr.co.sist.common.pagination.PaginationDomain;

public class AdminProductService {

	private AdminProductDAO apDAO = AdminProductDAO.getInstance();

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
	 * 
	 * @param brVO
	 * @return
	 */
	public PaginationDomain productTotalCnt(String currentPage) {
		int page = 1;
		if(currentPage != null && !"".equals(currentPage)) {
			page = Integer.parseInt(currentPage);
		}
		PaginationDomain pageD = null;
		BoardRangeVO brVO=new BoardRangeVO();
		try {
			int cnt = apDAO.productTotalCnt(brVO);
			Pagination pn=new Pagination();
			pageD=pn.setStartEndPageNum(cnt, page);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch

		return pageD;
	}// productTotalCnt

	/**
	 * 전체 상품 조회 service
	 * 
	 * @param brVO
	 * @return
	 */
	public List<AdminProductDomain> searchAllProduct(BoardRangeVO brVO) {

		List<AdminProductDomain> productList = null;
		try {
			productList = apDAO.selectAllProduct(brVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch

		return productList;
	}// searchAllProduct

	/**
	 * 상품 하나 상세 조회 service
	 * 
	 * @param pcode
	 * @return
	 */
	public AdminProductDetailDomain searchOneProduct(String pcode) {

		AdminProductDetailDomain productOne = null;
		try {
			productOne = apDAO.selectOneProduct(pcode);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch

		return productOne;
	}// selectOneProduct

	/**
	 * 관리자가 상품 삭제 시 pCancel이 C로 바뀜. service
	 * 
	 * @param apVO
	 * @return
	 */
	public JSONObject editRemoveProduct(String pcode) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("resultData", false);
		
		try {
			int updateCnt=apDAO.updateRemoveProduct(pcode);
			jsonObj.put("resultData", true);
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
			jsonObj.put("error", pe.getMessage()); // 예외 메시지 추가
		}//end catch
		return jsonObj;
	}// updateRemoveProduct

}// class
