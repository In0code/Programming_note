<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="세션의 값을 삭제하는 일" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.137/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>
<body>
<%
//세션의 값 삭제 ( 브라우저에 할당된 세션은 살아있고 안의 값만 삭제된다. )
session.removeAttribute("name");
session.invalidate(); //브라우저에 할당된 세션 자체가 무효화된다. => error
%>
<%-- 
remove 한 후에는 값을 얻는 행동을 할 수 있지만, invalidate 된 이후에는 값을 얻는 행동을 할 수 없다
삭제된 이후의 값 : <%= session.getAttribute("name") %><br>
 <%= session.getAttribute("age") %><br> --%>
 <a href="set_session.jsp">세션 값 설정</a>
 <a href="get_session.jsp">세션 값 얻기</a>
</body>
</html>