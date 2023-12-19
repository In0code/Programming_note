package kr.co.sist.user.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.GoodsDomain;

@Component
public class HomeDAO {
	
	private String configPath;
	
	private HomeDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}
	
	public List<GoodsDomain> selectNewProduct() throws PersistenceException{
		List<GoodsDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath,false);
		list = ss.selectList("user.home.selectNewProduct");
		mbh.closeHandler(ss);
		
		return list;
	}
	
	public List<GoodsDomain> selectAllProduct() throws PersistenceException{
		List<GoodsDomain> list = null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath,false);
		list = ss.selectList("user.home.selectAllProduct");
		mbh.closeHandler(ss);
		
		return list;
	}
	
	public void insertDailyDate() throws PersistenceException{
		
		int result=0;
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath,false);
		result=ss.insert("user.home.insertDailyDate");
		 if(result==1) {
			 ss.commit();
		 }else {
			 ss.rollback();
		 }
		 
		mbh.closeHandler(ss);
		
	}//insertDailyDate
}
