package kr.co.sist.user.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.user.dao.GoodsDAO;
import kr.co.sist.user.domain.GoodsDomain;

@Component
public class GoodsService {
	
	@Autowired
	private GoodsDAO gDAO;
	
	public List<GoodsDomain> searchGoodsList1(String category) {
		List<GoodsDomain> list=null;
		
		try {
			list=gDAO.selectGoodsList1(category);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchGoodsList1
	
	public List<GoodsDomain> searchGoodsList2(String category) {
		List<GoodsDomain> list=null;
		
		try {
			list=gDAO.selectGoodsList2(category);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchGoodsList1
	
	public List<GoodsDomain> searchGoodsList3(String category) {
		List<GoodsDomain> list=null;
		
		try {
			list=gDAO.selectGoodsList3(category);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}//searchGoodsList1
	
	
	public GoodsDomain searchGoodsDetail(String pcode) {
		GoodsDomain gd=null;
		
		try {
		gd=gDAO.selectGoodsDetail(pcode);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		return gd;
	}//searchGoodsDetail
	
	
	

}//class

