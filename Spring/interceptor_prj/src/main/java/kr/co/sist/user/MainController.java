package kr.co.sist.user;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping( value="/index.do", method= { GET, POST} )
	public String userMain() {
		
		return "user/main";
	}//userMain
	
	
}//class
