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
	
}//class
