package kr.co.sist.run.day1206;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.co.sist.service.Service;
import kr.co.sist.service.ServiceImpl5;

public class UseSpringContainer4 {

	public static void main(String[] args) {
	
		//1. Spring Container 생성
		ApplicationContext ac=new ClassPathXmlApplicationContext
				("kr/co/sist/run/day1206/applicationContext3.xml");
		//2. 의존성 주입받을 객체를 얻어 사용
		Service service=ac.getBean(ServiceImpl5.class);
		service.addName("김주민");
		System.out.println(service.searchName());
		
		
		//3. Spring Container 닫기
		if(ac != null) {
			((ClassPathXmlApplicationContext)ac).close();
		}//end if
	}//main
	
}//class
