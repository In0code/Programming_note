package day1117;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.ast.RequiresStatement;

@SuppressWarnings("serial")
public class ParamProcess extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//응답방식 (MINE-Types) 설정
		response.setContentType("text/html;charset=UTF-8");;
		
		//출력스트림 얻기
		PrintWriter out=response.getWriter();
		
		//파리메터 받기
		//POST 방식의 한글 처리
		request.setCharacterEncoding("UTF-8");
		//HTML Form Control의 name속성 유일
		String name=request.getParameter("name");
		//HTML Form Control의 name속성 중복
		String[] age=request.getParameterValues("age");
		
		if("이동원".equals(name)) {
			name="반장 : "+name;
		}else if("정민교".equals(name) || "김선경".equals(name)||"홍찬영".equals(name)||"임태균".equals(name)) {
			name="조장 : "+name;
		}else {
			name="평민 : "+name;
		}//end else
			
		//처리한 결과를 scope객체에 할당
		request.setAttribute("name", name);
		
		//1. 이동할 페이지를 설정 
		RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
		//2.이동
		rd.forward(request, response);
		
		
//		out.print("이름 : ");
//		out.print(name);
//		out.println("<br>");
//		
//		out.print("나이 : ");
//		for(int i=0; i<age.length; i++) {
//			out.print(age[i]);
//			out.print(" ");
//		}//end for
//		out.println("를 입력하셨습니다. <br>");
//		out.println("오늘은 금요일 입니다 ㅎㅎ<br>");
		
	}

}
