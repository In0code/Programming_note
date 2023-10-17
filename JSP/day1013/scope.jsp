<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="useBean 액션 태그의 scope 속성"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.0.70/servlet_prj/common/main/favicon-32x32.png">
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
   $(function() {
      $("#cntBtn").click(function() {
         
      });
   });
</script>
</head>
<body>
<jsp:useBean id="cVO" class="day1013.CounterVO" scope="application"/>
<jsp:setProperty property="cnt" name="cVO" value="1"/>

<button id="cntBtn" type="button" class="btn btn-primary position-relative" style="margin-top: 20px;">
  당신은 이페이지에 <jsp:getProperty property="cnt" name="cVO"/>번째 방문자 입니다.
  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
    <jsp:getProperty property="cnt" name="cVO"/>
    <span class="visually-hidden">방문자 수</span>
  </span>
</button><br>
<div>
당신은 
<%
String num = String.valueOf(cVO.getCnt());
for(int i = 0; i < num.length(); i++) { %>
   <img src="images/num_<%=num.charAt(i)%>.png">
<%}%>
번째 방문자 입니다.
<%-- 당신은 <%=cVO.getCnt() %>번째 방문자입니다. --%>
</div>

<a href="test_scope_session.jsp">session 사용</a>
<%-- <%
RequestDispatcher rd = request.getRequestDispatcher("test_scope_request.jsp");
rd.forward(request, response);
%> --%>
</body>
</html>