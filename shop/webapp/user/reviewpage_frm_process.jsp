<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.UserReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="기상청 RSS" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.142/jsp_prj/common/main/favicon.png">
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
<jsp:useBean id="sVO" class="user.vo.SummaryVO" scope="page"></jsp:useBean> 
<jsp:setProperty property="*" name="sVO"/>
<body>
<%

UserReviewDAO uDAO = UserReviewDAO.getInstance(); 
String review=sVO.getReview();
String gcode="BC0001";//받는 쥐코드;
String id=(String)session.getAttribute("sesId");
int star = sVO.getStar();
int rcode = sVO.getRcode();
System.out.println("+++++"+request.getParameter("reviewImg")+"-------");
try{
	if(rcode!=0){
		uDAO.updateReivew2(review, star, rcode);
	} else if (rcode==0) {
		rcode=uDAO.selectSeqRcode();
		uDAO.insertNoImgReview(gcode, review, id, rcode,star);
	}
	

}catch (SQLException se){
	se.printStackTrace();
}

%>
</body>
<span>리뷰 등록 완료</span>
</html>