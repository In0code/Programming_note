package kr.co.sist.run.day1205;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.co.sist.service.ServiceImpl2;

public class UseSpringContainer2 {
	   public static void main(String[] args) {
	      //1. Spring container 생성
	         ApplicationContext ac = 
	               new ClassPathXmlApplicationContext
	               ("kr/co/sist/run/day1205/applicationContext2.xml");
	      //2. Bean 얻기
	      ServiceImpl2 si2=ac.getBean(ServiceImpl2.class);
	      System.out.println("의존성 주입 받은 객체 : " +si2.getDao());
	      //3. Spring Container 닫기
	      if(ac != null) {
	         ((ClassPathXmlApplicationContext)ac).close();
	      } //end if
	   } //main
	   

	} //class
