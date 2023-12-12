package kr.co.sist.user.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.ProductDomain;
import kr.co.sist.user.vo.ProductVO;

public class ProductDAO {

	private static ProductDAO pDAO;
	private String configPath;

	private ProductDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}

	public static ProductDAO getInstance() {
		if (pDAO == null) {
			pDAO = new ProductDAO();
		} // end if
		return pDAO;
	}// getInstance

	/**
	 * 상품 등록
	 * 
	 * @return
	 * @throws PersistenceException
	 */
	public int insertProduct(ProductVO pVO) throws PersistenceException {
		int result = 0;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		result = ss.insert("user.product.insertProduct", pVO);

		mbh.closeHandler(ss);

		return result;
	}// selectCategory

	/**
	 * 상품 조회
	 * 
	 * @param pVO
	 * @return
	 * @throws PersistenceException
	 */
	public ProductDomain selectProduct(ProductVO pVO) throws PersistenceException {
		ProductDomain pd = null;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		pd = ss.selectOne("user.product.selectProduct", pVO);

		mbh.closeHandler(ss);

		return pd;
	}// selectProduct
	
	public int updateProduct(ProductVO pVO)throws PersistenceException{
		int updateCnt=0;
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		updateCnt = ss.update("user.product.updateProduct", pVO);

		mbh.closeHandler(ss);

		return updateCnt;
	}//updateProduct
	
	public int deleteProduct(ProductVO pVO)throws PersistenceException{
		int deleteCnt=0;
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		deleteCnt = ss.delete("user.product.updateProduct", pVO);
		
		mbh.closeHandler(ss);
		
		return deleteCnt;
	}//updateProduct
	
	
	
	

	public static void main(String[] args) {
		ProductDAO pd = ProductDAO.getInstance();
		ProductVO pVO = new ProductVO();
		pVO.setC3code("C102");
		pVO.setContext("안녕하세요");
		pVO.setDeliver("N");
		pVO.setId("1011kiy111");
		pVO.setLoc("자양동");
		pVO.setPcode("P00039");
		pVO.setPname("롱치마");
		pVO.setPrice(10000);
		pVO.setStatus("S");
		pVO.setImg("asdf");
		pVO.setImg2("asdf");
//		pd.addProduct(pVO);
	}// main

}// class
