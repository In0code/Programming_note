package kr.co.sist.user.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.EventDomain;

@Component
public class EventDAO {

	private String configPath;

	private EventDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}
	
	public List<EventDomain> selectAllEvent(String searchType) throws PersistenceException{
		List<EventDomain> list = null;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath,false);
		list = ss.selectList("user.event.selectAllEvent", searchType);
		
		mbh.closeHandler(ss);
		
		return list;
	}
	
	public EventDomain selectOneEvent(String eventcode) throws PersistenceException{
		EventDomain ed = null;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath,false);
		ed = ss.selectOne("user.event.selectOneEvent", eventcode);
		
		mbh.closeHandler(ss);
		
		return ed;
	}


}
