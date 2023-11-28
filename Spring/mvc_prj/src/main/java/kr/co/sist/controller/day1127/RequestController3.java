package kr.co.sist.controller.day1127;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.sist.vo.TestVO;

@Controller
public class RequestController3 {
	
	@PostMapping("/day1127/use_post_req.do")
	//@RequestMapping(value="/day1125/use_post_req.do" method=RequestMethod.Post)
	public String postReqParm(HttpServletRequest request, String name) throws UnsupportedEncodingException {
		//POST방식의 한글 처리 : request가 사용되기 전에 
//		request.setCharacterEncoding("UTF-8");
		
		
		System.out.println("request를 직접 사용하지 않음 "+ name);
		//POST 방식의 parameter 받기 => 한글깨짐
			System.out.println("----------POST방식-----------");
			String name1=request.getParameter("name");
			System.out.println("이름이 유일 "+ name1);
			//name 속성이 중복
			String[] age=request.getParameterValues("age");
			System.out.println("이름이 중복");
			if(age != null) {
				for(String i :age) {
					System.out.println(i);
				}//end for
			}//end if
		
		return "day1127/use_post_req";
	}//postReqParm
	
	@PostMapping("/day1127/use_single_req.do")
	public String useSingleReq(String name, int[] age) {
		
		System.out.println("단일형 값 받기");
		System.out.println("이름 "+name);
		if( age != null) {
			for(int i :age) {
				System.out.println(i);
			}//end for
		}//end if
		
		return "day1127/use_single_req";
	}//useSingleReq
	
	@PostMapping("/day1127/use_vo_req.do")
	public String useVOReq(TestVO tVO) {
		
		System.out.println("VO 값 받기");
		System.out.println("이름 "+tVO.getName());
		if( tVO.getAge() != null) {
			for(int i :tVO.getAge()) {
				System.out.println(i);
			}//end for
		}//end if
		
		return "day1127/use_vo_req";
	}//useSingleReq
	
	
}//class
