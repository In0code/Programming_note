package kr.co.sist.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.domain.CarDomain;

@Component
public class AjaxCar {
	
	public List<String> selectMaker(String country)throws PersistenceException{
		List<String> list=null;

		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		list=ss.selectList("kr.co.sist.car.selectMaker",country);
				
		mbh.closeHandler(ss);
		return list;
	}//selectMaker

	public List<String> selectModel(String maker)throws PersistenceException{
		List<String> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		list=ss.selectList("kr.co.sist.car.selectModel",maker);
		
		mbh.closeHandler(ss);
		return list;
	}//selectMaker
	
	public List<CarDomain> selectCar(String model)throws PersistenceException{
		List<CarDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		list=ss.selectList("kr.co.sist.car.selectCar",model);
		
		mbh.closeHandler(ss);
		return list;
	}//selectMaker
	
	
	public static void main(String[] args) {
//		System.out.println(new AjaxCar().selectMaker("국산"));
		System.out.println(new AjaxCar().selectCar("기아"));
		
	}//main
	
}//class
