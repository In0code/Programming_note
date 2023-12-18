package kr.co.sist.user.service;

import java.util.List;

import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.user.dao.MyInquiryDAO;
import kr.co.sist.user.domain.MyInquiryDomain;
import kr.co.sist.user.vo.MyInquiryVO;

public class MyInquiryService {
	private static MyInquiryService mIs;
	
	private MyInquiryService() {
		
	}//MyInquiryService
	
	public static MyInquiryService getInstance() {
		if(mIs==null) {
			mIs = new MyInquiryService();
		}
		return mIs;
	}//getInstance
	
	public List<MyInquiryDomain> searchInquiry(BoardRangeVO brVO) {
		List<MyInquiryDomain> list =null;
		MyInquiryDAO miDAO = MyInquiryDAO.getInstance();
		
		list = miDAO.selectInquiry(brVO);
		return list;
	}//searchInquiry
	
	public MyInquiryDomain searchInquiryDetail(String icode) {
		MyInquiryDomain mid = new MyInquiryDomain();
		MyInquiryDAO miDAO = MyInquiryDAO.getInstance();
		mid = miDAO.selectInquiryDetail(icode);
		return mid;
	}//searchInquiryDetail
	
	public int modifyInquiry(MyInquiryVO miVO) {
		int cnt =0;
		MyInquiryDAO miDAO = MyInquiryDAO.getInstance();
		cnt = miDAO.updateInquiry(miVO);
		return cnt;
	}//modifyInquiry
	
	public int removeInquiry(String icode) {
		int cnt =0;
		MyInquiryDAO miDAO = MyInquiryDAO.getInstance();
		cnt = miDAO.deleteInquiry(icode);
		return cnt;
	}//removeInquiry
	
	public int addInquiry(MyInquiryVO miVO) {
		int cnt =0;
		MyInquiryDAO miDAO = MyInquiryDAO.getInstance();
		cnt = miDAO.insertInquiry(miVO);
		return cnt;
	}//addInquiry
	
	public int totalCnt(String id) {
		MyInquiryDAO miDAO = MyInquiryDAO.getInstance();
		return miDAO.selectCntRecode(id);
	}//totalCnt
	
}//class
