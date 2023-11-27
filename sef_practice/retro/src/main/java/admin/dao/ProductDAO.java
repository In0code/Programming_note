package admin.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import admin.domain.ProductDetailDomain;
import admin.domain.ProductDomain;
import admin.vo.BoardRangeVO;
import common.dao.MybatisHandler;

public class ProductDAO {
	
	private static ProductDAO pDAO;
	
	private ProductDAO() {
	}
	
	public static ProductDAO getInstance() {
		if(pDAO == null) {
			pDAO = new ProductDAO();
		}//end if
		return pDAO;
	}//getInstance
	
	public List<ProductDomain> selectAllProduct(BoardRangeVO brVO)throws PersistenceException{
		List<ProductDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler("", false);
		list=ss.selectList("",brVO);
		
		mbh.closeHandler(ss);
		
		return list;
	}//selectAllProduct
	
	/**
	 * 닉네임 또는 카테고리로 상품 검색
	 * @param brVO
	 * @return
	 * @throws PersistenceException
	 */
	public List<ProductDomain> selectSearcProduct(BoardRangeVO brVO) throws PersistenceException{
		List<ProductDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler("", false);
		list=ss.selectList("",brVO);
		
		mbh.closeHandler(ss);
		
		return list;
	}//selectSearcProduct
	
	
	/**
	 * 상품 하나 상세 조회
	 * @param pcode
	 * @return
	 */
	public ProductDetailDomain selectOneProduct(String pcode) {
		ProductDetailDomain pdd=new ProductDetailDomain();
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler("", false);
		pdd=ss.selectOne("",pcode);
		
		mbh.closeHandler(ss);
		
		return pdd;
	}//selectOneProduct
	
	
	/**
	 * 상품 삭제
	 * @param pcode
	 * @return
	 * @throws PersistenceException
	 */
	public int updateRemoveProduct(String pcode)throws PersistenceException {
		int updateCnt=0;
		MybatisHandler mbh=
				MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler("", false);
		updateCnt=ss.selectOne("",pcode);
		
		mbh.closeHandler(ss);
		
		
		
		return updateCnt;
	}//updateRemoveProduct
	
}//class
