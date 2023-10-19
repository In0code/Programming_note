<%@page import="java.util.ArrayList"%>
<%@page import="day1004.testVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="데이터 처리 페이지- 화면을 만들지 않는다" %>

</html>
<% 
	//데이터 처리
	List<testVO> list=new ArrayList<testVO>();
	list.add(new testVO("sist_logo.png","쌍용교육센터","http://sist.co.kr"));
	list.add(new testVO("duam.png","카카오","http://daum.net"));
	list.add(new testVO("bootstrap.png","이젠 디자인하면 트위터 부트스트랩이죠잉",
			"http://getbootstrap.com"));
	
	String name="초파리다죽는다오지마라";
	//0. 처리된 데이터를 뷰페이지로 보내기 위해 scope객체에 설정한다
	request.setAttribute("data", list);
	request.setAttribute("name", name);
	
	
	//1. 이동할 페이지 설정
	RequestDispatcher rd=request.getRequestDispatcher("forward_b.jsp");
	//2. 이동
	rd.forward(request, response);

%>