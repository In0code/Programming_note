package day0927;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1.HttpServlet 상속 받는다.
@SuppressWarnings("serial")
public class CallTest extends HttpServlet {
	
	//2. 요청 방식을 처리할 수 있는 method override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//3.응답 방식을 설정(MIME-type 설정)
		response.setContentType("text/html;charset=UTF-8");
		
		//4.출력스트립을 얻는다.
		PrintWriter out = response.getWriter();
		
		//5. 출력 내용 만들기
		out.println("<html>");
		out.println("<head>");
		out.println("<title>안녕 서블릿!!!</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<strong>GET방식의 요청</strong><br>");
		out.println("<a href='#void' onclick='history.back()'>뒤로</a>");
		out.println("</body>");
		out.println("</html>");
	}

	//2. 요청 방식을 처리할 수 있는 method override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//3.응답 방식을 설정
		response.setContentType("text/html;charset=UTF-8");
		
		//4.출력스트립을 얻는다.
		PrintWriter out = response.getWriter();
		
		//5. 출력 내용 만들기
		out.println("<html>");
		out.println("<head>");
		out.println("<title>안녕 서블릿!!!</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<strong style='color:#FF0000;font-weight: bold'>POST방식의 요청</strong><br>");
		out.println("<a href='#void' onclick='history.back()'>뒤로</a>");
		out.println("</body>");
		out.println("</html>");
		
	}

}
