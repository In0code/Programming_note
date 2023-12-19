package kr.co.sist.admin.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.admin.domain.AdminProductDetailDomain;
import kr.co.sist.admin.domain.AdminProductDomain;
import kr.co.sist.admin.vo.AdminProductVO;
import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.dao.MybatisHandler;

public class AdminProductDAO {

	private static AdminProductDAO apDAO;
	private String configPath;

	private AdminProductDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}

	public static AdminProductDAO getInstance() {
		if (apDAO == null) {
			apDAO = new AdminProductDAO();
		} // end if
		return apDAO;
	}// getInstance

	/**
	 * 총 레코드 수
	 * 
	 * @param brVO
	 * @return
	 * @throws PersistenceException
	 */
	public int productTotalCnt(BoardRangeVO brVO) throws PersistenceException {
		int cnt = 0;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		cnt = ss.selectOne("admin.product.productTotalCnt", brVO);
		mbh.closeHandler(ss);

		return cnt;
	}// productTotalCnt

	public List<AdminProductDomain> selectAllProduct(BoardRangeVO brVO) throws PersistenceException {
		List<AdminProductDomain> list = null;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		list = ss.selectList("admin.product.selectAllProduct", brVO);

		mbh.closeHandler(ss);

		return list;
	}// selectAllProduct

	/**
	 * 상품 하나 상세 조회
	 * 
	 * @param pcode
	 * @return
	 */
	public AdminProductDetailDomain selectOneProduct(String pcode) throws PersistenceException {
		AdminProductDetailDomain pdd = null;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		pdd = ss.selectOne("admin.product.selectDetailProduct", pcode);

		mbh.closeHandler(ss);

		return pdd;
	}// selectOneProduct

	/**
	 * 상품 삭제 업데이트
	 * 
	 * @param pcode
	 * @return
	 * @throws PersistenceException
	 */

	public int updateRemoveProduct(String pcode) throws PersistenceException {
		int updateCnt = 0;
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		
		updateCnt = ss.update("admin.product.updateProduct", pcode);
		if(updateCnt == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}//end else
		
		mbh.closeHandler(ss);

		return updateCnt;
	}// updateRemoveProduct


}// class
