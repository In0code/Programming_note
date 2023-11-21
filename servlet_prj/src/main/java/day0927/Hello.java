package day0927;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Hello extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		// 4. 접속자에게 출력하기 위해 출력 스트림을 얻기
		PrintWriter out = response.getWriter();
		// 5. 접속자에게 응답할 내용을 만든다
		out.println("<html>");
		out.println("<head>");
		out.println("<title>안녕서블릿!!!</title>");
		out.println("</head>");
		out.println("<body>");
		String name = "김인영";
		out.println("<strong>" + name + "</strong>님 안녕하세요?<br>");
		out.println("hello Servlet!!!");
		out.println("<body>");
		out.println("</html>");
		System.out.println("request : "+request);
		System.out.println("response : "+response);
	}

}
