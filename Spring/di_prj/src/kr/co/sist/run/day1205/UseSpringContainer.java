package kr.co.sist.run.day1205;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.co.sist.dao.DAO;
import kr.co.sist.dao.MysqlDAOImpl;
import kr.co.sist.dao.OracleDAOImpl;
import kr.co.sist.service.Service;
import kr.co.sist.service.ServiceImpl;

public class UseSpringContainer {

	public static void main(String[] args) {
		// 1. 설정 파일을 넣어 Spring Container 생성
		ApplicationContext ac=new ClassPathXmlApplicationContext
				("kr/co/sist/run/day1205/applicationContext.xml");
		
		//2. 의존성 주입 받은 객체를 얻는다.
		Service service = ac.getBean(ServiceImpl.class);
		
		//3. 의존성 주입 받은 객체를 사용한다.
		service.addName("임태균");
		System.out.println(service.searchName());
		//scope="singleton" 은 해당 객체를 여러번 사용하더라도 하나의 객체만 생성되고 사용.
		DAO dao=ac.getBean(OracleDAOImpl.class);
		DAO dao2=ac.getBean(OracleDAOImpl.class);
		DAO dao3=ac.getBean(OracleDAOImpl.class);
		
		//scope="prototype" 은 해당 객체를 사용할 때마다 계속 객체가 생성되고 사용.
		DAO mdao=ac.getBean("md",MysqlDAOImpl.class);
		DAO mdao2=ac.getBean("md2",MysqlDAOImpl.class);
		DAO mdao3=ac.getBean("md",MysqlDAOImpl.class);
	}//main

}//class
