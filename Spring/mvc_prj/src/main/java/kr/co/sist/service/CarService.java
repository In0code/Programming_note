package kr.co.sist.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.dao.AjaxCar;
import kr.co.sist.domain.CarDomain;

@Component
public class CarService {

	@Autowired(required = false )
	private AjaxCar ac;
	
	public JSONObject searchMaker(String country){
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("resultData", false);
		
		try {
			List<String> makerList=ac.selectMaker(country);
			JSONArray jsonArr=new JSONArray();
			JSONObject jsonTemp=null;
			
			for(String maker : makerList ) {
				jsonTemp=new JSONObject();
				jsonTemp.put("maker", maker);
				jsonArr.add(jsonTemp);
			}//end for
			jsonObj.put("data", jsonArr);
			jsonObj.put("dataSize", makerList.size());
			jsonObj.put("resultData", true);
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
			
		
		return jsonObj;
	}//searchMaker
	
	public JSONObject searchModel(String maker){
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("resultData", false);
		
		try {
			List<String> modelList=ac.selectModel(maker);
			JSONArray jsonArr=new JSONArray();
			JSONObject jsonTemp=null;
			
			for(String model : modelList ) {
				jsonTemp=new JSONObject();
				jsonTemp.put("model", model);
				jsonArr.add(jsonTemp);
			}//end for
			jsonObj.put("data", jsonArr);
			jsonObj.put("dataSize", modelList.size());
			jsonObj.put("resultData", true);
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		
		return jsonObj;
	}//searchMaker
	
	public JSONObject searchCar(String model){
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("resultData", false);
		
		try {
			List<CarDomain> carList=ac.selectCar(model);
			JSONArray jsonArr=new JSONArray();
			JSONObject jsonTemp=null;
			
			for(CarDomain cd : carList ) {
				jsonTemp=new JSONObject();
				jsonTemp.put("price", cd.getPrice());
				jsonTemp.put("cc",cd.getCc());
				jsonTemp.put("car_year", cd.getCar_year());
				jsonTemp.put("car_option", cd.getCar_option());
				jsonTemp.put("car_img", cd.getCar_img());
				jsonTemp.put("hiredate", cd.getHiredate());
				jsonArr.add(jsonTemp);
			}//end for
			
			jsonObj.put("data", jsonArr);
			jsonObj.put("dataSize", carList.size());
			jsonObj.put("resultData", true);
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return jsonObj;
	}//searchCar
	
	
}//class
