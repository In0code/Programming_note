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
	
	$("#addBtn").click(function(){
		$("#frm").submit();
	})//click
	
	
	$('#context').keyup(function (e) {
		let content = $("#context").val();
	    
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$('.textCount').text('0자');
	    } else {
	    	$('.textCount').text(content.length + '자');
	    }
	    
	    // 글자수 제한
	    if (content.length > 3000) {
	    	// 200자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 3000));
	        // 200자 넘으면 알림창 뜨도록
	        alert('글자수는 3000자까지 입력 가능합니다.');
	    };
	});
   
   
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

<div style=" font-size: 35px; font-weight: bold; color: #333333;  margin-top: 30px; margin-bottom:10px ">1:1 문의내용</div>
	<hr style="border: solid 2px #000000; margin-top:10px; width: 100%; margin: 0px auto">

	<div style="font-size: 20px; margin-top: 15px">유형선택</div>
<form id="frm" action="inquiry_write_success.do" method="post">
		<select id="type" name="type" style="margin-top: 15px">
	<option value="" selected disabled hidden='hidden'>유형을 선택해주세요</option>
	<option value="거래신고">거래신고</option>
	<option value="회원/계정">회원/계정</option>
	<option value="안전결제">안전결제</option>
	<option value="사기신고">"사기신고"</option>
	<option value="오류/제안">오류/제안</option>
	<option value="악성후기">악성후기</option>
	<option value="기타">기타</option>
	</select>
     <br>
     <div  style="font-size: 20px; margin-top: 15px">문의 내용</div>
	<textarea id="context" name="context" style="width:780px; height:300px; resize: none; border: 1px solid #EEEEEE; margin-top: 15px; border-radius: 5px" maxlength="3000" rows="" cols="" placeholder="문의 내용을 입력해주세요."></textarea>
	
	<p class="textCount" id="text_size" style="margin-left:670px; margin-top:-35px; color: #AAAAAA ; ">0자 </p>
    <p class="textTotal" style="margin-left: 700px; margin-top: -44px; color: #AAAAAA; padding-left: 23px">/200자</p>
  
   
	</form>
      <input type="button" id="addBtn" value="등록" style="color:#FFFFFF; background-color:#333333; margin-left: 800px; margin-top:-54px" class="btn btn-dark">
 		

</div>
</div>


</main>
 <jsp:include page="/common/cdn/footer.jsp"/> 
</body>
</html>