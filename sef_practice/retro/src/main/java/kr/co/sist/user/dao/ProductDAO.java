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
		int insertCnt = 0;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		insertCnt = ss.insert("user.product.insertProduct", pVO);
		if(insertCnt == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		mbh.closeHandler(ss);

		return insertCnt;
	}// selectCategory


	public String getPcode() throws PersistenceException{
		
		String getRecentPcode="";
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		getRecentPcode = ss.selectOne("user.product.getPcode");

		mbh.closeHandler(ss);

		return getRecentPcode;
	}
	
	/**
	 * 상품 조회
	 * 
	 * @param pVO
	 * @return
	 * @throws PersistenceException
	 */
	public ProductDomain selectProduct(ProductVO pVO) throws PersistenceException {
		ProductDomain search = null;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		search = ss.selectOne("user.product.selectProduct", pVO);

		mbh.closeHandler(ss);

		return search;
	}// selectProduct
	
	public int  updateProduct(ProductVO pVO) throws PersistenceException {
	    
		int updateCnt=0;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
	    SqlSession ss = mbh.getMyBatisHandler(configPath, false);
	    try {
	         updateCnt = ss.update("user.product.updateProduct", pVO);
	        if (updateCnt == 1) {
	            ss.commit();
	        } else {
	            ss.rollback();
	        }//end else
	    } finally {
	        mbh.closeHandler(ss);
	    }//finally
	    
	    return updateCnt;
	}//updateProduct
	
	public int updateSaleok(String pcode) throws PersistenceException {
		
		int updateSaleCnt=0;

		MybatisHandler mbh = MybatisHandler.getInstance();
	    SqlSession ss = mbh.getMyBatisHandler(configPath, false);
	    try {
	        updateSaleCnt = ss.update("user.product.updateSaleOk", pcode);
	        if (updateSaleCnt == 1) {
	            ss.commit();
	        } else {
	            ss.rollback();
	        }//end else
	    } finally {
	        mbh.closeHandler(ss);
	    }//finally
	    
	    return updateSaleCnt;
	}//updateSaleok
	
	public int deleteProduct(String pcode) throws PersistenceException {
	    int deleteCnt=0;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
	    SqlSession ss = mbh.getMyBatisHandler(configPath, false);
	    try {
	        deleteCnt = ss.delete("user.product.deleteProduct", pcode);
	        if (deleteCnt == 1) {
	            ss.commit();
	        } else {
	            ss.rollback();
	        }//end else
	    } finally {
	        mbh.closeHandler(ss);
	    }//end finally
	    return deleteCnt;
	}//deleteProduct
	
	
//
//	public static void main(String[] args) {
//		ProductDAO pd = ProductDAO.getInstance();
//		ProductVO pVO = new ProductVO();
//		pVO.setId("1011kiy111");
//		pVO.setPcode("P00064");
//		pVO.setPname("롱치마");
//		pVO.setPrice(10000);
//		pVO.setStatus("S");
//		pVO.setImg("b1.png");
//		pVO.setImg2("b2.png");
//		pVO.setContext("이것도 올라가주세요");
//		pVO.setDeliver("N");
//		pVO.setLoc("의정부동");
//		pVO.setC3code("C102");
//		pd.insertProduct(pVO);
////		pd.deleteProduct(pVO);
//		
//		
//	}// main

}// class
