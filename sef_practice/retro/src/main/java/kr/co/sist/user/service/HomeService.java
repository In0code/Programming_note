package kr.co.sist.user.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.HomeDAO;
import kr.co.sist.user.domain.GoodsDomain;

@Service
public class HomeService {
	
	@Autowired
	private HomeDAO hDAO;
	
	public List<GoodsDomain> searchNewProduct(){
		List<GoodsDomain> list = null;
		
		try {
			list = hDAO.selectNewProduct();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	
	public List<GoodsDomain> searchAllProduct(){
		List<GoodsDomain> list = new ArrayList<GoodsDomain>();
		Random random = new Random();
		int[] idxArr = new int[9];
		
		
		try {
			List<GoodsDomain> allList = hDAO.selectAllProduct();
			for(int i = 0; i < idxArr.length ; i++) {
				idxArr[i] = random.nextInt(allList.size());
				for(int j = 0; j < i; j++) {
					if(idxArr[j] == idxArr[i]) {
						i--;
						break;
					}
				}
			}
			for(int i = 0; i < idxArr.length; i++) {
				list.add(hDAO.selectAllProduct().get(idxArr[i]));
			}
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	
	public void modifyDailyDate(){
	
		
		hDAO.insertDailyDate();
	}
	

}
