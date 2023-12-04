package kr.co.sist.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.sist.dao.JsonDAO;
import kr.co.sist.vo.PrdVO;

public class CreateJson {

	public JSONObject createJson() {
		JSONObject jsonObj=new JSONObject();
		
		JSONArray jsonArr=new JSONArray();
		
		JsonDAO jd=new JsonDAO();
		List<PrdVO> list=jd.selectPrd();
		
		JSONObject json=null;
		for(PrdVO pVO: list){
			json=new JSONObject();
			json.put("prdNum", pVO.getPrdNum());
			json.put("prdName", pVO.getPrdName());
			json.put("price", pVO.getPrice());
			
			jsonArr.add(json);
		}//end for
		
		  jsonObj.put("dataLength", jsonArr.size());
		  jsonObj.put("data", jsonArr);
		
		
		
		return jsonObj;
	}//createJson
	
	
	public JSONObject createJson2(String name) {
		JSONObject jsonObj=new JSONObject();
		
		String hierachy="평민";
		String msg="반란 준비중";
		
		if("이동원".equals(name)) {
			hierachy="반장";
			msg="반을 이끌어 나가느라 힘듬";
		}else if("홍지성".equals(name) || "김선경".equals(name) || 
				"홍찬영".equals(name) || "임태균".equals(name)){
			hierachy="조장";
			msg="조를 이끌어 나가느라 힘듬";
		}//end else if
		
		jsonObj.put("hierachy", hierachy);
		jsonObj.put("msg", msg);
		jsonObj.put("name", name);
		
		return jsonObj;
	}//createJson2
	
	
	
}//class
