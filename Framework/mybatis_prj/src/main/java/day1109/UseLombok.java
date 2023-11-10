package day1109;

import kr.co.sist.vo.TestVO;

public class UseLombok {

	public static void main(String[] args) {

		TestVO tVO=new TestVO();
		tVO.setAddr("우리집");
		tVO.setNum(1);
		tVO.setName("김짱구");
		
		System.out.println(tVO);
		System.out.println(tVO.getNum()+" / "+tVO.getName()+" / "+tVO.getAddr());
				
		
	}//main

}//class
