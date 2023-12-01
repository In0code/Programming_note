package kr.co.sist.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.sist.vo.PrdVO;

public class JsonDAO {

	public List<PrdVO> selectPrd(){
		
		List<PrdVO> list=new ArrayList<PrdVO>();
		
		PrdVO p=new PrdVO("K_0101", "기계식 청축 키보드", 35000);
		PrdVO p1=new PrdVO("K_0102", "기계식 갈축 키보드", 35500);
		PrdVO p2=new PrdVO("K_0103", "기계식 흑축 키보드", 30000);
		PrdVO p3=new PrdVO("K_0104", "기계식 적축 키보드", 40000);
		
		list.add(p);
		list.add(p1);
		list.add(p2);
		list.add(p3);
		
		
		return list;
	}//selectPrd
	
}//class
