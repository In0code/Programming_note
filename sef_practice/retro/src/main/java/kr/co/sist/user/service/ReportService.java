package kr.co.sist.user.service;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.ReportDAO;
import kr.co.sist.user.vo.ReportVO;

@Service
public class ReportService {
	@Autowired
	private ReportDAO rDAO;
	
	
	public JSONObject ReportAdd(ReportVO rVO) {
		JSONObject json= new JSONObject();
		json.put("flag", rDAO.insertReport(rVO) == 1? true:false);
		
		return json;
	}
}
