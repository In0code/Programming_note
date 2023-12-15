package kr.co.sist.user.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.MyPurchaseDAO;
import kr.co.sist.user.domain.MyPurchaseDomain;

@Service
public class MyPurchaseService {
	
	@Autowired
	private MyPurchaseDAO mpDAO;
	
	public JSONObject searchDealComplete(String id) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("resultData", false);
		
		try {
			List<MyPurchaseDomain> list = mpDAO.selectDealComplete(id);
			JSONArray jsonArr = new JSONArray();
			JSONObject jsonTemp = null;
			
			for(MyPurchaseDomain cd : list) {
				jsonTemp = new JSONObject();
				jsonTemp.put("buyreceiptcode", cd.getBuyreceiptcode());
				jsonTemp.put("pcode", cd.getPcode());
				jsonTemp.put("pname", cd.getPname());
				jsonTemp.put("img", cd.getImg());
				jsonTemp.put("price", cd.getPrice());
				jsonTemp.put("payment_date", cd.getPayment_date());
				jsonArr.add(jsonTemp);
			}//end for
			
			jsonObj.put("data", jsonArr);
			jsonObj.put("dataSize", list.size());
			jsonObj.put("resultData", true);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return jsonObj;
	}

	public JSONObject searchPayComplete(String id) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("resultData", false);
		
		try {
			List<MyPurchaseDomain> list = mpDAO.selectPayComplete(id);
			JSONArray jsonArr = new JSONArray();
			JSONObject jsonTemp = null;
			
			for(MyPurchaseDomain cd : list) {
				jsonTemp = new JSONObject();
				jsonTemp.put("safecode", cd.getSafecode());
				jsonTemp.put("pcode", cd.getPcode());
				jsonTemp.put("pname", cd.getPname());
				jsonTemp.put("img", cd.getImg());
				jsonTemp.put("price", cd.getPrice());
				jsonTemp.put("buy_date", cd.getBuy_date());
				jsonArr.add(jsonTemp);
			}//end for
			
			jsonObj.put("data", jsonArr);
			jsonObj.put("dataSize", list.size());
			jsonObj.put("resultData", true);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return jsonObj;
	}

	public JSONObject searchCancelComplete(String id) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("resultData", false);
		
		try {
			List<MyPurchaseDomain> list = mpDAO.selectCancelComplete(id);
			JSONArray jsonArr = new JSONArray();
			JSONObject jsonTemp = null;
			
			for(MyPurchaseDomain cd : list) {
				jsonTemp = new JSONObject();
				jsonTemp.put("safecode", cd.getSafecode());
				jsonTemp.put("pcode", cd.getPcode());
				jsonTemp.put("pname", cd.getPname());
				jsonTemp.put("img", cd.getImg());
				jsonTemp.put("price", cd.getPrice());
				jsonTemp.put("buy_date", cd.getBuy_date());
				jsonArr.add(jsonTemp);
			}//end for
			
			jsonObj.put("data", jsonArr);
			jsonObj.put("dataSize", list.size());
			jsonObj.put("resultData", true);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return jsonObj;
	}
}
