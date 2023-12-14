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


</style>
<script type="text/javascript">
$(function(){
   $("#findIdBtn").click(function() {
	   $("#frm").submit();
   })
   
   $("#ibtn").click(function(){
	   location.href=""
   })
   
   $("#writebtn").click(function(){
	   location.href="inquiry_write_frm.do"
   })
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
	<input type="button" id="writebtn" value="문의작성" style="color:#FFFFFF; background-color:#333333; margin-left: 1000px; margin-bottom: 5px" class="btn btn-dark">
	<hr style="border: solid 2px #000000; margin-top:10px; width: 100%; margin: 0px auto">

		<table style="border-left: none; border-right: none; border-top: none;">

       

      	<c:if test="${ empty inquiryList}">
      	 <p class="message" style="width:1220px;position: absolute; top:180px">작성한 문의 내용이 없습니다.</p>
      	</c:if> 
      
 			<c:forEach var="inq" items="${inquiryList}" varStatus="i"> 

        	 <tr style="text-align:  center; border-left:none; border-right: none; border-top: none; ">
                
                <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis; border-left:none; border-right: none;border-top: none; width:30px"><span class="" style="font-size: 18px" >
                	<a href="inquiry_detail_frm.do?icode=${inq.inquiryCode}" ><<c:out value="${inq.type}"/>></a></span></td>
                <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis; border-left:none; border-right: none;border-top: none; width:50px; text-align:center; "><span class="" style="font-size: 18px"> <c:out value="" />
                   <a href="inquiry_detail_frm.do?icode=${inq.inquiryCode}" ><c:out value="${inq.context}"/></a>  </span></td>
                <td style="border-left:none; border-right: none;border-top: none; text-align:right; "><span class="txtNum" style="font-weight: bold; font-size: 18px;  "  >
                	<a href="inquiry_detail_frm.do?icode=${inq.inquiryCode}" ><c:out value="${inq.status eq 'Y' ? '답변완료' : '진행 중' }"/></a></span></td>
          
           	</tr>
          </c:forEach> 

		</table>

	<div class="bottom-0 py-3 m-auto text-center bg-white">
				<ul class="flex justify-center space-x-2 space-x-reverse">
					<li class="w-4 mr-2"><a class="items-center hidden h-full"
						href="/search?category=1050&amp;page=0"><svg
								stroke="currentColor" fill="currentColor" stroke-width="0"
								viewBox="0 0 24 24" height="1em" width="1em"
								xmlns="http://www.w3.org/2000/svg">
								<path d="M15.41 16.09l-4.58-4.59 4.58-4.59L14 5.5l-6 6 6 6z"></path></svg></a></li>
				
				<c:forEach var="i" begin="1" end="2" step="1">     
				
					<li class="w-10 h-10 rounded-md shrink-0 bg-jngreen/80 text-white">
					 <a class="block leading-10" href="goods_list1.do?category1=${pageVO.category}&amp;pageNo=${i}">${i}</a>
					</li>
					
				</c:forEach>
					
					<li class="w-4 mr-2"><a class="items-center h-full flex"
						href="/search?category=1050&amp;page=2"><svg
								stroke="currentColor" fill="currentColor" stroke-width="0"
								viewBox="0 0 24 24" height="1em" width="1em"
								xmlns="http://www.w3.org/2000/svg">
								<path d="M8.59 16.34l4.58-4.59-4.58-4.59L10 5.75l6 6-6 6z"></path></svg></a></li>
				</ul>
			</div>
</div>
</div>


</main>
 <jsp:include page="/common/cdn/footer.jsp"/> 
</body>
</html>