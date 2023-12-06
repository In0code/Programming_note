package kr.co.sist.run.day1205;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.co.sist.service.ServiceImpl3;
import kr.co.sist.service.ServiceImpl4;

public class UseSpringContainer3 {

	public static void main(String[] args) {


		ApplicationContext ac=new ClassPathXmlApplicationContext
				("kr/co/sist/run/day1205/applicationContext2.xml");
		
		ServiceImpl3 si3=ac.getBean("si3",ServiceImpl3.class);
		System.out.println("정수 : "+si3.getNum()+", 문자열 : "+si3.getName());
		
		ServiceImpl3 si4=ac.getBean("si4",ServiceImpl3.class);
		System.out.println("정수 : "+si4.getNum()+", 문자열 : "+si4.getName());
		
		ServiceImpl3 si5=ac.getBean("si5",ServiceImpl3.class);
		System.out.println(si5.getListName());
		
		ServiceImpl3 si5_1=ac.getBean("si5_1",ServiceImpl3.class);
		System.out.println(si5_1.getSetName());
		
		ServiceImpl3 si6=ac.getBean("si6",ServiceImpl3.class);
		System.out.println(si6.getMap());
		
		//////////////////////singleton///////////////////////////////
		ServiceImpl4 si7=ac.getBean(ServiceImpl4.class);
		
		
		if(ac != null) {
			((ClassPathXmlApplicationContext)ac).close();
		}//end if
		
	}//main

}//class
