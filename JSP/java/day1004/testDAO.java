package day1004;

import java.util.ArrayList;
import java.util.List;

public class testDAO {
	public List<testVO> selectURL(){
		List<testVO> list=new ArrayList<testVO>();
		list.add(new testVO("daum.png",
				"대한민국의 포털 사이트 이다. 한메일 이라는 이름으로 최초의 웹메일 서비스를 오픈",
				"daum.net"));
		
		list.add(new testVO("sist_logo.png",
				"쌍용 교육센터","sist.co.kr"));
		
		list.add(new testVO("bootstrap.png",
				"웹 사이트를 쉽게 제작할 수 있게 도와주는 CSS Framework",
				"getbootstrap.com  "));
		return list;
		
		
		
		
	}//selectURL

}//class
