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
	
	public int selectDealCnt(String id) throws PersistenceException{
		int cnt = 0;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath,false);
		cnt = ss.selectOne("user.purchase.dealCnt",id);
		
		return cnt;
	}
	
	public int selectPayCnt(String id) throws PersistenceException{
		int cnt = 0;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath,false);
		cnt = ss.selectOne("user.purchase.payCnt",id);
		
		return cnt;
	}
	
	public int selectCancelCnt(String id) throws PersistenceException{
		int cnt = 0;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath,false);
		cnt = ss.selectOne("user.purchase.cancelCnt",id);
		
		return cnt;
	}

	public MyPurchaseDomain selectBuyDetail(String code) throws PersistenceException{
		MyPurchaseDomain mpd = null;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath,false);
		mpd = ss.selectOne("user.purchase.selectBuyDetail",code);
		
		return mpd;
	}

	public MyPurchaseDomain selectPayDetail(String code) throws PersistenceException{
		MyPurchaseDomain mpd = null;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath,false);
		mpd = ss.selectOne("user.purchase.selectPayDetail",code);
		
		return mpd;
	}
	
	public int updateCancel(String code) throws PersistenceException{
		int cnt = 0;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		cnt = ss.update("user.purchase.updateCancel",code);
		
		if(cnt == 1) {
			ss.commit();
		}
		
		mbh.closeHandler(ss);
		
		return cnt;
	}
	
	public static void main(String[] args) {
		
		System.out.println(new MyPurchaseDAO().selectDealCnt("urface"));
	}
	

}