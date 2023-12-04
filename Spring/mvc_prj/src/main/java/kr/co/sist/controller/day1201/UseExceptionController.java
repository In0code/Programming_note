package kr.co.sist.controller.day1201;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UseExceptionController {
	
	@GetMapping("/day1201/use_exception.do")
	public String work() throws Exception {
		
		if(new Random().nextBoolean()) {
			throw new Exception("앗! 예외발생");
		}//end if
		return "day1201/result";
	}//work
	
	@ExceptionHandler( Exception.class )
	public ModelAndView exceptionProcess(Exception e) {
		
		e.printStackTrace();
		
		ModelAndView mav=new ModelAndView("err/err_result");
		mav.addObject("msg",e.getMessage());
		
		return mav;
	}////exceptionProcess
	
}//class
