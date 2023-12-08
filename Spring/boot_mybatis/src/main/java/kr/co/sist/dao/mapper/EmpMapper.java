package kr.co.sist.dao.mapper;

import org.apache.ibatis.annotations.Mapper;

import jakarta.annotation.Resource;
import kr.co.sist.vo.EmpVO;

@Resource
@Mapper
public interface EmpMapper {
	
	public int insertEmp(EmpVO eVO);
}
