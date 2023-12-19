package kr.co.sist.user.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.PageVO;
import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.GoodsDomain;
import kr.co.sist.user.domain.ProductDomain;
import kr.co.sist.user.vo.GoodsVO;
import kr.co.sist.user.vo.ProductVO;

@Component
public class GoodsDAO {
	
	
	/**
	 * 대분류 상품 조회
	 * @param brVO
	 * @return
	 */
	public List<GoodsDomain> selectGoodsList1(String category)throws PersistenceException{
		List<GoodsDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		list=ss.selectList("kr.co.sist.goods.BigCategory", category);
		
		mbh.closeHandler(ss);
		
		return list;
	}//selectGoodsList1
	

	/**
	 * 대분류 상품 목록 Count
	 * @param pageVO
	 * @return
	 */
	public int selectGoodsList1Cnt(PageVO pageVO) {
		int totalCnt = 0;
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		totalCnt=ss.selectOne("kr.co.sist.goods.BigCategoryPageCnt", pageVO);
		
		mbh.closeHandler(ss);
		
		return totalCnt;
	}//selectGoodsList1Cnt
	
	/**
	 * 대분류 상품 목록 Paging
	 * @param pageVO
	 * @return
	 */
	public List<GoodsDomain> selectGoodsList1Page(PageVO pageVO) {
		List<GoodsDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		list=ss.selectList("kr.co.sist.goods.BigCategoryPage", pageVO);
		
		mbh.closeHandler(ss);
		
		return list;
	}//selectGoodsList1Page
	
	/**
	 * 중분류 상품 조회
	 * @param brVO
	 * @return
	 */
	public List<GoodsDomain> selectGoodsList2(String category)throws PersistenceException{
		List<GoodsDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		list=ss.selectList("kr.co.sist.goods.MidCategory", category);
		
		mbh.closeHandler(ss);
		
		return list;
	}//selectGoodsList2
	
	/**
	 * 중분류 상품 Count
	 * @param pageVO
	 * @return
	 */
	public int selectGoodsList2Cnt(PageVO pageVO) {
		int totalCnt=0;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		totalCnt=ss.selectOne("kr.co.sist.goods.MidCategoryPageCnt", pageVO);
		
		mbh.closeHandler(ss);
		
		return totalCnt;
	}//selectGoodsList2Cnt
	
	/**
	 * 중분류 상품 목록 Paging
	 * @param pageVO
	 * @return
	 */
	public List<GoodsDomain> selectGoodsList2Page(PageVO pageVO) {
		List<GoodsDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		list=ss.selectList("kr.co.sist.goods.MidCategoryPage", pageVO);
		
		mbh.closeHandler(ss);
		
		return list;
	}//selectGoodsList2Page
	
	/**
	 * 소분류 상품 조회
	 * @param brVO
	 * @return
	 */
	public List<GoodsDomain> selectGoodsList3(String category)throws PersistenceException{
		List<GoodsDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		list=ss.selectList("kr.co.sist.goods.SmallCategory",category);
		
		mbh.closeHandler(ss);
		
		return list;
	}//selectGoodsList3
	
	/**
	 * 소분류 상품 Count(개수)
	 * @param brVO
	 * @return
	 */
	public int selectGoodsList3Cnt(PageVO pageVO) {
		int totalCnt=0;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		totalCnt=ss.selectOne("kr.co.sist.goods.SmallCategoryPageCnt", pageVO);
		
		mbh.closeHandler(ss);
		
		return totalCnt;
	}//selectGoodsList3Cnt
	
	
	/**
	 * 소분류 상품 목록 Paging
	 * @param pageVO
	 * @return
	 */
	public List<GoodsDomain> selectGoodsList3Page(PageVO pageVO) {
		List<GoodsDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		list=ss.selectList("kr.co.sist.goods.SmallCategoryPage", pageVO);
		
		mbh.closeHandler(ss);
		
		return list;
	}//selectGoodsList3Page
	
	
	/**
	 * 상품 상세 조회
	 * @param pcode
	 * @return
	 */
	public GoodsDomain selectGoodsDetail(String pcode) throws PersistenceException{
		
		GoodsDomain gd=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		gd=ss.selectOne("kr.co.sist.goods.selectGoodsOne", pcode);
		
		mbh.closeHandler(ss);
		
		return gd;
	}//selectGoodsDetail
	
	

	/**
	 * 검색창 상품 검색
	 * @param searchText
	 * @return
	 */
	public List<GoodsDomain> searchByText(String searchText) {
		List<GoodsDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		list=ss.selectList("kr.co.sist.goods.SearchByText",searchText);
		
		mbh.closeHandler(ss);
		
		return list;
	}
	
	/**
	 * 검색한 상품 Count(개수)
	 * @param pageVO
	 * @return
	 */
	public int searchByTextCnt(PageVO pageVO) {
		int totalCount=0;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		totalCount=ss.selectOne("kr.co.sist.goods.SearchByTextCnt",pageVO);
		
		mbh.closeHandler(ss);
		
		return totalCount;
	}
	
	/**
	 * 상품 검색 Paging
	 * @param pageVO
	 * @return
	 */
	public List<GoodsDomain> searchByText(PageVO pageVO) {
		List<GoodsDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		list=ss.selectList("kr.co.sist.goods.SearchByTextPage",pageVO);
		
		mbh.closeHandler(ss);
		
		return list;
	}
	
	public int searchCheck(GoodsVO gVO) throws PersistenceException {
		int cnt = 0;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(false);
		cnt = ss.selectOne("kr.co.sist.goods.selectCheck",gVO);
		
		return cnt;
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
		SqlSession ss = mbh.getMyBatisHandler(false);
		search = ss.selectOne("kr.co.sist.goods.selectProduct", pVO);

		mbh.closeHandler(ss);

		return search;
	}// selectProduct
	
	public static void main(String[] args) {
		GoodsDAO gDAO=new GoodsDAO();
		System.out.println(gDAO.selectGoodsList3("C101"));
		
	}


}




