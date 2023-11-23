package day1122;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 특정 서블렛만 사용할 수 있는 IninParameter
 * @author user
 *
 */
@SuppressWarnings("serial")
public class TestInitParam extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. ServletConfig 얻기
		ServletConfig sc=getServletConfig();
		//2. 값 얻기
		String driver=sc.getInitParameter("driverName");
		String url=sc.getInitParameter("url");
		String username=sc.getInitParameter("username");
		String password=sc.getInitParameter("password");
		
		System.out.println(driver);
		System.out.println(url);
		System.out.println(username);
		System.out.println(password);
		
		
	}//doGet

}//class
