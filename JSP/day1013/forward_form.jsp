<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.0.70/jsp_prj/common/main/favicon-32x32.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
	});//click
});//ready
</script>

</head>
<body>
<%
String serverName=request.getServerName();
String nameTitle="이름";
String ageTitle="나이";
if( !serverName.equals("localhost") && !serverName.equals("127.0.0.1")){
	nameTitle="name";
	ageTitle="age";
}
%>

<form action="forward_form_process.jsp" name="frm" id="frm">
<label><%=nameTitle %></label>
<input type="text" name="name" class="inputBox"/><br>
<label><%=ageTitle %></label>
<input type="text" name="age" class="inputBox"/><br>
<input type="button" value="submit" class="btn btn-success" id="btn"/>
</form>


<a href="http://localhost/jsp_prj/day1013/forward_form.jsp">국내</a>
<a href="http://192.168.0.70/jsp_prj/day1013/forward_form.jsp">국외</a>

</body>
</html>







