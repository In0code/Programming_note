package kr.co.sist.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

public class AdminLoginCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean nextFlag=false;
		Object objId=WebUtils.getSessionAttribute(request, "adminId");
		
		nextFlag = objId != null; //session이 있으면 true, 없다면 false
		if(!nextFlag) { //session이 엄서용이면
			response.sendRedirect
			//("http://localhost/interceptor_prj/admin/login_frm.do");
			("http://localhost/interceptor_prj/index.do");
		}//end if
		
		
		return nextFlag; //true - 다음으로 진행, false - 멈춤
	}//preHandle

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}//postHandle

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}//afterCompletion

	
}//class
