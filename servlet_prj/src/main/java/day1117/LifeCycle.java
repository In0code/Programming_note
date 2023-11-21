package day1117;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class LifeCycle extends HttpServlet {
	public void init() {
		System.out.println("-----init------최초 접속자에 의해 한 번만 호출된다");
	}

	public void destroy() {
		System.out.println("-----destroy------서버가 종료될 때 한 번만 호출 된다");
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----doGet,doPost,service------모든 접속자에 의해 여러번 호출");
		System.out.println(request.getRemoteAddr());
	}

}
