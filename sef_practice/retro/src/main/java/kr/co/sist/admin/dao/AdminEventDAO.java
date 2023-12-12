package kr.co.sist.admin.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.admin.domain.AdminEventDomain;
import kr.co.sist.admin.vo.AdminEventVO;
import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.dao.MybatisHandler;

@Component
public class AdminEventDAO {

	private String configPath;

	private AdminEventDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}

	/**
	 * 총 레코드 수
	 * 
	 * @param brVO 필드, 키워드
	 * @return
	 * @throws PersistenceException
	 */
	public int totalCnt(BoardRangeVO brVO) throws PersistenceException {
		int cnt = 0;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		cnt = ss.selectOne("admin.event.totalCnt", brVO);
		
		mbh.closeHandler(ss);

		return cnt;
	}

	/**
	 * 이벤트 리스트
	 * @param brVO 필드, 키워드, startNum, endNum
	 * @return
	 * @throws PersistenceException
	 */
	public List<AdminEventDomain> selectAllEvent(BoardRangeVO brVO) throws PersistenceException {
		List<AdminEventDomain> list = null;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		list = ss.selectList("admin.event.selectAllEvent", brVO);

		mbh.closeHandler(ss);

		return list;
	}
	
	public AdminEventDomain selectOneEvent(String ecode) throws PersistenceException{
		AdminEventDomain aed = null;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		aed = ss.selectOne("admin.event.selectOneEvent",ecode);
		
		mbh.closeHandler(ss);
		
		return aed;
	}

	public int insertEvent(AdminEventVO aeVO) throws PersistenceException{
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		int cnt = ss.insert("admin.event.insertEvent", aeVO);
		
		if(cnt == 1) {
			ss.commit();
		}
		
		mbh.closeHandler(ss);
		
		return cnt;
	}
	
	public static void main(String[] args) {
		AdminEventDAO aDAO = new AdminEventDAO();
		BoardRangeVO brVO = new BoardRangeVO();
		AdminEventVO aeVO = new AdminEventVO();
		aeVO.setContext("내용");
		aeVO.setTitle("제목");
		aeVO.setId("admin");
		aeVO.setImg("img.png");
		aeVO.setImg2("img2.png");
		aeVO.setStart_date("2023-12-11");
		aeVO.setEnd_date("2023-12-15");
		
		System.out.println(aDAO.insertEvent(aeVO));
		
	}

}
