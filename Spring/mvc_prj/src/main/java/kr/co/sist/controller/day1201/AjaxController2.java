package kr.co.sist.controller.day1201;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.service.CarService;
import kr.co.sist.service.CreateJson;

@Controller
public class AjaxController2 {
	
	@Autowired(required = false)
	private CarService cs;

	@GetMapping("/day1201/use_ajax2.do")
	public String ajaxFrm() {
		
		return "day1201/ajax_frm";
	}//ajaxFrm
	
	@ResponseBody
	@GetMapping("/day1201/use_reponse_json.do")
	public String ajaxFrmProcess(String name) {
		
		CreateJson cj=new CreateJson();
		JSONObject json=cj.createJson2(name);
		
		return json.toJSONString();
	}//ajaxFrm
	
	@GetMapping("/day1201/use_ajax3.do")
	public String searchCar() {
		
		return "day1201/car_list";
	}//searchCar
	
	@ResponseBody
	@PostMapping("/day1201/search_maker.do")
	public String searchMaker(String country) {
		
		return cs.searchMaker(country).toJSONString();
	}//searchMaker
	
	@ResponseBody
	@PostMapping("/day1201/search_model.do")
	public String searchModel(String maker) {
		
		return cs.searchModel(maker).toJSONString();
	}//searchModel
	
	@ResponseBody
	@PostMapping("/day1204/search_car.do")
	public String searchCar(String model) {
		
		return cs.searchCar(model).toJSONString();
	}//searchModel
	
}//class
