package kr.co.sist.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.admin.dao.AdminInquiryDAO;
import kr.co.sist.admin.dao.AdminReportDAO;
import kr.co.sist.admin.domain.AdminReportDomain;
import kr.co.sist.common.BoardRangeVO;

@Service
public class AdminReportService {
	@Autowired
	private AdminReportDAO arDAO;
	
	public List<AdminReportDomain> searchReport(BoardRangeVO brVO){
		List<AdminReportDomain> list=null;
		list=arDAO.selectReport(brVO);
		return list;
		
	}//searchReport
	
	public AdminReportDomain searchReportDetail(String rcode){
		AdminReportDomain ard=new AdminReportDomain();
		ard=arDAO.selectReportDetail(rcode);
		return ard;
		
	}//searchReportDetail
	
	public int modifyPcancel(String rcode){
		int result=0;
		result=arDAO.updatePcancel(rcode);
		return result;
		
	}//modifyPcancel
	
	public int totalRecode() {
		int totalRecodeCnt=0;
		totalRecodeCnt=arDAO.selectTotalRecode();
		return totalRecodeCnt;
	}//totalRecode
	
}//main
