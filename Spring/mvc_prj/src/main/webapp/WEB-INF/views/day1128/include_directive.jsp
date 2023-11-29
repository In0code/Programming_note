<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.137/mvc_prj/common/main/favicon.png">
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
<div>
외부 JSP
</div>
<div>
webapp의 하위에 존재하는 JSP<br/> ( Data를 가지고 있지 않은 JSP )<br/>
<%@ include file="/day1128_webapp/include_out.jsp" %>
</div>
<div>
WEB-INF의 하위에 존재하는 JSP<br/>( Data를 가지고 있는 JSP)<br/>
<%@ include file="/WEB-INF/views/day1128/data_view.jsp" %>
</div>
<div>
외부 JSP <%= msg %>
</div>
</body>
</html>