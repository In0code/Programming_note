package kr.co.sist.admin.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.admin.dao.AdminEventDAO;
import kr.co.sist.admin.domain.AdminEventDomain;
import kr.co.sist.admin.vo.AdminEventVO;
import kr.co.sist.common.BoardRangeVO;

@Service
public class AdminEventService {

	@Autowired
	private AdminEventDAO aeDAO;

	/**
	 * 총 레코드 수
	 * @param brVO 필드, 키워드
	 * @return
	 */
	public int totalCnt(BoardRangeVO brVO) {
		int cnt = 0;
		try {
			cnt = aeDAO.totalCnt(brVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}

		return cnt;
	}

	/**
	 * 이벤트 리스트
	 * @param brVO 필드, 키워드, startNum, endNum
	 * @return
	 */
	public List<AdminEventDomain> searchAllEvent(BoardRangeVO brVO) {
		List<AdminEventDomain> list = null;
		
		try {
			list = aeDAO.selectAllEvent(brVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}

		return list;
	}
	
	/**
	 * 이벤트 상세
	 * @param ecode
	 * @return
	 */
	public AdminEventDomain searchOneEvent(String ecode) {
		AdminEventDomain aed = null;
		
		try {
			aed = aeDAO.selectOneEvent(ecode);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return aed;
	}
	
	public int addEvent(AdminEventVO aeVO){
		int cnt = 0;
		
		try {
			cnt = aeDAO.insertEvent(aeVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}

	public int editEvent(AdminEventVO aeVO){
		int cnt = 0;
		
		try {
			cnt = aeDAO.updateEvent(aeVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}
	
	public int removeEvent(String eventcode) {
		int cnt = 0;
		
		try {
			cnt = aeDAO.deleteEvent(eventcode);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt;
	}

}// class
