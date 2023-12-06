package kr.co.sist.service;

public class ServiceImpl4 {

	private static ServiceImpl4 si4;
	
	private ServiceImpl4() {
		System.out.println("private 생성자");
	}//ServiceImpl4
	
	public static ServiceImpl4 getInstance() {
		if( si4 == null) {
			si4=new ServiceImpl4();
		}//end if
		System.out.println("getInstance");
		return si4;
	}//getInstance
	
	
	
}//class
