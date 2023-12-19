package kr.co.sist.admin.service;

import java.util.List;

import kr.co.sist.admin.dao.AdminInquiryDAO;
import kr.co.sist.admin.domain.AdminInquiryDomain;
import kr.co.sist.admin.vo.AdminInquiryVO;
import kr.co.sist.common.BoardRangeVO;

public class AdminInquiryService {
	private static AdminInquiryService aIs;
	
	private AdminInquiryService() {
		
	}//AdminInquiryService
	
	public static AdminInquiryService getInstance() {
		if(aIs==null) {
			aIs= new AdminInquiryService();
		}
		
		return aIs;
	}//getInstance
	
	public List<AdminInquiryDomain> searchInquiry(BoardRangeVO brVO) {
		List<AdminInquiryDomain> list =null;
		AdminInquiryDAO aiDAO = AdminInquiryDAO.getInstance();
		list = aiDAO.selectInquiry(brVO);
		return list;
	}//searchInquiry
	
	
	public AdminInquiryDomain searchInquiryDetail( String inquiryCode) {
		AdminInquiryDomain aid = new AdminInquiryDomain();
		AdminInquiryDAO aiDAO = AdminInquiryDAO.getInstance();
		aid = aiDAO.selectInquiryDetail(inquiryCode);
		return aid;
	}//searchInquiry
	
	public int modifyAnswer( AdminInquiryVO aiVO) {
		int cnt=0;
		AdminInquiryDAO aiDAO = AdminInquiryDAO.getInstance();
		cnt = aiDAO.updateAnswer(aiVO);
		return cnt;
	}//modifyAnswer
	
	public int totalRecode() {
		AdminInquiryDAO aiDAO = AdminInquiryDAO.getInstance();
		return aiDAO.selectTotalRecode();
	}
}

