package kr.co.sist.run;

import kr.co.sist.assembly.Assembly;
import kr.co.sist.service.Service;

public class Run {

	
	
	public static void main(String[] args) {
		//Assembly를 사용하여 의존성 주입받은 Service 객체를 얻는다
		Assembly ass=new Assembly();
		Service service= ass.getBean();
		
		service.addName("김주민");
		for(String name : service.searchName()) {
			System.out.println(name);
		}//end for
		
	}//main

}//class
