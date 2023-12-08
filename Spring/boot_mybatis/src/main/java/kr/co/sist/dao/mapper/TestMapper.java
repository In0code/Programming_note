package kr.co.sist.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import jakarta.annotation.Resource;
import kr.co.sist.domain.EmpDomain;

/**
 * Mapper interface는 Mapper.xml과 연결하는 일을 수행
 * Mapper.xml에 있는 id와 동일한 이름의 method를 작성해야한다.
 * @author user
 */
@Resource
@Mapper
public interface TestMapper {
	//mapper.xml 쿼리문의 id와 method명이 같아야 연결
	public List<EmpDomain> selectAllEmp();

}
