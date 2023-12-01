package kr.co.sist.controller.day1130;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sist.service.CreateJson;

@Controller
public class AjaxController {

	@GetMapping("/day1130/use_ajax.do")
	public String ajax() {
		
		return "day1130/use_ajax";
	}//ajax
	
	@GetMapping("/day1130/create_json.do")
	public String returnData(Model model) {
		
		CreateJson cj=new CreateJson();
		JSONObject jsonObj=cj.createJson();
		
		model.addAttribute("jsonObj",jsonObj.toJSONString());
		
		
		
		return "day1130/result_json";
	}//returnData
	
}//class
