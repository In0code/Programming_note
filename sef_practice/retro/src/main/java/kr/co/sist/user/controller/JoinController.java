package kr.co.sist.user.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.user.service.join.JoinService;
import kr.co.sist.user.vo.JoinVO;

@Controller
public class JoinController {
	
	private static JoinController jc;
	@Autowired
	private JoinService js;
	
	private JoinController() {
	}
	
	public static JoinController getInstance() {
		if(jc == null) {
			jc = new JoinController();
		}
		return jc;
	}
	
	@GetMapping("/user_join.do")
	public String joinFrm() {		
		return "user/join/join_frm";
	}
	
	@ResponseBody
	@PostMapping("/user_join_chk.do")
	public String joinComplete(JoinVO jVO) {
		JSONObject json = js.chkInfo(jVO);
		return json.toJSONString();
	}
	
	@PostMapping("/user_join_process.do")
	public String joinUser(JoinVO jVO) {
		js.addUser(jVO);
		return "user/join/join_success";
	}
	
}
