package kr.co.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.sist.dao.mapper.EmpMapper;
import kr.co.sist.vo.EmpVO;

@Service
public class EmpService {
	
	@Autowired
	private EmpMapper eMapper;
	
	@Transactional
	public int addEmp(EmpVO eVO) {
		int cnt = 0;
		cnt = eMapper.insertEmp(eVO);
		
		return cnt;
	}

}
