package kr.co.sist.user.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.EventDAO;
import kr.co.sist.user.domain.EventDomain;

@Service
public class EventService {
	
	@Autowired
	private EventDAO eDAO;
	
	public List<EventDomain> searchAllEvent(String searchType) {
		List<EventDomain> list = null;
		
		try {
			list = eDAO.selectAllEvent(searchType);
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	
	public EventDomain searchOneEvent(String eventcode) {
		EventDomain ed = null;
		
		try {
			ed = eDAO.selectOneEvent(eventcode);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return ed;
	}

}
