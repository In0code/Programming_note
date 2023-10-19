<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 페이지 지시자 설정 --%>
<%@ page info="공통 디자인을 사용하는 jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/jsp/cdn.jsp"/> <!-- 상위 개념으로 설정해서 사용하기 편해짐 -->
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>
<body>
<div>
외부 JSP : 공통 디자인 사용
<div>
<jsp:inlcude page="include_b.jsp"/>
</div>
외부 JSP : 공통 디자인을 사용
</div>
</body>
</html>