package kr.co.sist.user.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.PageVO;
import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.GoodsDomain;

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
	}//selectGoodsList
	

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
	}
	
	/**
	 * 대분류 상품 목록 Paging
	 * @param pageVO
	 * @return
	 */
	public List<GoodsDomain> selectGoodsList1(PageVO pageVO) {
		List<GoodsDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		list=ss.selectList("kr.co.sist.goods.BigCategoryPage", pageVO);
		
		mbh.closeHandler(ss);
		
		return list;
	}
	
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
	}//selectGoodsList
	
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
	}//selectGoodsList
	
	
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
	
	
	
	public static void main(String[] args) {
		GoodsDAO gDAO=new GoodsDAO();
		System.out.println(gDAO.selectGoodsList3("C101"));
		
	}

	public List<GoodsDomain> searchByText(String searchText) {
		List<GoodsDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		list=ss.selectList("kr.co.sist.goods.SearchByText",searchText);
		
		mbh.closeHandler(ss);
		
		return list;
	}
	
	public int searchByTextCnt(PageVO pageVO) {
		int totalCount=0;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		totalCount=ss.selectOne("kr.co.sist.goods.SearchByTextCnt",pageVO);
		
		mbh.closeHandler(ss);
		
		return totalCount;
	}
	public List<GoodsDomain> searchByText(PageVO pageVO) {
		List<GoodsDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		list=ss.selectList("kr.co.sist.goods.SearchByTextPage",pageVO);
		
		mbh.closeHandler(ss);
		
		return list;
	}


}




