package kr.co.sist.user.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.MySalesDomain;
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


	public String getPcode(String id) throws PersistenceException{
		
		String getRecentPcode="";
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		getRecentPcode = ss.selectOne("user.product.getPcode",id);

		mbh.closeHandler(ss);

		return getRecentPcode;
	}//getPcode
	
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
	
	public List<MySalesDomain> selectBuyerAllInfo(String seller)throws PersistenceException{
		
		List<MySalesDomain> selectInfo=null;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		selectInfo = ss.selectList("user.product.selectBuyerAllInfo",seller);
		
		mbh.closeHandler(ss);
		
		return selectInfo;
		
	}//selectBuyerAllInfo
	
	public int selectWishCnt(String pcode)throws PersistenceException{
		int wishCnt=0;
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		wishCnt = ss.selectOne("user.product.selectWishCnt",pcode);
		
		mbh.closeHandler(ss);
		
		return wishCnt;
	}//selectWishCnt
	

}// class
