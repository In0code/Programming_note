<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.142/mvc_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
	.inputBox {
	 border:none;
	  border-bottom: 1px solid #ebebeb;
	  font-size: 15px;
	  line-height: 22px;
	  width: 450px; 
	  height:40px; 
	  outline: none;
	  margin-top: 15px;
	  font-family:pretendard;
	}
	label{font-weight: bold; font-family:Pretendard Variable}
	

a {
  text-decoration: none;
  color: #222222
}
a:hover { color:#222222 }

table, tr, td{
 border:none;
}

textarea:focus {
  outline: none;
}
</style>
<script type="text/javascript">
$(function(){
   
   //답변 완료 상태 시 수정 및 삭제 버튼 숨기기
   <c:if test="${not empty requestScope.answer}">
   $("#updateBtn").hide();                 // 아니면 거절 사유 숨김
   $("#deleteBtn").hide();                 // 아니면 거절 사유 숨김
	</c:if>
   
	$("#updateBtn").click(function(){
		
		document.frm.action="inquiry_updt_frm.do";
		
		$("#frm").submit();
		
	});//click
	
	$("#deleteBtn").click(function(){
		document.frm.action="inquiry_delete_frm.do";
		$("#frm").submit();
		
	});//click
   
});//ready
</script>


</head>
 <c:import url="/common/cdn/cdn.jsp" /> 

 <jsp:include page="/common/cdn/header.jsp"/>
 
<body>
<main class="relative flex-grow border-b-2"
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div class="flex mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
		<c:import url="http://localhost/retro_prj/common/cdn/mypage_sidebar.jsp" />
		<div class="w-full flex-grow">
<form id="frm" name="frm" action="" method="post">
<input type="hidden" value="${icode}" name="inquiryCode">
<div style=" font-size:  25px; font-weight: bold; color: #333333;  margin-top: 30px; margin-bottom:10px ">1:1 문의내용</div>
<hr style="border: solid 2px #000000; margin-top:10px; width: 100%; margin: 0px auto">

<div style="margin-top: 30px"><span style="font-size: 18px">유형 : <c:out value="${type}"/> <br>상태 : <c:out value="${status eq 'Y'? '답변완료':'미답변'}"/></span></div>
<div style="font-size: 13px;margin-top: 20px">문의 내용</div> <div style="font-size: 13px;margin-left: 660px; margin-top: -20px">문의일&nbsp;&nbsp;<c:out value="${askdate}"/></div>
             
 
<textarea name="context" style="width:780px; height:180px; resize: none; border: 1px solid #EEEEEE; margin-top: 10px; border-radius: 5px" maxlength="3000" rows="" cols=""><c:out value="${context}"/></textarea>

<c:if test="${not empty answer}">

		<div style="font-size: 13px;margin-top: 10px">답변 내용</div>
       <textarea style="width:780px; height:180px; resize: none; border: 1px solid #EEEEEE; margin-top: 10px; border-radius: 5px" maxlength="200" rows="" cols=""><c:out value="${answer}"/></textarea>
      </c:if> 

<div style="margin-top: 20px; margin-left: 800px" >
 <input type="button" id="updateBtn" style="color:#FFFFFF; background-color:#333333; display:"  class="btn btn-dark" value="수정">
 <input type="button" id="deleteBtn"  style="color:#FFFFFF; background-color:#333333;" class="btn btn-dark" value="삭제">
  </div>
  
  <br>
           





</form>
</div>
</div>


</main>
 <jsp:include page="/common/cdn/footer.jsp"/> 
</body>
</html>