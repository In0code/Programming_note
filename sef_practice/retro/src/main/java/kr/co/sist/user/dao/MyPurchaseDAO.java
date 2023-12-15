package kr.co.sist.user.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.MyPurchaseDomain;

@Component
public class MyPurchaseDAO {
	
	private String configPath;
	
	private MyPurchaseDAO(){
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}
	
	public List<MyPurchaseDomain> selectDealComplete(String id) throws PersistenceException{
		List<MyPurchaseDomain> list = null;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath,false);
		list = ss.selectList("user.purchase.selectDealComplete",id);
		mbh.closeHandler(ss);
		
		return list;
	}

	public List<MyPurchaseDomain> selectPayComplete(String id) throws PersistenceException{
		List<MyPurchaseDomain> list = null;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath,false);
		list = ss.selectList("user.purchase.selectPayComplete",id);
		mbh.closeHandler(ss);
		
		return list;
	}

	public List<MyPurchaseDomain> selectCancelComplete(String id) throws PersistenceException{
		List<MyPurchaseDomain> list = null;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath,false);
		list = ss.selectList("user.purchase.selectCancelComplete",id);
		mbh.closeHandler(ss);
		
		return list;
	}
	
	public static void main(String[] args) {
		
		System.out.println(new MyPurchaseDAO().selectCancelComplete("urface"));
	}
	

}
