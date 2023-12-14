package kr.co.sist.user.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.common.PageVO;
import kr.co.sist.user.dao.GoodsDAO;
import kr.co.sist.user.domain.GoodsDomain;

@Component
public class GoodsService {
	
	@Autowired
	private GoodsDAO gDAO;
	
	/**
	 * 대분류 상품 조회
	 * @param category
	 * @return
	 */
	public List<GoodsDomain> searchGoodsList1(String category) {
		List<GoodsDomain> list=null;
		
		try {
			list=gDAO.selectGoodsList1(category);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchGoodsList1
	
	/**
	 * 대분류 상품목록 Count
	 * @param pageVO
	 * @return
	 */
	public int searchGoodsList1Cnt(PageVO pageVO) {
		int totalCnt = 0;
		try {
			totalCnt=gDAO.selectGoodsList1Cnt(pageVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return totalCnt;
	}//searchGoodsList1Cnt
	
	/**
	 * 대분류 상품목록 Paging
	 * @param pageVO
	 * @return
	 */
	public List<GoodsDomain> searchGoodsList1(PageVO pageVO) {
		List<GoodsDomain> list=null;
		
		try {
			list=gDAO.selectGoodsList1(pageVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchGoodsList1
	
	/**
	 * 중분류 상품 조회
	 * @param category
	 * @return
	 */
	public List<GoodsDomain> searchGoodsList2(String category) {
		List<GoodsDomain> list=null;
		
		try {
			list=gDAO.selectGoodsList2(category);
			System.out.println(list.toString());
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchGoodsList2
	
	/**
	 * 소분류 상품 조회
	 * @param category
	 * @return
	 */
	public List<GoodsDomain> searchGoodsList3(String category) {
		List<GoodsDomain> list=null;
		
		try {
			list=gDAO.selectGoodsList3(category);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchGoodsList1
	
	
	/**
	 * 상품 상세 조회
	 * @param pcode
	 * @return
	 */
	public GoodsDomain searchGoodsDetail(String pcode) {
		GoodsDomain gd=null;
		
		try {
		gd=gDAO.selectGoodsDetail(pcode);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		return gd;
	}//searchGoodsDetail

	/**
	 * 검색창에서 상품 검색
	 * @param searchText
	 * @return
	 */
	public List<GoodsDomain> searchByText(String searchText) {
		List<GoodsDomain> list=null;
		
		try {
			list=gDAO.searchByText(searchText);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchByText
	
	/**
	 * 상품 검색 Count
	 * @param pageVO
	 * @return
	 */
	public int searchByTextCnt(PageVO pageVO) {
		int totalCount = 0;
		
		try {
			totalCount=gDAO.searchByTextCnt(pageVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return totalCount;
	}//searchByTextCnt
	
	/**
	 * 상품 검색 Paging
	 * @param pageVO
	 * @return
	 */
	public List<GoodsDomain> searchByText(PageVO pageVO) {
		List<GoodsDomain> list=null;
		
		try {
			list=gDAO.searchByText(pageVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchByText

	
	
	

}//class

