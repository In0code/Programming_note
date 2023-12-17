package kr.co.sist.user.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
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
		List<String> commentList = new ArrayList<String>();
		
		try {
			mpd = mpDAO.selectBuyDetail(code);
			mpd.setPhone(maskingPhone(mpd.getPhone()));
			
			if(mpd.getCommentcode() != null) {
				String[] select = {mpd.getSelect2_1(), mpd.getSelect2_2(), mpd.getSelect2_3(), mpd.getSelect2_4()};
				String[] comment = {"친절/매너가 좋아요.", "응답이 빨라요.", "제가 있는 곳까지 와서 거래했어요.", "거래 시간을 잘 지켜요."};
				
				if("3".equals(mpd.getSelect1())) {
					comment[0] = "친절/매너가 아쉬워요.";
					comment[1] = "응답이 느려요.";
					comment[2] = "원하지 않는 가격을 계속 요구해요.";
					comment[3] = "거래 시간을 안 지켜요.";
				}
				
				for(int i = 0; i < select.length; i++) {
					if(select[i] != null) {
						for(int j = 0; i < comment.length; j++) {
							if(String.valueOf(j+1).equals(select[i])) {
								commentList.add(comment[j]);
								break;
							}
						}
					}
				}
				
				mpd.setCmlist(commentList);
			}
			
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