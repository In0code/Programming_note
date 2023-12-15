package kr.co.sist.user.dao;

import java.util.List;

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
		try {
			insertCnt = ss.insert("user.product.insertProduct", pVO);
	        if (insertCnt == 1) {
	            ss.commit();
	        } else {
	            ss.rollback();
	        }//end else
	    } finally {
	        mbh.closeHandler(ss);
	    }//finally
		return insertCnt;
	}// selectCategory


	public String getPcode() throws PersistenceException{
		
		String getRecentPcode="";
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		getRecentPcode = ss.selectOne("user.product.getPcode");

		mbh.closeHandler(ss);

		return getRecentPcode;
	}//getPcode
	
	public List<ProductDomain> getCategoryName(String pcode) throws PersistenceException{
		
		List<ProductDomain> getCname=null;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		getCname=ss.selectList("user.product.getCname",pcode);
		
		mbh.closeHandler(ss);
		
		return getCname;
	}//getCategoryName
	
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
	
	

	public static void main(String[] args) {
		ProductDAO pd = ProductDAO.getInstance();
		ProductVO pVO = new ProductVO();
//		pVO.setId("1011kiy111");
		pVO.setPcode("P00089");
//		pVO.setPname("롱치마");
//		pVO.setPrice(10000);
//		pVO.setStatus("S");
//		pVO.setImg("b1.png");
//		pVO.setImg2("b2.png");s
//		pVO.setContext("이것도 올라가주세요");
//		pVO.setDeliver("N");
//		pVO.setLoc("의정부동");
//		pVO.setC3code("C102");
//		pd.insertProduct(pVO);
//		pd.deleteProduct(pVO);
//		pd.getCategoryName("C103");
		pd.selectProduct(pVO);
		
		
		
	}// main

}// class
