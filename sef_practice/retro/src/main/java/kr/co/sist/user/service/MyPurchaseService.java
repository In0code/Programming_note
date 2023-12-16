package kr.co.sist.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public HashMap<String, Object> searchAllList(String id){
		HashMap<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("tc", (List)mpDAO.selectDealComplete(id));
		dataMap.put("pc", (List)mpDAO.selectPayComplete(id));
		dataMap.put("cc", (List)mpDAO.selectCancelComplete(id));
		
		dataMap.put("dealCnt", mpDAO.selectDealCnt(id));
		dataMap.put("payCnt", mpDAO.selectPayCnt(id));
		dataMap.put("cancelCnt", mpDAO.selectCancelCnt(id));
		
		return dataMap;
	}
	
	public MyPurchaseDomain searchBuyDetail(String code) {
		MyPurchaseDomain mpd = null;
		
		try {
			mpd = mpDAO.selectBuyDetail(code);
			mpd.setPhone(maskingPhone(mpd.getPhone()));
			
			System.out.println(mpd.getSelect1());
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return mpd;
	}
	
	public MyPurchaseDomain searchPayDetail(String code) {
		MyPurchaseDomain mpd = null;
		
		try {
			mpd = mpDAO.selectPayDetail(code);
			mpd.setPhone(maskingPhone(mpd.getPhone()));
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return mpd;
	}
	
	public JSONObject cancelBuy(String code) {
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("resultFlag",mpDAO.updateCancel(code) == 1 ? true : false);
		
		return jsonObj;
	}
	
	public String maskingPhone(String phone) {
		StringBuilder tempPhone = new StringBuilder();
		tempPhone.append(phone.substring(0,3)).append("-").append(phone.substring(3,4)).append("***-*").append(phone.substring(8));
		
		return tempPhone.toString();
	}
	
//	public JSONObject searchDealComplete(String id) {
//		JSONObject jsonObj = new JSONObject();
//		jsonObj.put("resultData", false);
//		
//		try {
//			List<MyPurchaseDomain> list = mpDAO.selectDealComplete(id);
//			JSONArray jsonArr = new JSONArray();
//			JSONObject jsonTemp = null;
//			
//			for(MyPurchaseDomain cd : list) {
//				jsonTemp = new JSONObject();
//				jsonTemp.put("buyreceiptcode", cd.getBuyreceiptcode());
//				jsonTemp.put("pcode", cd.getPcode());
//				jsonTemp.put("pname", cd.getPname());
//				jsonTemp.put("img", cd.getImg());
//				jsonTemp.put("price", cd.getPrice());
//				jsonTemp.put("payment_date", cd.getPayment_date());
//				jsonArr.add(jsonTemp);
//			}//end for
//			
//			jsonObj.put("data", jsonArr);
//			jsonObj.put("dataSize", list.size());
//			jsonObj.put("resultData", true);
//		}catch(PersistenceException pe) {
//			pe.printStackTrace();
//		}//end catch
//		
//		return jsonObj;
//	}
//
//	public JSONObject searchPayComplete(String id) {
//		JSONObject jsonObj = new JSONObject();
//		jsonObj.put("resultData", false);
//		
//		try {
//			List<MyPurchaseDomain> list = mpDAO.selectPayComplete(id);
//			JSONArray jsonArr = new JSONArray();
//			JSONObject jsonTemp = null;
//			
//			for(MyPurchaseDomain cd : list) {
//				jsonTemp = new JSONObject();
//				jsonTemp.put("safecode", cd.getSafecode());
//				jsonTemp.put("pcode", cd.getPcode());
//				jsonTemp.put("pname", cd.getPname());
//				jsonTemp.put("img", cd.getImg());
//				jsonTemp.put("price", cd.getPrice());
//				jsonTemp.put("buy_date", cd.getBuy_date());
//				jsonArr.add(jsonTemp);
//			}//end for
//			
//			jsonObj.put("data", jsonArr);
//			jsonObj.put("dataSize", list.size());
//			jsonObj.put("resultData", true);
//		}catch(PersistenceException pe) {
//			pe.printStackTrace();
//		}//end catch
//		
//		return jsonObj;
//	}
//
//	public JSONObject searchCancelComplete(String id) {
//		JSONObject jsonObj = new JSONObject();
//		jsonObj.put("resultData", false);
//		
//		try {
//			List<MyPurchaseDomain> list = mpDAO.selectCancelComplete(id);
//			JSONArray jsonArr = new JSONArray();
//			JSONObject jsonTemp = null;
//			
//			for(MyPurchaseDomain cd : list) {
//				jsonTemp = new JSONObject();
//				jsonTemp.put("safecode", cd.getSafecode());
//				jsonTemp.put("pcode", cd.getPcode());
//				jsonTemp.put("pname", cd.getPname());
//				jsonTemp.put("img", cd.getImg());
//				jsonTemp.put("price", cd.getPrice());
//				jsonTemp.put("buy_date", cd.getBuy_date());
//				jsonArr.add(jsonTemp);
//			}//end for
//			
//			jsonObj.put("data", jsonArr);
//			jsonObj.put("dataSize", list.size());
//			jsonObj.put("resultData", true);
//		}catch(PersistenceException pe) {
//			pe.printStackTrace();
//		}//end catch
//		
//		return jsonObj;
//	}
}
