package day1113;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

import kr.co.sist.domain.CarDomain2;

public class ExamService {

	public List<CarDomain2> useSubqueryJoin(String country) {
		List<CarDomain2> list=null;
		
		ExamDAO3 eDAO=ExamDAO3.getInstance();
		try {
			list=eDAO.subqueryJoin(country);
			
			CarDomain2 cd=null;
			String option="";
			for(int i=0; i<list.size(); i++) {
				cd=list.get(i);
				option=cd.getCar_option();
				
				if(option.length() > 19 ) {
					cd.setCar_option(option.substring(0, 18)+"...");
					list.set(i, cd);
				}//end if
			}//end for
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//selectSubquery
}//class
