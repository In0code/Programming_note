package kr.co.sist.user.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.GoodsDomain;

public class HomeDAO {

	
	public List<GoodsDomain> homeProduct(String pcode)throws PersistenceException{
		List<GoodsDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		
		return list;
		
	}
}
